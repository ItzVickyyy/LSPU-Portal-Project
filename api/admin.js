const { requireAuth } = require('./_lib/auth');
const { getSupabaseAdmin } = require('./_lib/supabase');

const STAFF = ['Super Admin', 'Admin', 'Registrar'];
const ADMIN = ['Super Admin', 'Admin'];

function first(value) { return Array.isArray(value) ? (value[0] || null) : value; }

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

async function academicResource(supabase, resource, method, body, query) {
  if (resource === 'enrollment' && method === 'GET') {
    let q = supabase.from('enrollment').select('enrollment_id, status, enrollment_date, student_id, students(student_id, applicants(First_Name, Last_Name), intended_course(Program_Code, programs(Program_Name))), section(section_name), semester(semester_name), year(academic_year)').order('enrollment_date', {ascending:false});
    if (query.student_id) q = q.eq('student_id', Number(query.student_id));
    const {data,error}=await q; if(error)throw error;
    return {data:(data||[]).map(e=>({...e, student_id:e.students?.student_id, student_name:[e.students?.applicants?.First_Name,e.students?.applicants?.Last_Name].filter(Boolean).join(' '), Program_Code:e.students?.intended_course?.[0]?.Program_Code||null, Program_Name:e.students?.intended_course?.[0]?.programs?.Program_Name||null, section_name:e.section?.section_name||null, semester_name:e.semester?.semester_name||null, academic_year:e.year?.academic_year||null}))};
  }
  if(resource==='grades'){
    if(method==='GET'){
      if(query.student_id){
        const {data,error}=await supabase.from('grades').select('grade_id, class_engagement, learning_outputs, quizzes, midterm, final, total, final_grade, remarks, enrolled_subjects(subjects(Subject_Code,Subject_Name,Credits), instructors(First_Name,Last_Name), enrollment(student_id))').eq('enrolled_subjects.enrollment.student_id',Number(query.student_id));
        if(error)throw error; return {data:data||[]};
      }
      const {data,error}=await supabase.from('grades').select('grade_id, enrolled_subjects(enrollment(student_id, students(student_id, applicants(First_Name,Middle_Name,Last_Name,Email)), semester(semester_name)), subjects(Subject_Code))');
      if(error)throw error;
      const seen=new Set(), rows=[];
      for(const g of data||[]){const s=g.enrolled_subjects?.enrollment?.students;if(!s||seen.has(s.student_id))continue;seen.add(s.student_id);rows.push({id:g.enrolled_subjects.enrollment.student_id,student_id:s.student_id,student_name:[s.applicants?.First_Name,s.applicants?.Middle_Name,s.applicants?.Last_Name].filter(Boolean).join(' '),Email:s.applicants?.Email,Program_Code:null,semester_name:g.enrolled_subjects.enrollment.semester?.semester_name||null});}
      return {data:rows};
    }
    if(method==='POST'&&body.action==='update'){
      const id=Number(body.grade_id);
      const vals=['class_engagement','learning_outputs','quizzes','midterm','final'].map(k=>Number(body[k]||0));
      const total=Math.round(vals.reduce((a,b)=>a+b,0)*0.2*100)/100;
      const avg=vals.reduce((a,b)=>a+b,0)/5;
      const final_grade=avg>=99?'1.00':avg>=96?'1.25':avg>=93?'1.50':avg>=90?'1.75':avg>=87?'2.00':avg>=84?'2.25':avg>=81?'2.50':avg>=78?'2.75':avg>=75?'3.00':avg>=70?'4.0':'5.0';
      const remarks=total>=75?'Passed':total>=70?'Conditional Failure':'Failed';
      const {error}=await supabase.from('grades').update({class_engagement:vals[0],learning_outputs:vals[1],quizzes:vals[2],midterm:vals[3],final:vals[4],total,final_grade,remarks}).eq('grade_id',id);
      if(error)throw error; return {msg:'Grade updated.'};
    }
  }
  if(resource==='payments'){
    if(method==='GET'){
      let q=supabase.from('payment').select('payment_id, amount, payment_date, payment_method, status, student_id, students(student_id, applicants(First_Name,Last_Name)), semester(semester_name), year(academic_year), receipt(receipt_number)').order('payment_date',{ascending:false});
      if(query.student_id)q=q.eq('student_id',Number(query.student_id));
      if(query.status)q=q.eq('status',query.status);
      const {data,error}=await q;if(error)throw error;
      let rows=(data||[]).map(p=>({...p,student_id:p.students?.student_id,student_name:[first(p.students)?.applicants?.First_Name,p.students?.applicants?.Last_Name].filter(Boolean).join(' '),semester_name:p.semester?.semester_name||null,academic_year:p.year?.academic_year||null,receipt_number:p.receipt?.receipt_number||null}));
      if(query.search)rows=rows.filter(p=>[p.student_name,p.student_id,p.receipt_number].some(v=>String(v||'').toLowerCase().includes(query.search.toLowerCase())));
      return {data:rows};
    }
    if(method==='POST'&&body.action==='update_status'){const {error}=await supabase.from('payment').update({status:body.status}).eq('payment_id',Number(body.payment_id));if(error)throw error;return {msg:'Payment status updated.'};}
  }
  if(resource==='schedule'&&method==='GET'){
    const {data,error}=await supabase.from('schedule').select('schedule_id, day, time_start, time_end, room, subjects(Subject_Code,Subject_Name), instructors(First_Name,Last_Name), section(section_name), semester(semester_name), year(academic_year)').order('day').order('time_start');
    if(error)throw error;
    return {data:(data||[]).map(s=>({...s,Subject_Code:s.subjects?.Subject_Code,Subject_Name:s.subjects?.Subject_Name,instructor_name:[s.instructors?.First_Name,s.instructors?.Last_Name].filter(Boolean).join(' '),section_name:s.section?.section_name,semester_name:s.semester?.semester_name,academic_year:s.year?.academic_year}))};
  }
  return null;
}

async function adminResource(supabase, method, body, session) {
  requireRole(session, ['Super Admin']);

  if (method === 'GET') {
    const { data, error } = await supabase.from('admins').select('admin_id, email, first_name, last_name, role, status, created_at').order('admin_id');
    if (error) throw error;
    return { data: data || [] };
  }

  if (method === 'POST') {
    const id = Number(body.admin_id);
    if (body.action === 'create') {
      const password = String(body.password || '');
      if (!body.first_name || !body.last_name || !body.email || password.length < 6) {
        const e = new Error('All fields are required and password must be at least 6 characters.');
        e.status = 400; throw e;
      }
      if (!['Super Admin','Admin','Registrar'].includes(body.role)) {
        const e = new Error('Invalid role.'); e.status = 400; throw e;
      }

      const { data: authUser, error: authError } = await supabase.auth.admin.createUser({
        email: String(body.email).trim().toLowerCase(),
        password,
        email_confirm: true
      });
      if (authError) throw authError;

      const { data: admin, error } = await supabase.from('admins').insert({
        email: String(body.email).trim().toLowerCase(),
        password_hash: await require('bcryptjs').hash(password, 10),
        first_name: body.first_name,
        last_name: body.last_name,
        role: body.role
      }).select('admin_id, email, first_name, last_name, role, status, created_at').single();

      if (error) {
        await supabase.auth.admin.deleteUser(authUser.user.id);
        throw error;
      }

      const { error: mapError } = await supabase.from('portal_users').insert({
        id: authUser.user.id,
        account_type: 'admin',
        admin_id: admin.admin_id
      });
      if (mapError) {
        await supabase.from('admins').delete().eq('admin_id', admin.admin_id);
        await supabase.auth.admin.deleteUser(authUser.user.id);
        throw mapError;
      }
      return { msg: 'Account created.', data: admin };
    }

    if (body.action === 'update_status') {
      if (id === session.account.admin_id) {
        const e = new Error('You cannot change your own status.'); e.status = 400; throw e;
      }
      if (!['Active','Inactive'].includes(body.status)) {
        const e = new Error('Invalid status.'); e.status = 400; throw e;
      }
      const { error } = await supabase.from('admins').update({ status: body.status }).eq('admin_id', id);
      if (error) throw error;
      return { msg: 'Status updated.' };
    }

    if (body.action === 'update_role') {
      if (id === session.account.admin_id) {
        const e = new Error('You cannot change your own role.'); e.status = 400; throw e;
      }
      if (!['Super Admin','Admin','Registrar'].includes(body.role)) {
        const e = new Error('Invalid role.'); e.status = 400; throw e;
      }
      const { error } = await supabase.from('admins').update({ role: body.role }).eq('admin_id', id);
      if (error) throw error;
      return { msg: 'Role updated.' };
    }

    if (body.action === 'reset_password') {
      const password = String(body.password || '');
      if (password.length < 6) {
        const e = new Error('Password must be at least 6 characters.'); e.status = 400; throw e;
      }
      const { data: admin, error } = await supabase.from('admins').select('email').eq('admin_id', id).maybeSingle();
      if (error) throw error;
      if (!admin) {
        const e = new Error('Admin account not found.'); e.status = 404; throw e;
      }
      const { data: users, error: ue } = await supabase.auth.admin.listUsers({page:1,perPage:1000});
      if (ue) throw ue;
      const user = (users.users || []).find(u => (u.email || '').toLowerCase() === admin.email.toLowerCase());
      if (!user) {
        const e = new Error('Supabase Auth account not found.'); e.status = 404; throw e;
      }
      const { error: pe } = await supabase.auth.admin.updateUserById(user.id, { password });
      if (pe) throw pe;
      const { error: le } = await supabase.from('admins').update({ password_hash: await require('bcryptjs').hash(password,10) }).eq('admin_id', id);
      if (le) throw le;
      return { msg: 'Password reset.' };
    }
  }
  return null;
}

async function studentResource(supabase, method, body, query) {
  if (method === 'GET') {
    const id = query.id ? Number(query.id) : null;
    if (id) {
      const { data, error } = await supabase.from('students').select('*, applicants(*), admission_info(*), intended_course(*, programs(Program_Name)), section(section_name), semester(semester_name), family_info(*), educational_background(*)').eq('id', id).maybeSingle();
      if (error) throw error;
      if (data?.applicants) delete data.applicants.password_hash;
      return { data };
    }

    let q = supabase.from('students').select('id, student_id, Status, Enrollment_Date, year_level, section_id, semester_id, applicant_id, first_name, middle_name, last_name, email, contact_number, campus, program_code, applicants(First_Name, Middle_Name, Last_Name, Email, Contact_Number), admission_info(campus), intended_course(Program_Code, programs(Program_Name)), section(section_name), semester(semester_name)').order('id', { ascending: false });
    if (query.status) q = q.eq('Status', query.status);
    if (query.search) q = q.or(`student_id.ilike.%${query.search}%,first_name.ilike.%${query.search}%,last_name.ilike.%${query.search}%,email.ilike.%${query.search}%`);
    const { data, error } = await q;
    if (error) throw error;

    let rows = (data || []).map(s => ({
      ...s,
      full_name: [s.applicants?.First_Name || s.first_name, s.applicants?.Middle_Name || s.middle_name, s.applicants?.Last_Name || s.last_name].filter(Boolean).join(' '),
      Email: s.applicants?.Email || s.email,
      Contact_Number: s.applicants?.Contact_Number || s.contact_number,
      campus: first(s.admission_info)?.campus || s.campus,
      Program_Code: first(s.intended_course)?.Program_Code || s.program_code,
      Program_Name: first(s.intended_course)?.programs?.Program_Name || null,
      section_name: s.section?.section_name || null,
      semester_name: s.semester?.semester_name || null
    }));
    if (query.campus) rows = rows.filter(r => r.campus === query.campus);
    if (query.program) rows = rows.filter(r => r.Program_Code === query.program);
    if (query.section) rows = rows.filter(r => r.section_name === query.section);
    if (query.year_level) rows = rows.filter(r => r.year_level === query.year_level);
    if (query.date_from) rows = rows.filter(r => String(r.Enrollment_Date || '').slice(0,10) >= query.date_from);
    if (query.date_to) rows = rows.filter(r => String(r.Enrollment_Date || '').slice(0,10) <= query.date_to);
    return { data: rows };
  }

  if (method === 'POST') {
    const id = Number(body.student_id);
    if (!id) return null;
    if (body.action === 'enroll_from_applicant' || body.action === 'bulk_enroll_from_applicants') {
      const ids = body.action === 'bulk_enroll_from_applicants'
        ? (Array.isArray(body.applicant_ids) ? body.applicant_ids.map(Number).filter(Boolean) : [])
        : [Number(body.applicant_id)].filter(Boolean);
      const sectionId = Number(body.section_id);
      const semesterId = Number(body.semester_id);
      if (!ids.length || !sectionId || !semesterId) {
        const e = new Error('applicant_id(s), section_id, and semester_id are required.'); e.status = 400; throw e;
      }

      const year = new Date().getFullYear();
      const { data: existingStudents, error: existingError } = await supabase.from('students').select('student_id').like('student_id', `${year}-%`).order('student_id', {ascending:false}).limit(1);
      if (existingError) throw existingError;
      let nextNumber = Number(String(existingStudents?.[0]?.student_id || `${year}-0000`).split('-')[1]) + 1;

      let enrolled = 0, alreadyExisted = 0, failed = 0;
      const studentNumbers = [], errors = [];

      for (const applicantId of ids) {
        const { data: existing } = await supabase.from('students').select('id, student_id').eq('applicant_id', applicantId).maybeSingle();
        if (existing) {
          await supabase.from('applicants').update({application_status:'Enrolled'}).eq('id', applicantId);
          alreadyExisted++;
          studentNumbers.push(existing.student_id);
          continue;
        }

        const { data: applicant, error: applicantError } = await supabase.from('applicants')
          .select('id, Email, First_Name, Middle_Name, Last_Name, Suffix, Contact_Number, admission_info(campus, year_level), intended_course(Program_Code)')
          .eq('id', applicantId).maybeSingle();
        if (applicantError) throw applicantError;
        if (!applicant) { failed++; errors.push(`ID ${applicantId}: Applicant not found.`); continue; }

        const admission = first(applicant.admission_info);
        const course = first(applicant.intended_course);
        const studentNumber = `${year}-${String(nextNumber++).padStart(4,'0')}`;
        const { error: insertError } = await supabase.from('students').insert({
          student_id: studentNumber,
          applicant_id: applicantId,
          first_name: applicant.First_Name,
          middle_name: applicant.Middle_Name,
          last_name: applicant.Last_Name,
          suffix: applicant.Suffix,
          email: applicant.Email,
          contact_number: applicant.Contact_Number,
          program_code: course?.Program_Code || null,
          campus: admission?.campus || null,
          year_level: body.year_level || admission?.year_level || '1st Year',
          section_id: sectionId,
          semester_id: semesterId,
          Enrollment_Date: new Date().toISOString().slice(0,10),
          Status: 'Active',
          created_at: new Date().toISOString()
        });
        if (insertError) { failed++; errors.push(`ID ${applicantId}: ${insertError.message}`); continue; }

        await supabase.from('applicants').update({application_status:'Enrolled'}).eq('id', applicantId);
        enrolled++;
        studentNumbers.push(studentNumber);
      }

      return {
        msg: `Enrollment complete: ${enrolled} new, ${alreadyExisted} already existed, ${failed} failed.`,
        enrolled, already_existed: alreadyExisted, failed, student_numbers: studentNumbers, errors
      };
    }

    if (body.action === 'update_status') {
      const { error } = await supabase.from('students').update({ Status: body.status }).eq('id', id);
      if (error) throw error;
      return { msg: 'Status updated.' };
    }
    if (body.action === 'update') {
      const updates = {};
      for (const [key, column] of [['section_id','section_id'],['year_level','year_level'],['campus','campus'],['program_code','program_code'],['email','email'],['contact_number','contact_number']]) {
        if (body[key] !== undefined && body[key] !== '') updates[column] = body[key];
      }
      if (!Object.keys(updates).length) return { msg: 'Nothing to update.' };
      if (updates.section_id) updates.section_id = Number(updates.section_id);
      const { error } = await supabase.from('students').update(updates).eq('id', id);
      if (error) throw error;
      return { msg: 'Student updated.' };
    }
  }
  return null;
}

async function applicantResource(supabase, method, body, query, session) {
  if (method === 'GET') {
    const id = query.id ? Number(query.id) : null;

    if (id) {
      const [a, ai, ic, fi, eb, log] = await Promise.all([
        supabase.from('applicants').select('*').eq('id', id).maybeSingle(),
        supabase.from('admission_info').select('*').eq('applicant_id', id).maybeSingle(),
        supabase.from('intended_course').select('*, programs(Program_Name, college_id, colleges(college_name))').eq('applicant_id', id).maybeSingle(),
        supabase.from('family_info').select('*').eq('applicant_id', id).maybeSingle(),
        supabase.from('educational_background').select('*').eq('applicant_id', id).maybeSingle(),
        supabase.from('applicant_status_log').select('status, changed_by, changed_at').eq('applicant_id', id).order('changed_at', { ascending: true })
      ]);
      for (const q of [a, ai, ic, fi, eb, log]) if (q.error) throw q.error;

      const row = a.data ? { ...a.data } : null;
      if (row) delete row.password_hash;
      if (ai.data) Object.assign(row || {}, ai.data);
      if (ic.data) {
        Object.assign(row || {}, {
          Program_Code: ic.data.Program_Code,
          Specialization: ic.data.Specialization,
          Program_Name: ic.data.programs?.Program_Name || null,
          college_name: ic.data.programs?.colleges?.college_name || null
        });
      }
      if (fi.data) Object.assign(row || {}, fi.data);
      if (eb.data) Object.assign(row || {}, eb.data);

      return { data: row, status_log: log.data || [] };
    }

    let q = supabase.from('applicants')
      .select('id, Email, First_Name, Middle_Name, Last_Name, application_status, Contact_Number, Sex, created_at, admission_info(campus, year_level), intended_course(Program_Code, programs(Program_Name)), students(student_id)')
      .neq('application_status', 'Enrolled')
      .order('created_at', { ascending: false });

    if (query.search) {
      const term = query.search.replace(/,/g, '');
      q = q.or(`First_Name.ilike.%${term}%,Last_Name.ilike.%${term}%,Email.ilike.%${term}%`);
    }
    if (query.status) q = q.eq('application_status', query.status);

    const { data: raw, error } = await q;
    if (error) throw error;

    let rows = (raw || []).map(a => ({
      id: a.id,
      student_id: a.students?.[0]?.student_id || null,
      full_name: [a.First_Name, a.Middle_Name, a.Last_Name].filter(Boolean).join(' '),
      Email: a.Email,
      application_status: a.application_status,
      Contact_Number: a.Contact_Number,
      Sex: a.Sex,
      created_at: a.created_at,
      campus: first(a.admission_info)?.campus || null,
      year_level: first(a.admission_info)?.year_level || null,
      Program_Code: first(a.intended_course)?.Program_Code || null,
      Program_Name: first(a.intended_course)?.programs?.Program_Name || null
    }));

    if (query.campus) rows = rows.filter(r => r.campus === query.campus);
    if (query.program) rows = rows.filter(r => r.Program_Code === query.program);
    if (query.date_from) rows = rows.filter(r => String(r.created_at).slice(0, 10) >= query.date_from);
    if (query.date_to) rows = rows.filter(r => String(r.created_at).slice(0, 10) <= query.date_to);

    const { count, error: countError } = await supabase.from('applicants').select('id', { count: 'exact', head: true }).eq('application_status', 'Enrolled');
    if (countError) throw countError;

    return { data: rows, enrolled_count: count || 0 };
  }

  if (method === 'POST') {
    const id = Number(body.applicant_id || body.student_id);
    if (!id) return null;

    if (body.action === 'update_status') {
      const allowed = ['Pending', 'Draft', 'Submitted', 'Enrolled', 'Rejected'];
      if (!allowed.includes(body.status)) {
        const e = new Error('Invalid status.');
        e.status = 400;
        throw e;
      }
      const { error } = await supabase.from('applicants').update({ application_status: body.status }).eq('id', id);
      if (error) throw error;
      const { error: logError } = await supabase.from('applicant_status_log').insert({
        applicant_id: id,
        status: body.status,
        changed_by: session.name || session.role
      });
      if (logError) throw logError;
      return { msg: 'Status updated.' };
    }

    if (body.action === 'delete') {
      const { data: student } = await supabase.from('students').select('id, student_id').eq('applicant_id', id).maybeSingle();
      if (student) {
        const e = new Error(`Cannot delete: this applicant has already been enrolled as a student (ID: ${student.student_id}). Remove the student record first.`);
        e.status = 400;
        throw e;
      }
      const { error } = await supabase.from('applicants').delete().eq('id', id);
      if (error) throw error;
      return { msg: 'Applicant deleted.' };
    }
  }
  return null;
}

async function referenceResource(supabase, resource, method, body, query, session) {
  if (method === 'GET') {
    if (resource === 'colleges') {
      const { data: colleges, error } = await supabase.from('colleges').select('college_id, college_name, college_code, college_email, programs(count)').order('college_name');
      if (error) throw error;
      const data = (colleges || []).map(c => ({ ...c, program_count: c.programs?.[0]?.count || 0 }));
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
      let q = supabase.from('programs').select('Program_Code, Program_Name, college_id, colleges(college_name), specializations(spec_code, spec_name)').order('Program_Code', { ascending: true });
      const { data, error } = await q;
      if (error) throw error;
      return { data: (data || []).map(p => ({ ...p, college_name: p.colleges?.college_name || null, spec_count: p.specializations?.length || 0 })) };
    }
    if (resource === 'subjects') {
      let q = supabase.from('subjects').select('*, colleges(college_name)').order('Subject_Id', { ascending: true });
      if (query.search) q = q.or(`Subject_Code.ilike.%${query.search}%,Subject_Name.ilike.%${query.search}%`);
      if (query.college) q = q.eq('College_Id', Number(query.college));
      const { data, error } = await q;
      if (error) throw error;
      return { data: (data || []).map(s => ({ ...s, college_name: s.colleges?.college_name || null })) };
    }
    if (resource === 'instructors') {
      let q = supabase.from('instructors').select('*, campus(Campus_Name), colleges(college_name), subjects(Subject_Name)').order('Instructor_ID', { ascending: true });
      if (query.search) q = q.or(`First_Name.ilike.%${query.search}%,Last_Name.ilike.%${query.search}%,Degree.ilike.%${query.search}%`);
      if (query.college) q = q.eq('College_ID', Number(query.college));
      const { data, error } = await q;
      if (error) throw error;
      return { data: (data || []).map(i => ({ ...i, instructor_id: i.Instructor_ID, Subject_Code: i.subjects?.Subject_Code || null, Subject_Name: i.subjects?.Subject_Name || null, college_name: i.colleges?.college_name || null, Campus_Name: i.campus?.Campus_Name || null })) };
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
        spec_code: body.spec_code || body.specialization,
        spec_name: body.spec_name || body.specialization
      }).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'update') {
      const { data, error } = await supabase.from('programs').update({
        Program_Code: body.program_code,
        Program_Name: body.program_name,
        college_id: body.college_id ? Number(body.college_id) : null
      }).eq('Program_Code', body.orig_code).select().single();
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
    if (body.action === 'update') {
      const { data: existing, error: findError } = await supabase.from('subjects').select('Subject_Id').eq('Subject_Code', body.orig_code).maybeSingle();
      if (findError) throw findError;
      if (!existing) { const e = new Error('Subject not found.'); e.status = 404; throw e; }
      const { data, error } = await supabase.from('subjects').update({
        Subject_Code: body.subject_code,
        Subject_Name: body.subject_name,
        Credits: Number(body.credits || 0),
        College_Id: body.college_id ? Number(body.college_id) : null
      }).eq('Subject_Id', existing.Subject_Id).select().single();
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
    if (body.action === 'update') {
      const subject = body.subject_code ? await supabase.from('subjects').select('Subject_Id').eq('Subject_Code', body.subject_code).maybeSingle() : {data:null,error:null};
      const campus = body.campus_name ? await supabase.from('campus').select('Campus_Id').eq('Campus_Name', body.campus_name).maybeSingle() : {data:null,error:null};
      if (subject.error) throw subject.error;
      if (campus.error) throw campus.error;
      const { data, error } = await supabase.from('instructors').update({
        First_Name: body.first_name,
        Middle_Name: body.middle_name || null,
        Last_Name: body.last_name,
        Suffix_Title: body.suffix_title || null,
        Degree: body.degree || null,
        Subject_ID: subject.data?.Subject_Id || null,
        College_ID: body.college_id ? Number(body.college_id) : null,
        Campus_ID: campus.data?.Campus_Id || null
      }).eq('Instructor_ID', Number(body.instructor_id)).select().single();
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
    if (method === 'GET') {
      let q = supabase.from('section').select('section_id, section_name, year_level, program_code, programs(Program_Name), campus(Campus_Name), students(count)').order('section_name');
      if (query.search) q = q.or(`section_name.ilike.%${query.search}%,program_code.ilike.%${query.search}%`);
      if (query.year_level) q = q.eq('year_level', query.year_level);
      const { data, error } = await q;
      if (error) throw error;
      return { data: (data || []).map(s => ({ ...s, Program_Name: s.programs?.Program_Name || null, Campus_Name: s.campus?.Campus_Name || null, student_count: s.students?.[0]?.count || 0 })) };
    }
    requireRole(session, ADMIN);
    if (body.action === 'create') {
      const { data, error } = await supabase.from('section').insert({
        section_name: body.section_name,
        program_code: body.program_code,
        year_level: body.year_level,
        campus_id: body.campus_id ? Number(body.campus_id) : null
      }).select().single();
      if (error) throw error;
      return { data };
    }
    if (body.action === 'update') {
      const campus = body.campus_name ? await supabase.from('campus').select('Campus_Id').eq('Campus_Name', body.campus_name).maybeSingle() : {data:null,error:null};
      if (campus.error) throw campus.error;
      const { data, error } = await supabase.from('section').update({
        section_name: body.section_name,
        program_code: body.program_code,
        year_level: body.year_level,
        campus_id: campus.data?.Campus_Id || null
      }).eq('section_id', Number(body.section_id)).select().single();
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

    if (['enrollment','grades','payments','schedule'].includes(resource)) {
      const result = await academicResource(supabase, resource, req.method, body, query);
      if (result) return send(res, true, result.msg || 'ok', result);
    }

    if (resource === 'admins') {
      const result = await adminResource(supabase, req.method, body, session);
      if (result) return send(res, true, result.msg || 'ok', result);
    }

    if (resource === 'students') {
      const result = await studentResource(supabase, req.method, body, query);
      if (result) return send(res, true, result.msg || 'ok', result);
    }

    if (resource === 'applicants') {
      const result = await applicantResource(supabase, req.method, body, query, session);
      if (result) return send(res, true, result.msg || 'ok', result);
    }

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
