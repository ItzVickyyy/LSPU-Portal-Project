<?php
/**
 * save_profile.php — LSPU Applicant Profile Save Handler
 * Handles step=1..5 and step=submit from applicant_profile.php
 * Responds with JSON.
 */
require_once __DIR__ . '/../api/config.php';

header('Content-Type: application/json');

function respond(bool $ok, string $msg, array $extra = []): void
{
    echo json_encode(array_merge(['ok' => $ok, 'msg' => $msg], $extra));
    exit;
}

// Auth guard
if (empty($_SESSION['applicant_id'])) {
    respond(false, 'Not authenticated. Please log in.');
}

$applicant_id = (int) $_SESSION['applicant_id'];
$step       = $_POST['step'] ?? '';

// ---------------------------------------------------------------------------
// GET — load existing profile data for pre-filling the form
// Must be handled before any POST step blocks.
// ---------------------------------------------------------------------------
if (($_SERVER['REQUEST_METHOD'] ?? '') === 'GET') {
    $result = [];

    // applicants row
    $stmt = db()->prepare('SELECT * FROM applicants WHERE id=?');
    $stmt->bind_param('i', $applicant_id);
    $stmt->execute();
    $row = $stmt->get_result()->fetch_assoc();
    if ($row) {
        unset($row['password_hash']);
        // Trim datetime to date-only so <input type="date"> can accept it
        if (!empty($row['Birthdate'])) {
            $row['Birthdate'] = substr($row['Birthdate'], 0, 10);
        }
        $result['applicant'] = $row;
    }

    // admission_info
    $stmt = db()->prepare('SELECT * FROM admission_info WHERE applicant_id=?');
    $stmt->bind_param('i', $applicant_id);
    $stmt->execute();
    $result['admission'] = $stmt->get_result()->fetch_assoc() ?? null;

    // family_info
    $stmt = db()->prepare('SELECT * FROM family_info WHERE applicant_id=?');
    $stmt->bind_param('i', $applicant_id);
    $stmt->execute();
    $result['family'] = $stmt->get_result()->fetch_assoc() ?? null;

    // educational_background
    $stmt = db()->prepare('SELECT * FROM educational_background WHERE applicant_id=?');
    $stmt->bind_param('i', $applicant_id);
    $stmt->execute();
    $result['education'] = $stmt->get_result()->fetch_assoc() ?? null;

    // intended_course
    $stmt = db()->prepare('SELECT * FROM intended_course WHERE applicant_id=?');
    $stmt->bind_param('i', $applicant_id);
    $stmt->execute();
    $result['course'] = $stmt->get_result()->fetch_assoc() ?? null;

    respond(true, 'ok', ['data' => $result]);
}

// Confirm student_id from form matches session (POST only)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $form_id = (int) ($_POST['applicant_id'] ?? 0);
    if ($form_id !== $applicant_id) {
        respond(false, 'Session mismatch. Please refresh and try again.');
    }
}

function h(string $s): string
{
    return htmlspecialchars(trim($s), ENT_QUOTES);
}
function p(string $key, string $default = ''): string
{
    return h($_POST[$key] ?? $default);
}
function pNull(string $key): ?string
{
    $v = h($_POST[$key] ?? '');
    return $v === '' ? null : $v;
}
function pInt(string $key): ?int
{
    $v = trim($_POST[$key] ?? '');
    return $v === '' ? null : (int)$v;
}

// ---------------------------------------------------------------------------
// STEP 1 — Campus & Admission Info
// ---------------------------------------------------------------------------
if ($step === '1') {
    $campus         = p('campus');
    $student_type   = p('student_type');
    $year_level     = p('year_level');
    $admission_type = p('admission_type');

    if (!$campus || !$student_type || !$year_level || !$admission_type) {
        respond(false, 'Please fill in all required fields.');
    }

    // Upsert
    $sql = 'INSERT INTO admission_info (applicant_id, campus, student_type, year_level, admission_type)
            VALUES (?, ?, ?, ?, ?)
            ON DUPLICATE KEY UPDATE
              campus = VALUES(campus),
              student_type = VALUES(student_type),
              year_level = VALUES(year_level),
              admission_type = VALUES(admission_type)';

    $stmt = db()->prepare($sql);
    $stmt->bind_param('issss', $applicant_id, $campus, $student_type, $year_level, $admission_type);
    $stmt->execute() ? respond(true, 'Step 1 saved!') : respond(false, 'Failed to save. ' . db()->error);
}

// ---------------------------------------------------------------------------
// STEP 2 — Personal Information
// ---------------------------------------------------------------------------
if ($step === '2') {
    $first      = p('First_Name');
    $middle     = pNull('Middle_Name');
    $last       = p('Last_Name');
    $suffix     = pNull('Suffix');
    $birthday   = pNull('Birthdate');
    $citizenship = pNull('Citizenship');
    $birth_place = pNull('Birth_Place');
    $contact    = pNull('Contact_Number');
    $landline   = pNull('Landline_Number');
    $email      = pNull('Email');
    $house      = pNull('House_Number');
    $street     = pNull('Street');
    $barangay   = pNull('Barangay');
    $municipality = pNull('Municipality');
    $province   = pNull('Province');
    $zip        = pNull('Zip_Code');
    $sex        = pNull('Sex');
    $civil      = pNull('Civil_Status');
    $religion   = pNull('Religion');
    $disability = pNull('Disability');
    $first_gen  = pNull('First_Generation_Student');

    if (!$first || !$last) respond(false, 'First and last name are required.');
    if (!$birthday)   respond(false, 'Birthdate is required.');
    if (!$birth_place) respond(false, 'Place of birth is required.');
    if (!$citizenship) respond(false, 'Citizenship is required.');
    if (!$contact)    respond(false, 'Contact number is required.');
    if (!$email)      respond(false, 'Email address is required.');

    if ($email !== null) {
        $chk = db()->prepare(
            'SELECT id FROM applicants WHERE Email = ? AND id != ?'
        );
        $chk->bind_param('si', $email, $applicant_id);
        $chk->execute();
        $chk->store_result();
        if ($chk->num_rows > 0)
            respond(false, 'That email is already in use by another account.');
    }

    $sql = 'UPDATE applicants SET
              First_Name=?, Middle_Name=?, Last_Name=?, Suffix=?,
              Birthdate=?, Citizenship=?, Birth_Place=?,
              Contact_Number=?, Landline_Number=?, Email=?,
              House_Number=?, Street=?, Barangay=?, Municipality=?, Province=?, Zip_Code=?,
              Sex=?, Civil_Status=?, Religion=?, Disability=?, First_Generation_Student=?
            WHERE id=?';

    $stmt = db()->prepare($sql);
    $stmt->bind_param(
        'sssssssssssssssssssssi',
        $first,
        $middle,
        $last,
        $suffix,
        $birthday,
        $citizenship,
        $birth_place,
        $contact,
        $landline,
        $email,
        $house,
        $street,
        $barangay,
        $municipality,
        $province,
        $zip,
        $sex,
        $civil,
        $religion,
        $disability,
        $first_gen,
        $applicant_id
    );
    $stmt->execute() ? respond(true, 'Step 2 saved!') : respond(false, 'Failed to save. ' . db()->error);
}

// ---------------------------------------------------------------------------
// STEP 3 — Parents / Guardian Information
// ---------------------------------------------------------------------------
if ($step === '3') {
    $data = [
        'guardian_first_name'           => pNull('guardian_first_name'),
        'guardian_last_name'            => pNull('guardian_last_name'),
        'guardian_contact_number'       => pNull('guardian_contact_number'),
        'guardian_email'                => pNull('guardian_email'),
        'guardian_relationship'         => pNull('guardian_relationship'),
        'guardian_barangay'             => pNull('guardian_barangay'),
        'guardian_municipality'         => pNull('guardian_municipality'),
        'guardian_province'             => pNull('guardian_province'),
        'father_first_name'             => pNull('father_first_name'),
        'father_middle_name'            => pNull('father_middle_name'),
        'father_last_name'              => pNull('father_last_name'),
        'father_age'                    => pInt('father_age'),
        'father_citizenship'            => pNull('father_citizenship'),
        'father_educational_attainment' => pNull('father_educational_attainment'),
        'father_employment_status'      => pNull('father_employment_status'),
        'father_occupation'             => pNull('father_occupation'),
        'mother_first_name'             => pNull('mother_first_name'),
        'mother_middle_name'            => pNull('mother_middle_name'),
        'mother_last_name'              => pNull('mother_last_name'),
        'mother_age'                    => pInt('mother_age'),
        'mother_citizenship'            => pNull('mother_citizenship'),
        'mother_educational_attainment' => pNull('mother_educational_attainment'),
        'mother_employment_status'      => pNull('mother_employment_status'),
        'mother_occupation'             => pNull('mother_occupation'),
    ];

    $cols   = implode(', ', array_keys($data));
    $phs    = implode(', ', array_fill(0, count($data), '?'));
    $updates = implode(', ', array_map(fn($c) => "$c = VALUES($c)", array_keys($data)));

    $sql = "INSERT INTO family_info (applicant_id, $cols) VALUES (?, $phs)
            ON DUPLICATE KEY UPDATE $updates";

    $types = 'i'; // applicant_id
    foreach ($data as $key => $val) {
        // father_age and mother_age use pInt() and may be null.
        // Binding null as 'i' converts it to 0 in MySQLi, corrupting the row.
        // Binding as 's' preserves NULL correctly.
        $types .= 's';
    }
    $values = array_merge([$applicant_id], array_values($data));
    $stmt = db()->prepare($sql);
    $stmt->bind_param($types, ...$values);
    $stmt->execute() ? respond(true, 'Step 3 saved!') : respond(false, 'Failed to save. ' . db()->error);
}

// ---------------------------------------------------------------------------
// STEP 4 — Educational Background
// ---------------------------------------------------------------------------
if ($step === '4') {
    $elem_name    = pNull('elementary_school_name');
    $elem_addr    = pNull('elementary_school_address');
    $elem_type    = pNull('elementary_type');
    $elem_from    = pInt('elementary_year_from');
    $elem_to      = pInt('elementary_year_to');
    $hs_name      = pNull('high_school_name');
    $hs_addr      = pNull('high_school_address');
    $hs_type      = pNull('high_school_type');
    $hs_from      = pInt('high_school_year_from');
    $hs_to        = pInt('high_school_year_to');
    $shs_name     = pNull('senior_high_school_name');
    $shs_addr     = pNull('senior_high_school_address');
    $shs_type     = pNull('senior_high_school_type');
    $shs_from     = pInt('senior_high_school_year_from');
    $shs_to       = pInt('senior_high_school_year_to');
    $track        = pNull('track_strand');

    $sql = 'INSERT INTO educational_background
              (applicant_id,
               elementary_school_name, elementary_school_address, elementary_type, elementary_year_from, elementary_year_to,
               high_school_name, high_school_address, high_school_type, high_school_year_from, high_school_year_to,
               senior_high_school_name, senior_high_school_address, senior_high_school_type, senior_high_school_year_from, senior_high_school_year_to,
               track_strand)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ON DUPLICATE KEY UPDATE
              elementary_school_name=VALUES(elementary_school_name),
              elementary_school_address=VALUES(elementary_school_address),
              elementary_type=VALUES(elementary_type),
              elementary_year_from=VALUES(elementary_year_from),
              elementary_year_to=VALUES(elementary_year_to),
              high_school_name=VALUES(high_school_name),
              high_school_address=VALUES(high_school_address),
              high_school_type=VALUES(high_school_type),
              high_school_year_from=VALUES(high_school_year_from),
              high_school_year_to=VALUES(high_school_year_to),
              senior_high_school_name=VALUES(senior_high_school_name),
              senior_high_school_address=VALUES(senior_high_school_address),
              senior_high_school_type=VALUES(senior_high_school_type),
              senior_high_school_year_from=VALUES(senior_high_school_year_from),
              senior_high_school_year_to=VALUES(senior_high_school_year_to),
              track_strand=VALUES(track_strand)';

    $stmt = db()->prepare($sql);
    $stmt->bind_param(
        'isssiisssiisssiis',
        $applicant_id,
        $elem_name,
        $elem_addr,
        $elem_type,
        $elem_from,
        $elem_to,
        $hs_name,
        $hs_addr,
        $hs_type,
        $hs_from,
        $hs_to,
        $shs_name,
        $shs_addr,
        $shs_type,
        $shs_from,
        $shs_to,
        $track
    );
    $stmt->execute() ? respond(true, 'Step 4 saved!') : respond(false, 'Failed to save. ' . db()->error);
}

// ---------------------------------------------------------------------------
// STEP 5 — Intended Course
// ---------------------------------------------------------------------------
if ($step === '5') {
    $program = p('Program_Code');
    $spec    = pNull('Specialization');

    if (!$program) respond(false, 'Please select a program.');

    $sql = 'INSERT INTO intended_course (applicant_id, Program_Code, Specialization)
            VALUES (?, ?, ?)
            ON DUPLICATE KEY UPDATE Program_Code=VALUES(Program_Code), Specialization=VALUES(Specialization)';

    $stmt = db()->prepare($sql);
    $stmt->bind_param('iss', $applicant_id, $program, $spec);
    $stmt->execute() ? respond(true, 'Step 5 saved!') : respond(false, 'Failed to save. ' . db()->error);
}

// ---------------------------------------------------------------------------
// STEP submit — Set application status
// ---------------------------------------------------------------------------
if ($step === 'submit') {
    $status = p('status');
    $allowed = ['Draft', 'Submitted', 'Enrolled'];
    if (!in_array($status, $allowed)) respond(false, 'Invalid status.');

    $stmt = db()->prepare('UPDATE applicants SET application_status=? WHERE id=?');
    $stmt->bind_param('si', $status, $applicant_id);
    $stmt->execute() ? respond(true, "Application status set to $status.") : respond(false, 'Failed to update status.');
}

respond(false, 'Unknown step.');