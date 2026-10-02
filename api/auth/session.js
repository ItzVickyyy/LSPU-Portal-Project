const { requireAuth } = require('../_lib/auth');

module.exports = async function handler(req, res) {
  if (req.method !== 'GET') {
    return res.status(405).json({ ok: false, msg: 'Method not allowed.' });
  }

  try {
    const session = await requireAuth(req);
    return res.status(200).json({
      ok: true,
      user_id: session.user.id,
      account_type: session.account.account_type,
      admin_id: session.account.admin_id,
      applicant_id: session.account.applicant_id,
      role: session.role,
      name: session.name,
      email: session.user.email || ''
    });
  } catch (error) {
    return res.status(error.status || 500).json({
      ok: false,
      msg: error.status ? error.message : 'Server error.'
    });
  }
};
