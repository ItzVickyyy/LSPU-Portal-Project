const bcrypt = require('bcryptjs');
const { getSupabaseAdmin } = require('../_lib/supabase');

module.exports = async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ok:false,msg:'Method not allowed.'});

  try {
    const email = String(req.body?.email || '').trim().toLowerCase();
    const purpose = String(req.body?.purpose || '');
    const code = String(req.body?.otp || '').trim();

    if (!email || !['register','reset'].includes(purpose) || !code) {
      return res.status(400).json({ok:false,msg:'Invalid OTP request.'});
    }

    const supabase = getSupabaseAdmin();
    const { data: row, error } = await supabase.from('portal_otps')
      .select('id, code_hash, expires_at')
      .eq('purpose', purpose)
      .eq('email', email)
      .is('verified_at', null)
      .order('created_at', {ascending:false})
      .limit(1)
      .maybeSingle();

    if (error) throw error;
    if (!row || new Date(row.expires_at).getTime() < Date.now() || !(await bcrypt.compare(code, row.code_hash))) {
      return res.status(400).json({ok:false,msg:'Invalid or expired OTP.'});
    }

    const { error: updateError } = await supabase.from('portal_otps')
      .update({verified_at:new Date().toISOString()})
      .eq('id', row.id);
    if (updateError) throw updateError;

    return res.json({ok:true,msg:'OTP verified.'});
  } catch (error) {
    console.error('OTP verify error:', error);
    return res.status(500).json({ok:false,msg:'Authentication service error.'});
  }
};
