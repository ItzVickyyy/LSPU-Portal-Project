const bcrypt = require('bcryptjs');
const { getSupabaseAdmin, getSupabasePublic } = require('../_lib/supabase');

function normalizeEmail(value) {
  return String(value || '').trim().toLowerCase();
}

async function findAuthUserByEmail(supabase, email) {
  const { data, error } = await supabase.auth.admin.listUsers({
    page: 1,
    perPage: 1000
  });

  if (error) throw error;
  return (data.users || []).find(user => (user.email || '').toLowerCase() === email) || null;
}

async function ensureAuthUser(admin, email, password, existingUser) {
  if (!existingUser) {
    const { data, error } = await admin.auth.admin.createUser({
      email,
      password,
      email_confirm: true
    });

    if (error) throw error;
    return data.user;
  }

  const { data, error } = await admin.auth.admin.updateUserById(existingUser.id, {
    password,
    email_confirm: true
  });

  if (error) throw error;
  return data.user;
}

async function signIn(publicClient, email, password) {
  const { data, error } = await publicClient.auth.signInWithPassword({
    email,
    password
  });

  if (error || !data.session || !data.user) {
    const authError = new Error(error?.message || 'Invalid email or password.');
    authError.status = 401;
    throw authError;
  }

  return data;
}

module.exports = async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ ok: false, msg: 'Method not allowed.' });
  }

  try {
    const email = normalizeEmail(req.body?.email);
    const password = String(req.body?.password || '');

    if (!email || !password) {
      return res.status(400).json({ ok: false, msg: 'Please fill in all fields.' });
    }

    const admin = getSupabaseAdmin();

    let account = null;
    let role = 'User';
    let name = '';

    const { data: adminRow, error: adminQueryError } = await admin
      .from('admins')
      .select('admin_id, email, password_hash, first_name, last_name, role, status')
      .ilike('email', email)
      .maybeSingle();

    if (adminQueryError) throw adminQueryError;

    if (adminRow) {
      if (adminRow.status !== 'Active') {
        return res.status(401).json({ ok: false, msg: 'Invalid email or password.' });
      }

      if (!adminRow.password_hash || !(await bcrypt.compare(password, adminRow.password_hash))) {
        return res.status(401).json({ ok: false, msg: 'Invalid email or password.' });
      }

      account = {
        account_type: 'admin',
        admin_id: adminRow.admin_id,
        applicant_id: null
      };
      role = adminRow.role;
      name = [adminRow.first_name, adminRow.last_name].filter(Boolean).join(' ');
    } else {
      const { data: applicantRow, error: applicantQueryError } = await admin
        .from('applicants')
        .select('id, "Email", password_hash, "First_Name", "Last_Name"')
        .ilike('Email', email)
        .maybeSingle();

      if (applicantQueryError) throw applicantQueryError;

      if (!applicantRow || !applicantRow.password_hash ||
          !(await bcrypt.compare(password, applicantRow.password_hash))) {
        return res.status(401).json({ ok: false, msg: 'Invalid email or password.' });
      }

      account = {
        account_type: 'applicant',
        admin_id: null,
        applicant_id: applicantRow.id
      };
      name = [applicantRow.First_Name, applicantRow.Last_Name].filter(Boolean).join(' ');
    }

    const existingUser = await findAuthUserByEmail(admin, email);
    const authUser = await ensureAuthUser(admin, email, password, existingUser);

    const { data: existingMapping, error: mappingQueryError } = await admin
      .from('portal_users')
      .select('id, account_type, admin_id, applicant_id')
      .eq('id', authUser.id)
      .maybeSingle();

    if (mappingQueryError) throw mappingQueryError;

    if (existingMapping) {
      if (
        existingMapping.account_type !== account.account_type ||
        existingMapping.admin_id !== account.admin_id ||
        existingMapping.applicant_id !== account.applicant_id
      ) {
        return res.status(409).json({ ok: false, msg: 'Account mapping conflict.' });
      }
    } else {
      const { error: mappingInsertError } = await admin
        .from('portal_users')
        .insert({
          id: authUser.id,
          account_type: account.account_type,
          admin_id: account.admin_id,
          applicant_id: account.applicant_id
        });

      if (mappingInsertError) throw mappingInsertError;
    }

    const publicClient = getSupabasePublic();
    const session = await signIn(publicClient, email, password);

    return res.status(200).json({
      ok: true,
      msg: 'Login successful.',
      access_token: session.session.access_token,
      refresh_token: session.session.refresh_token,
      expires_at: session.session.expires_at,
      user_id: authUser.id,
      account_type: account.account_type,
      applicant_id: account.applicant_id,
      admin_id: account.admin_id,
      role,
      name,
      email,
      redirect: account.account_type === 'admin'
        ? '../admin/admin.html'
        : '../applicant/applicant_profile.html'
    });
  } catch (error) {
    console.error('Auth login error:', error);
    return res.status(error.status || 500).json({
      ok: false,
      msg: error.status ? error.message : 'Authentication service error.'
    });
  }
};
