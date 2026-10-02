const { requireAuth } = require('./_lib/auth');
const { getSupabaseAdmin } = require('./_lib/supabase');

const STAFF = ['Super Admin', 'Admin', 'Registrar'];
const ADMIN = ['Super Admin', 'Admin'];

function send(res, ok, msg, extra = {}, status = ok ? 200 : 400) {
  return res.status(status).json({ ok, msg, ...extra });
}

function requireRole(session, roles) {
  if (!roles.includes(session.role)) {
    const e = new Error('Access denied. You do not have permission to perform this action.');
    e.status = 403;
    throw e;
  }
}

async function getMany(supabase, table, query = {}) {
  let q = supabase.from(table).select(query.select || '*');
  for (const [key, value] of Object.entries(query.eq || {})) q = q.eq(key, value);
  if (query.order) q = q.order(query.order.column, { ascending: query.order.ascending ?? false });
  const { data, error } = await q;
  if (error) throw error;
  return data || [];
}

async function referenceResource(supabase, resource, method, body, query, session) {
  if (method === 'GET') {
    if (resource === 'colleges') {
      const data = await getMany(supabase, 'colleges', { order: { column: 'college_id', ascending: true } });
      return { data };
    }
    if (resource === 'campus') {
      const data = await getMany(supabase, 'campus', { order: { column: 'Campus_Id', ascending: true } });
      return { data };
    }
    if (resource === 'semesters') {
      const data = await getMany(supabase, 'semester', { order: { column: 'semester_id', ascending: false } });
      return { data };
    }
    if (resource === 'programs') {
      let q = supabase.from('programs').select('*, colleges(college_name), specializations(*)').order('Program_Code', { ascending: true });
      const { data, error } = await q;
      if (error) throw error;
      return { data: data || [] };
    }
    if (resource === 'subjects') {
      let q = supabase.from('subjects').select('*, colleges(college_name)').order('Subject_Id', { ascending: true });
      if (query.search) q = q.ilike('Subject_Name', `%${query.search}%`);
      if (query.college) q = q.eq('College_Id', Number(query.college));
      const { data, error } = await q;
      if (error) throw error;
      return { data: data || [] };
    }
    if (resource === 'instructors') {
      let q = supabase.from('instructors').select('*, campus(Campus_Name), colleges(college_name), subjects(Subject_Name)').order('Instructor_ID', { ascending: true });
      if (query.search) q = q.or(`First_Name.ilike.%${query.search}%,Last_Name.ilike.%${query.search}%`);
      if (query.college) q = q.eq('College_ID', Number(query.college));
      const { data, error } = await q;
      if (error) throw error;
      return { data: data || [] };
    }
  }

  if (method !== 'POST') return null;

  if (resource === 'programs') {
    requireRole(session, ADMIN);
    if (body.action === 'create') {
      const { data, error } = await supabase.from('programs').insert({
        Program_Code: body.program_code,
        Program_Name: body.program_name,
        college_id: body.college_id ? Number(body.college_id) : null
      }).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'add_specialization') {
      const { data, error } = await supabase.from('specializations').insert({
        Program_Code: body.program_code,
        specialization: body.specialization
      }).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'delete') {
      const { error } = await supabase.from('programs').delete().eq('Program_Code', body.program_code);
      if (error) throw error;
      return {};
    }
  }

  if (resource === 'subjects') {
    requireRole(session, ADMIN);
    if (body.action === 'create') {
      const { data, error } = await supabase.from('subjects').insert({
        Subject_Id: body.subject_id,
        Subject_Name: body.subject_name,
        College_Id: body.college_id ? Number(body.college_id) : null
      }).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'delete') {
      const { error } = await supabase.from('subjects').delete().eq('Subject_Id', body.subject_id);
      if (error) throw error;
      return {};
    }
  }

  if (resource === 'instructors') {
    requireRole(session, ADMIN);
    if (body.action === 'create') {
      const { data, error } = await supabase.from('instructors').insert(body).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'delete') {
      const { error } = await supabase.from('instructors').delete().eq('Instructor_ID', Number(body.instructor_id));
      if (error) throw error;
      return {};
    }
  }

  if (resource === 'campus') {
    requireRole(session, ADMIN);
    if (body.action === 'create') {
      const { data, error } = await supabase.from('campus').insert({
        Campus_Name: body.campus_name
      }).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'update') {
      const { data, error } = await supabase.from('campus').update({
        Campus_Name: body.campus_name
      }).eq('Campus_Id', Number(body.campus_id)).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'delete') {
      const { error } = await supabase.from('campus').delete().eq('Campus_Id', Number(body.campus_id));
      if (error) throw error;
      return {};
    }
  }

  if (resource === 'sections') {
    requireRole(session, ADMIN);
    if (body.action === 'create') {
      const { data, error } = await supabase.from('section').insert({
        section_name: body.section_name,
        program_code: body.program_code,
        campus_id: body.campus_id ? Number(body.campus_id) : null
      }).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'delete') {
      const { error } = await supabase.from('section').delete().eq('section_id', Number(body.section_id));
      if (error) throw error;
      return {};
    }
  }

  if (resource === 'semesters') {
    requireRole(session, ADMIN);
    if (body.action === 'create') {
      const { data, error } = await supabase.from('semester').insert(body).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'update') {
      const { data, error } = await supabase.from('semester').update(body).eq('semester_id', Number(body.semester_id)).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'update_status') {
      const { data, error } = await supabase.from('semester').update({ status: body.status }).eq('semester_id', Number(body.semester_id)).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'delete') {
      const { error } = await supabase.from('semester').delete().eq('semester_id', Number(body.semester_id));
      if (error) throw error;
      return {};
    }
  }

  if (resource === 'colleges') {
    requireRole(session, ADMIN);
    if (body.action === 'create') {
      const { data, error } = await supabase.from('colleges').insert(body).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'update') {
      const { data, error } = await supabase.from('colleges').update(body).eq('college_id', Number(body.college_id)).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'delete') {
      const { error } = await supabase.from('colleges').delete().eq('college_id', Number(body.college_id));
      if (error) throw error;
      return {};
    }
  }

  return null;
}

module.exports = async function handler(req, res) {
  try {
    const session = await requireAuth(req);
    if (session.account.account_type !== 'admin') return send(res, false, 'Admin access required.', {}, 403);
    requireRole(session, STAFF);

    const supabase = getSupabaseAdmin();
    const resource = String(req.query.resource || '');
    const body = req.body || {};
    const query = req.query || {};

    const result = await referenceResource(supabase, resource, req.method, body, query, session);
    if (result) return send(res, true, 'ok', result);

    if (resource === 'dashboard' && req.method === 'GET') {
      const [applicants, students, enrollments, payments] = await Promise.all([
        getMany(supabase, 'applicants'),
        getMany(supabase, 'students'),
        getMany(supabase, 'enrollment'),
        getMany(supabase, 'payment')
      ]);
      const byStatus = {};
      applicants.forEach(a => { byStatus[a.application_status] = (byStatus[a.application_status] || 0) + 1; });
      const data = {
        enrolled: byStatus.Enrolled || 0,
        pending: byStatus.Pending || 0,
        submitted: byStatus.Submitted || 0,
        draft: byStatus.Draft || 0,
        rejected: byStatus.Rejected || 0,
        total_applicants: (byStatus.Pending || 0) + (byStatus.Submitted || 0) + (byStatus.Draft || 0) + (byStatus.Rejected || 0),
        total_students: students.length,
        active_students: students.filter(s => s.Status === 'Active').length,
        active_enrollments: enrollments.filter(e => e.status === 'Enrolled').length,
        total_revenue: payments.filter(p => p.status === 'Paid').reduce((sum, p) => sum + Number(p.amount || 0), 0),
        recent_applicants: applicants.filter(a => a.application_status !== 'Enrolled').sort((a,b) => new Date(b.created_at)-new Date(a.created_at)).slice(0,5),
        status_distribution: byStatus
      };
      return send(res, true, 'ok', { data });
    }

    return send(res, false, 'Resource not migrated yet.', {}, 501);
  } catch (error) {
    console.error('Admin API error:', error);
    return send(res, false, error.status ? error.message : 'Server error.', {}, error.status || 500);
  }
};
