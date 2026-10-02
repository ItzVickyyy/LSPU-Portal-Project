const { requireAuth } = require('../api/_lib/auth');

module.exports = async function handler(req, res) {
  if (req.method !== 'GET') return res.status(405).json({ ok: false, msg: 'Method not allowed.' });

  try {
    const session = await requireAuth(req);

    if (session.account.account_type !== 'admin') {
      return res.status(403).json({ ok: false, msg: 'Admin access required.' });
    }

    return res.status(200).json({
      ok: true,
      admin_id: session.account.admin_id,
      admin_name: session.name || 'Admin',
      email: session.user.email || '',
      role: session.role
    });
  } catch (error) {
    return res.status(error.status || 500).json({
      ok: false,
      msg: error.status ? error.message : 'Server error.'
    });
  }
};
