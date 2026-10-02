const { requireAuth } = require('../_lib/auth');
const { getSupabaseAdmin } = require('../_lib/supabase');

function text(value, fallback = '') {
  return String(value ?? fallback).trim();
}

function nullable(value) {
  const v = text(value);
  return v === '' ? null : v;
}

function intOrNull(value) {
  const v = text(value);
  if (v === '') return null;
  const n = Number.parseInt(v, 10);
  return Number.isFinite(n) ? n : null;
}

function respond(res, ok, msg, extra = {}) {
  return res.status(ok ? 200 : 400).json({ ok, msg, ...extra });
}

async function loadProfile(supabase, applicantId) {
  const [applicant, admission, family, education, course] = await Promise.all([
    supabase.from('applicants').select('*').eq('id', applicantId).maybeSingle(),
    supabase.from('admission_info').select('*').eq('applicant_id', applicantId).maybeSingle(),
    supabase.from('family_info').select('*').eq('applicant_id', applicantId).maybeSingle(),
    supabase.from('educational_background').select('*').eq('applicant_id', applicantId).maybeSingle(),
    supabase.from('intended_course').select('*').eq('applicant_id', applicantId).maybeSingle()
  ]);

  const result = [applicant, admission, family, education, course];
  const failed = result.find(item => item.error);
  if (failed) throw failed.error;

  if (applicant.data) {
    delete applicant.data.password_hash;
    if (applicant.data.Birthdate) {
      applicant.data.Birthdate = String(applicant.data.Birthdate).slice(0, 10);
    }
  }

  return {
    applicant: applicant.data || null,
    admission: admission.data || null,
    family: family.data || null,
    education: education.data || null,
    course: course.data || null
  };
}

module.exports = async function handler(req, res) {
  try {
    const session = await requireAuth(req);

    if (session.account.account_type !== 'applicant' || !session.account.applicant_id) {
      return res.status(403).json({ ok: false, msg: 'Applicant access required.' });
    }

    const applicantId = session.account.applicant_id;
    const supabase = getSupabaseAdmin();

    if (req.method === 'GET') {
      const data = await loadProfile(supabase, applicantId);
      return respond(res, true, 'ok', { data });
    }

    if (req.method !== 'POST') {
      return res.status(405).json({ ok: false, msg: 'Method not allowed.' });
    }

    const step = text(req.body?.step);

    if (step === '1') {
      const campus = text(req.body?.campus);
      const student_type = text(req.body?.student_type);
      const year_level = text(req.body?.year_level);
      const admission_type = text(req.body?.admission_type);

      if (!campus || !student_type || !year_level || !admission_type) {
        return respond(res, false, 'Please fill in all required fields.');
      }

      const { error } = await supabase
        .from('admission_info')
        .upsert(
          {
            applicant_id: applicantId,
            campus,
            student_type,
            year_level,
            admission_type
          },
          { onConflict: 'applicant_id' }
        );

      if (error) throw error;
      return respond(res, true, 'Step 1 saved!');
    }

    if (step === '2') {
      const first = text(req.body?.First_Name);
      const middle = nullable(req.body?.Middle_Name);
      const last = text(req.body?.Last_Name);
      const suffix = nullable(req.body?.Suffix);
      const birthday = nullable(req.body?.Birthdate);
      const citizenship = nullable(req.body?.Citizenship);
      const birth_place = nullable(req.body?.Birth_Place);
      const contact = nullable(req.body?.Contact_Number);
      const landline = nullable(req.body?.Landline_Number);
      const email = nullable(req.body?.Email)?.toLowerCase() || null;
      const house = nullable(req.body?.House_Number);
      const street = nullable(req.body?.Street);
      const barangay = nullable(req.body?.Barangay);
      const municipality = nullable(req.body?.Municipality);
      const province = nullable(req.body?.Province);
      const zip = nullable(req.body?.Zip_Code);
      const sex = nullable(req.body?.Sex);
      const civil = nullable(req.body?.Civil_Status);
      const religion = nullable(req.body?.Religion);
      const disability = nullable(req.body?.Disability);
      const first_gen = nullable(req.body?.First_Generation_Student);

      if (!first || !last) return respond(res, false, 'First and last name are required.');
      if (!birthday) return respond(res, false, 'Birthdate is required.');
      if (!birth_place) return respond(res, false, 'Place of birth is required.');
      if (!citizenship) return respond(res, false, 'Citizenship is required.');
      if (!contact) return respond(res, false, 'Contact number is required.');
      if (!email) return respond(res, false, 'Email address is required.');

      const { data: duplicate, error: duplicateError } = await supabase
        .from('applicants')
        .select('id')
        .eq('Email', email)
        .neq('id', applicantId)
        .maybeSingle();

      if (duplicateError) throw duplicateError;
      if (duplicate) return respond(res, false, 'That email is already in use by another account.');

      const { error } = await supabase
        .from('applicants')
        .update({
          First_Name: first,
          Middle_Name: middle,
          Last_Name: last,
          Suffix: suffix,
          Birthdate: birthday,
          Citizenship: citizenship,
          Birth_Place: birth_place,
          Contact_Number: contact,
          Landline_Number: landline,
          Email: email,
          House_Number: house,
          Street: street,
          Barangay: barangay,
          Municipality: municipality,
          Province: province,
          Zip_Code: zip,
          Sex: sex,
          Civil_Status: civil,
          Religion: religion,
          Disability: disability,
          First_Generation_Student: first_gen
        })
        .eq('id', applicantId);

      if (error) throw error;
      return respond(res, true, 'Step 2 saved!');
    }

    if (step === '3') {
      const data = {
        applicant_id: applicantId,
        guardian_first_name: nullable(req.body?.guardian_first_name),
        guardian_last_name: nullable(req.body?.guardian_last_name),
        guardian_contact_number: nullable(req.body?.guardian_contact_number),
        guardian_email: nullable(req.body?.guardian_email),
        guardian_relationship: nullable(req.body?.guardian_relationship),
        guardian_barangay: nullable(req.body?.guardian_barangay),
        guardian_municipality: nullable(req.body?.guardian_municipality),
        guardian_province: nullable(req.body?.guardian_province),
        father_first_name: nullable(req.body?.father_first_name),
        father_middle_name: nullable(req.body?.father_middle_name),
        father_last_name: nullable(req.body?.father_last_name),
        father_age: intOrNull(req.body?.father_age),
        father_citizenship: nullable(req.body?.father_citizenship),
        father_educational_attainment: nullable(req.body?.father_educational_attainment),
        father_employment_status: nullable(req.body?.father_employment_status),
        father_occupation: nullable(req.body?.father_occupation),
        mother_first_name: nullable(req.body?.mother_first_name),
        mother_middle_name: nullable(req.body?.mother_middle_name),
        mother_last_name: nullable(req.body?.mother_last_name),
        mother_age: intOrNull(req.body?.mother_age),
        mother_citizenship: nullable(req.body?.mother_citizenship),
        mother_educational_attainment: nullable(req.body?.mother_educational_attainment),
        mother_employment_status: nullable(req.body?.mother_employment_status),
        mother_occupation: nullable(req.body?.mother_occupation)
      };

      const { error } = await supabase
        .from('family_info')
        .upsert(data, { onConflict: 'applicant_id' });

      if (error) throw error;
      return respond(res, true, 'Step 3 saved!');
    }

    if (step === '4') {
      const data = {
        applicant_id: applicantId,
        elementary_school_name: nullable(req.body?.elementary_school_name),
        elementary_school_address: nullable(req.body?.elementary_school_address),
        elementary_type: nullable(req.body?.elementary_type),
        elementary_year_from: intOrNull(req.body?.elementary_year_from),
        elementary_year_to: intOrNull(req.body?.elementary_year_to),
        high_school_name: nullable(req.body?.high_school_name),
        high_school_address: nullable(req.body?.high_school_address),
        high_school_type: nullable(req.body?.high_school_type),
        high_school_year_from: intOrNull(req.body?.high_school_year_from),
        high_school_year_to: intOrNull(req.body?.high_school_year_to),
        senior_high_school_name: nullable(req.body?.senior_high_school_name),
        senior_high_school_address: nullable(req.body?.senior_high_school_address),
        senior_high_school_type: nullable(req.body?.senior_high_school_type),
        senior_high_school_year_from: intOrNull(req.body?.senior_high_school_year_from),
        senior_high_school_year_to: intOrNull(req.body?.senior_high_school_year_to),
        track_strand: nullable(req.body?.track_strand)
      };

      const { error } = await supabase
        .from('educational_background')
        .upsert(data, { onConflict: 'applicant_id' });

      if (error) throw error;
      return respond(res, true, 'Step 4 saved!');
    }

    if (step === '5') {
      const program = text(req.body?.Program_Code);
      const specialization = nullable(req.body?.Specialization);

      if (!program) return respond(res, false, 'Please select a program.');

      const { error } = await supabase
        .from('intended_course')
        .upsert(
          {
            applicant_id: applicantId,
            Program_Code: program,
            Specialization: specialization
          },
          { onConflict: 'applicant_id' }
        );

      if (error) throw error;
      return respond(res, true, 'Step 5 saved!');
    }

    if (step === 'submit') {
      const status = text(req.body?.status);
      if (!['Draft', 'Submitted', 'Enrolled'].includes(status)) {
        return respond(res, false, 'Invalid status.');
      }

      const { error } = await supabase
        .from('applicants')
        .update({ application_status: status })
        .eq('id', applicantId);

      if (error) throw error;
      return respond(res, true, `Application status set to ${status}.`);
    }

    return respond(res, false, 'Unknown step.');
  } catch (error) {
    console.error('Applicant profile error:', error);
    return res.status(error.status || 500).json({
      ok: false,
      msg: error.status ? error.message : 'Server error.'
    });
  }
};
