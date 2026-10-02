const bcrypt = require('bcryptjs');
const { getSupabaseAdmin, getSupabasePublic } = require('../_lib/supabase');

function email(v) {
  return String(v || '').trim().toLowerCase();
}

function text(v) {
  return String(v || '').trim();
}

module.exports = async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({
      ok: false,
      msg: 'Method not allowed.'
    });
  }

  try {
    const e = email(req.body?.email);
    const first = text(req.body?.first_name);
    const middle = text(req.body?.middle_name);
    const last = text(req.body?.last_name);
    const suffix = text(req.body?.suffix);
    const password = String(req.body?.password || '');
    const confirm = String(req.body?.confirm || '');

    if (
      !e ||
      !first ||
      !last ||
      password.length < 6 ||
      password !== confirm
    ) {
      return res.status(400).json({
        ok: false,
        msg: 'Please provide valid registration details.'
      });
    }

    const db = getSupabaseAdmin();

    // Prevent staff accounts from registering as applicants.
    const { data: admin, error: adminError } = await db
      .from('admins')
      .select('admin_id')
      .eq('email', e)
      .maybeSingle();

    if (adminError) throw adminError;

    if (admin) {
      return res.status(400).json({
        ok: false,
        msg: 'This email is reserved for staff.'
      });
    }

    // Prevent duplicate applicant accounts.
    const { data: existing, error: existingError } = await db
      .from('applicants')
      .select('id')
      .eq('Email', e)
      .maybeSingle();

    if (existingError) throw existingError;

    if (existing) {
      return res.status(400).json({
        ok: false,
        msg: 'Email is already registered.'
      });
    }

    // Registration requires a previously verified OTP.
    const {
      data: otp,
      error: otpError
    } = await db
      .from('portal_otps')
      .select('id')
      .eq('purpose', 'register')
      .eq('email', e)
      .not('verified_at', 'is', null)
      .order('verified_at', { ascending: false })
      .limit(1)
      .maybeSingle();

    if (otpError) throw otpError;

    if (!otp) {
      return res.status(400).json({
        ok: false,
        msg: 'Please verify the registration OTP first.'
      });
    }

    // Create the Supabase Auth account.
    const {
      data: authData,
      error: authError
    } = await db.auth.admin.createUser({
      email: e,
      password,
      email_confirm: true
    });

    if (authError) throw authError;

    const user = authData?.user;

    if (!user?.id) {
      throw new Error(
        'Supabase Auth user was created without a valid UUID.'
      );
    }

    // Keep the legacy password hash because the existing
    // applicants schema still contains password_hash.
    const legacyHash = await bcrypt.hash(password, 10);

    const {
      data: applicant,
      error: applicantError
    } = await db
      .from('applicants')
      .insert({
        Email: e,
        password_hash: legacyHash,
        application_status: 'Draft',
        First_Name: first,
        Middle_Name: middle || null,
        Last_Name: last,
        Suffix: suffix || null
      })
      .select('id')
      .single();

    if (applicantError) {
      console.error('Applicant insert error:', applicantError);

      // Roll back the Auth account if applicant creation failed.
      const {
        error: cleanupError
      } = await db.auth.admin.deleteUser(user.id);

      if (cleanupError) {
        console.error('Auth cleanup error:', cleanupError);
      }

      throw applicantError;
    }

    // Link the Supabase Auth user to the applicant record.
    const { error: mappingError } = await db
      .from('portal_users')
      .insert({
        id: user.id,
        account_type: 'applicant',
        applicant_id: applicant.id
      });

    if (mappingError) {
      console.error('Portal user mapping error:', mappingError);

      // Roll back the applicant and Auth account.
      await db
        .from('applicants')
        .delete()
        .eq('id', applicant.id);

      const {
        error: cleanupError
      } = await db.auth.admin.deleteUser(user.id);

      if (cleanupError) {
        console.error('Auth cleanup error:', cleanupError);
      }

      throw mappingError;
    }

    // Sign the newly created user in using the public Supabase client.
    const pub = getSupabasePublic();

    const {
      data: sessionData,
      error: sessionError
    } = await pub.auth.signInWithPassword({
      email: e,
      password
    });

    if (sessionError) throw sessionError;

    if (!sessionData?.session) {
      throw new Error(
        'Registration succeeded, but no authentication session was returned.'
      );
    }

    return res.json({
      ok: true,
      msg: 'Registration successful.',
      access_token: sessionData.session.access_token,
      refresh_token: sessionData.session.refresh_token,
      applicant_id: applicant.id,
      redirect: '../applicant/applicant_profile.html'
    });

  } catch (error) {
    console.error('Registration error:', error);

    return res.status(500).json({
      ok: false,
      msg: 'Registration failed.'
    });
  }
};