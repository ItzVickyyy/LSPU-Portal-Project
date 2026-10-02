const { getSupabaseAdmin } = require('../_lib/supabase');

module.exports = async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ ok: false, msg: 'Method not allowed.' });

  try {
    const auth = String(req.headers.authorization || '');
    const token = auth.startsWith('Bearer ') ? auth.slice(7) : '';
    if (token) {
      const supabase = getSupabaseAdmin();
      await supabase.auth.admin.signOut(token);
    }
    return res.json({ ok: true });
  } catch (error) {
    console.error('Logout error:', error);
    return res.json({ ok: true });
  }
};
