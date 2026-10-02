const bcrypt = require('bcryptjs');
const { getSupabaseAdmin } = require('../_lib/supabase');

function emailOf(v) { return String(v || '').trim().toLowerCase(); }

module.exports = async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ ok:false, msg:'Method not allowed.' });

  try {
    const action = String(req.body?.action || '');
    const email = emailOf(req.body?.email);
    if (!email || !/^\S+@\S+\.\S+$/.test(email)) return res.status(400).json({ok:false,msg:'Invalid email.'});

    const supabase = getSupabaseAdmin();

    if (action === 'check_email') {
      const { data: applicant, error: ae } = await supabase.from('applicants').select('id').eq('Email', email).maybeSingle();
      if (ae) throw ae;
      return res.json({ok:true, exists:!!applicant});
    }

    if (!['register','reset'].includes(action)) return res.status(400).json({ok:false,msg:'Invalid OTP action.'});

    const code = String(Math.floor(100000 + Math.random() * 900000));
    const hash = await bcrypt.hash(code, 10);
    const { error } = await supabase.from('portal_otps').insert({
      purpose: action,
      email,
      code_hash: hash,
      expires_at: new Date(Date.now() + 10 * 60 * 1000).toISOString()
    });
    if (error) throw error;

    return res.json({ok:true,msg:'OTP generated.',dev_otp:code});
  } catch (error) {
    console.error('OTP error:', error);
    return res.status(500).json({ok:false,msg:'Authentication service error.'});
  }
};
