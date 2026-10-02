const { getSupabaseAdmin } = require('./supabase');

async function requireAuth(req) {
  const header = req.headers.authorization || '';
  const match = header.match(/^Bearer\s+(.+)$/i);
  if (!match) {
    const error = new Error('Not authenticated.');
    error.status = 401;
    throw error;
  }

  const supabase = getSupabaseAdmin();
  const { data, error } = await supabase.auth.getUser(match[1]);

  if (error || !data.user) {
    const authError = new Error('Not authenticated.');
    authError.status = 401;
    throw authError;
  }

  const { data: account, error: accountError } = await supabase
    .from('portal_users')
    .select('id, account_type, admin_id, applicant_id')
    .eq('id', data.user.id)
    .maybeSingle();

  if (accountError || !account) {
    const accountMissing = new Error('Account mapping not found.');
    accountMissing.status = 403;
    throw accountMissing;
  }

  let role = 'User';
  let name = data.user.email || '';

  if (account.account_type === 'admin') {
    const { data: admin, error: adminError } = await supabase
      .from('admins')
      .select('admin_id, email, first_name, last_name, role, status')
      .eq('admin_id', account.admin_id)
      .maybeSingle();

    if (adminError || !admin || admin.status !== 'Active') {
      const adminErrorResult = new Error('Admin account is inactive or unavailable.');
      adminErrorResult.status = 403;
      throw adminErrorResult;
    }

    role = admin.role;
    name = [admin.first_name, admin.last_name].filter(Boolean).join(' ');
  } else {
    const { data: applicant, error: applicantError } = await supabase
      .from('applicants')
      .select('id, "Email", "First_Name", "Last_Name"')
      .eq('id', account.applicant_id)
      .maybeSingle();

    if (applicantError || !applicant) {
      const applicantErrorResult = new Error('Applicant account is unavailable.');
      applicantErrorResult.status = 403;
      throw applicantErrorResult;
    }

    name = [applicant.First_Name, applicant.Last_Name].filter(Boolean).join(' ');
  }

  return {
    user: data.user,
    account,
    role,
    name
  };
}

module.exports = { requireAuth };
