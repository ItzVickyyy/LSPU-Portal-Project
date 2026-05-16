<?php
/**
 * =============================================================================
 * admin_api.php
 * LSPU Enrollment System — Admin REST-like API
 * =============================================================================
 *
 * @project    Laguna State Polytechnic University (LSPU) Enrollment System
 * @module     Admin Dashboard Back-end
 * @file       admin_api.php
 * @requires   config.php  – database connection via db() and PHP session start
 * @requires   rbac.php    – role definitions / permission constants
 *
 * OVERVIEW
 * --------
 * Single-endpoint JSON API consumed exclusively by admin.js.
 * Every request arrives as:
 *   GET  admin_api.php?resource=<name>[&<filters>]
 *   POST admin_api.php?resource=<name>  (JSON body with an "action" key)
 *
 * All responses share the envelope:
 *   { "ok": true|false, "msg": "...", ...extra keys... }
 *
 * OUTPUT SAFETY
 * -------------
 * ob_start() is called immediately so that any PHP notice/warning emitted by
 * config.php or rbac.php is captured in the output buffer rather than
 * corrupting the JSON response.  ob_clean() is called inside respond() and
 * before every echo, ensuring a clean output stream.
 *
 * AUTHENTICATION
 * --------------
 * Every request is blocked unless $_SESSION['admin_id'] is set.
 * Individual resources apply tighter role checks where needed:
 *   - Super Admin  → admins resource (user management)
 *   - Admin+       → programs, subjects, instructors, sections (write)
 *   - Any staff    → read operations on all other resources
 *
 * MYSQLND COMPATIBILITY
 * ---------------------
 * stmtFetchAll() and stmtFetchOne() wrap mysqli_stmt in a way that works
 * whether or not the mysqlnd driver is installed (common XAMPP limitation).
 * They fall back to bind_result()+fetch() when get_result() is unavailable.
 *
 * TABLE OF CONTENTS
 * -----------------
 *  §01  Bootstrap          ob_start, require, charset fix, auth guard
 *  §02  Fetch Helpers      stmtFetchAll(), stmtFetchOne()
 *  §03  Core Helpers       respond(), h(), p(), pNull(), pInt(), pRaw()
 *  §04  Audit Trail        logStatusChange()
 *  §05  Request Parsing    $resource, $method, $body, $action
 *  §06  dashboard          GET  – aggregated stats, recent applicants
 *  §07  applicants         GET  – list (filtered/paged) or single with audit log
 *                          POST – update_status, delete, update_full, create_full
 *  §08  students           GET  – list (filtered) or single with full joins
 *                          POST – update, update_status, enroll_from_applicant,
 *                                 bulk_enroll_from_applicants
 *                          INT  – generateStudentNumber(), enrollOneApplicant()
 *  §09  enrollment         GET  – enrollment records (optionally by student)
 *  §10  grades             GET  – student list with grades, or grades by student
 *                          POST – update (recalculates total, final_grade, remarks)
 *  §11  payments           GET  – payment records (filtered)
 *                          POST – update_status
 *  §12  programs           GET  – list or specializations for a program
 *                          POST – create, add_specialization, delete
 *  §13  subjects           GET  – list (filtered by search / college)
 *                          POST – create, delete
 *  §14  instructors        GET  – list (filtered by search / college / campus)
 *                          POST – create, delete
 *  §15  colleges           GET  – list with program count
 *  §16  campus             GET  – all campuses
 *  §17  sections           GET  – list (filtered by search / year / campus)
 *                          POST – create, delete
 *  §18  semesters          GET  – all semesters, newest first
 *  §19  registrar          deprecated – redirects to admins resource
 *  §20  schedule           GET  – full schedule with joins
 *  §21  admins             GET  – staff account list (Super Admin only)
 *                          POST – create, update_status, update_role, reset_password
 *  §22  Fallback           Unknown resource → 404-style JSON error
 *
 * DATABASE TABLES TOUCHED
 * -----------------------
 *  applicants, admission_info, intended_course, family_info,
 *  educational_background, applicant_status_log,
 *  students, enrollment, enrolled_subjects, grades,
 *  payment, receipt,
 *  programs, specializations, subjects, instructors,
 *  colleges, campus, section, semester, year,
 *  schedule, admins
 *
 * =============================================================================
 */

ob_start(); // Buffer everything; we'll ob_clean() before each JSON response

require_once __DIR__ . '/../api/config.php';
require_once __DIR__ . '/../api/rbac.php';
header('Content-Type: application/json');

// ─────────────────────────────────────────────────────────────────────────────
// §01  BOOTSTRAP — Charset
// ─────────────────────────────────────────────────────────────────────────────
// Force utf8mb4 on the connection so that multibyte characters (e.g. names
// with accents or non-ASCII letters) are stored and compared correctly.
// LIKE comparisons use per-query CONVERT(… USING utf8mb4) COLLATE utf8mb4_general_ci
// rather than relying on the connection collation, for maximum compatibility
// across different MySQL/MariaDB server configurations.
(function () {
    db()->set_charset('utf8mb4');
})();

// ─────────────────────────────────────────────────────────────────────────────
// §01  BOOTSTRAP — Auth guard
// ─────────────────────────────────────────────────────────────────────────────
// Reject any request that does not carry a valid admin session.
// Individual resource blocks apply additional role checks where needed.
if (empty($_SESSION['admin_id'])) {
    ob_clean();
    echo json_encode(['ok' => false, 'msg' => 'Unauthorized']);
    exit;
}
$_currentRole = $_SESSION['role'] ?? '';

// ═════════════════════════════════════════════════════════════════════════════
// §02  MYSQLND-SAFE FETCH HELPERS
// ─────────────────────────────────────────────────────────────────────────────
// These two functions abstract over the two mysqli result-fetching APIs so the
// rest of the codebase can call them without caring which driver is present.
// ═════════════════════════════════════════════════════════════════════════════

/**
 * Fetch ALL rows from a prepared, already-executed statement.
 *
 * When mysqlnd is available, delegates to the fast get_result()->fetch_all().
 * When only libmysql is available (common on XAMPP), falls back to the
 * store_result() → result_metadata() → bind_result() → fetch() path.
 * store_result() MUST precede result_metadata(); omitting it causes fetch()
 * to silently return nothing on unbuffered result sets.
 *
 * @param  mysqli_stmt $stmt  A prepared statement that has already been executed.
 * @return array              Array of associative rows, or [] on failure/no rows.
 */
function stmtFetchAll(mysqli_stmt $stmt): array
{
    if (function_exists('mysqli_stmt_get_result')) {
        $res = $stmt->get_result();
        if ($res === false) return [];
        return $res->fetch_all(MYSQLI_ASSOC);
    }
    // Fallback for XAMPP/libmysql without mysqlnd.
    // store_result() MUST come before result_metadata()/fetch() or the
    // result set is unbuffered and fetch() silently returns nothing.
    $stmt->store_result();
    $meta = $stmt->result_metadata();
    if (!$meta) return [];
    $fields = [];
    $row    = [];
    while ($field = $meta->fetch_field()) {
        $fields[] = $field->name;
        $row[$field->name] = null;
    }
    $meta->free();
    $refs = [];
    foreach ($fields as $f) $refs[] = &$row[$f];
    call_user_func_array([$stmt, 'bind_result'], $refs);
    $results = [];
    while ($stmt->fetch()) {
        $copy = [];
        foreach ($fields as $f) $copy[$f] = $row[$f];
        $results[] = $copy;
    }
    return $results;
}

/**
 * Fetch the FIRST row from a prepared, already-executed statement.
 *
 * Thin wrapper around stmtFetchAll(); returns only the first element.
 * Use whenever exactly one row is expected (lookup by PK, duplicate checks, etc.).
 *
 * @param  mysqli_stmt $stmt  A prepared statement that has already been executed.
 * @return array|null         Associative row array, or null if no rows were returned.
 */
function stmtFetchOne(mysqli_stmt $stmt): ?array
{
    $rows = stmtFetchAll($stmt);
    return $rows[0] ?? null;
}

// ═════════════════════════════════════════════════════════════════════════════
// §03  CORE HELPERS
// ─────────────────────────────────────────────────────────────────────────────
// Small utility functions used throughout every resource handler.
// ═════════════════════════════════════════════════════════════════════════════

/**
 * Send a JSON response envelope and terminate the script.
 *
 * Calls ob_clean() first to discard any stray PHP notices captured in the
 * output buffer, then echoes the merged JSON object and exits.
 *
 * @param  bool   $ok    Whether the operation succeeded.
 * @param  string $msg   Human-readable status or error message.
 * @param  array  $extra Additional top-level keys to merge into the response
 *                       (e.g. ['data' => $rows], ['id' => $newId]).
 * @return never         Always terminates via exit.
 */
function respond(bool $ok, string $msg, array $extra = []): void
{
    ob_clean(); // Discard any stray PHP warnings before outputting JSON
    echo json_encode(array_merge(['ok' => $ok, 'msg' => $msg], $extra));
    exit;
}
/**
 * Sanitize a string value for safe use in HTML contexts.
 *
 * Trims whitespace then passes through htmlspecialchars with ENT_QUOTES so
 * both single and double quotes are encoded.  Used internally by p() and pNull().
 *
 * @param  string $s  Raw input string.
 * @return string     HTML-safe, trimmed string.
 */
function h(string $s): string
{
    return htmlspecialchars(trim($s), ENT_QUOTES);
}

/**
 * Read a request parameter (POST takes precedence over GET) and HTML-sanitize it.
 *
 * The most common input reader.  Use when the value is always expected to be
 * a non-empty string (e.g. action names, status values).
 *
 * @param  string $k  Parameter key.
 * @param  string $d  Default value when the key is absent (default: '').
 * @return string     Sanitized value or default.
 */
function p(string $k, string $d = ''): string
{
    return h($_POST[$k] ?? $_GET[$k] ?? $d);
}

/**
 * Read a request parameter and return null when the value is blank.
 *
 * Use for optional fields that map to nullable database columns so that an
 * absent or empty-string input stores NULL rather than an empty string.
 *
 * @param  string $k  Parameter key.
 * @return string|null  Sanitized value, or null if blank/absent.
 */
function pNull(string $k): ?string
{
    $v = h($_POST[$k] ?? $_GET[$k] ?? '');
    return $v === '' ? null : $v;
}

/**
 * Read a request parameter and cast it to int; returns null when blank.
 *
 * Use for integer foreign keys and IDs.  Does NOT sanitize through h() because
 * numeric values do not require HTML-encoding.
 *
 * @param  string $k  Parameter key.
 * @return int|null   Integer value, or null if blank/absent.
 */
function pInt(string $k): ?int
{
    $v = trim($_POST[$k] ?? $_GET[$k] ?? '');
    return $v === '' ? null : (int)$v;
}

/**
 * Read a request parameter without HTML-encoding (raw trimmed string).
 *
 * Use when the value will be hashed (passwords) or further processed before
 * touching the database, where HTML-encoding would corrupt the content.
 *
 * @param  string $k  Parameter key.
 * @param  string $d  Default value when the key is absent (default: '').
 * @return string     Trimmed raw value or default.
 */
function pRaw(string $k, string $d = ''): string
{
    return trim($_POST[$k] ?? $_GET[$k] ?? $d);
}

// ═════════════════════════════════════════════════════════════════════════════
// §04  AUDIT TRAIL
// ═════════════════════════════════════════════════════════════════════════════

/**
 * Append one entry to the applicant status audit log.
 *
 * Records who changed an applicant's status and when, providing a full
 * history visible in the Applicant Detail view (status timeline widget).
 *
 * Designed to be called after every status mutation (update_status,
 * enroll_from_applicant, create_full).  It is intentionally silent on
 * failure: if the applicant_status_log table has not been migrated yet,
 * the INSERT is suppressed with @ and the function returns without raising
 * an error, so the missing migration never breaks the main request flow.
 *
 * @param  mysqli $db          Active database connection.
 * @param  int    $applicantId Row ID from the applicants table.
 * @param  string $newStatus   The status value being recorded
 *                             (Pending | Draft | Submitted | Enrolled | Rejected).
 * @param  string $changedBy   Actor label: 'admin' for staff-initiated changes,
 *                             'system' for automated transitions (e.g. duplicate
 *                             enroll guard).  Extend with the actual admin name
 *                             once $_SESSION['admin_name'] is available.
 * @return void
 */
function logStatusChange(mysqli $db, int $applicantId, string $newStatus, string $changedBy = 'admin'): void
{
    $stmt = @$db->prepare(
        "INSERT INTO applicant_status_log (applicant_id, status, changed_by, changed_at)
         VALUES (?, ?, ?, NOW())"
    );
    if (!$stmt) return; // table not yet created — degrade gracefully
    $stmt->bind_param('iss', $applicantId, $newStatus, $changedBy);
    @$stmt->execute();
}

// ═════════════════════════════════════════════════════════════════════════════
// §05  REQUEST PARSING
// ─────────────────────────────────────────────────────────────────────────────
// Determine which resource is being requested and which HTTP verb was used.
// For non-GET requests, decode the JSON body (sent by admin.js via fetch) and
// merge its keys into $_POST so the p() / pNull() / pInt() helpers can read
// them uniformly regardless of whether the values arrived as form-data or JSON.
// ═════════════════════════════════════════════════════════════════════════════

/** The resource name from the query string (e.g. "applicants", "students"). */
$resource = $_GET['resource'] ?? '';

/** HTTP verb for the current request. */
$method   = $_SERVER['REQUEST_METHOD'];

/**
 * Decoded JSON request body.
 * Populated for POST requests; remains [] for GET requests.
 * Keys are also mirrored into $_POST so that p()/pNull()/pInt() work
 * transparently for both JSON-body and form-encoded inputs.
 *
 * @var array<string, mixed>
 */
$body = [];
if ($method !== 'GET') {
    $raw = file_get_contents('php://input');
    if ($raw) {
        $body = json_decode($raw, true) ?? [];
        foreach ($body as $k => $v) $_POST[$k] = is_array($v) ? $v : (string)$v;
    }
}

/** The sub-action within a resource (e.g. "create", "delete", "update_status"). */
$action = p('action');

// ═════════════════════════════════════════════════════════════════════════════
// §06  RESOURCE: dashboard
// ─────────────────────────────────────────────────────────────────────────────
// Returns aggregated statistics for the admin dashboard home screen.
//
// Method : GET
// Params : (none)
//
// Response data keys:
//   total_applicants  – pipeline count (Pending + Draft + Submitted + Rejected)
//   enrolled          – applicants whose status is Enrolled (moved to students)
//   pending           – count with status Pending
//   submitted         – count with status Submitted
//   draft             – count with status Draft
//   rejected          – count with status Rejected
//   total_students    – total rows in the students table
//   active_students   – students with Status = Active
//   active_enrollments– enrollment rows with status = Enrolled
//   total_revenue     – SUM of paid payments
//   recent_applicants – 5 most recently registered pipeline applicants
//   status_distribution – associative map of status → count for bar chart
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'dashboard') {
    $db = db();
    $stats = [];

    $r = $db->query("SELECT application_status, COUNT(*) as cnt FROM applicants GROUP BY application_status");
    $byStatus = [];
    while ($row = $r->fetch_assoc()) $byStatus[$row['application_status']] = (int)$row['cnt'];
    $stats['enrolled']         = $byStatus['Enrolled']  ?? 0;
    $stats['pending']          = $byStatus['Pending']   ?? 0;
    $stats['submitted']        = $byStatus['Submitted'] ?? 0;
    $stats['draft']            = $byStatus['Draft']     ?? 0;
    $stats['rejected']         = $byStatus['Rejected']  ?? 0;
    // Total pipeline applicants = everyone except those already moved to Students
    $stats['total_applicants'] = $stats['pending'] + $stats['submitted'] + $stats['draft'] + $stats['rejected'];

    $r = $db->query("SELECT COUNT(*) as cnt, SUM(Status='Active') as active FROM students");
    $row = $r->fetch_assoc();
    $stats['total_students']  = (int)$row['cnt'];
    $stats['active_students'] = (int)$row['active'];

    $r = $db->query("SELECT COUNT(*) as cnt FROM enrollment WHERE status='Enrolled'");
    $stats['active_enrollments'] = (int)$r->fetch_assoc()['cnt'];

    $r = $db->query("SELECT SUM(amount) as total FROM payment WHERE status='Paid'");
    $stats['total_revenue'] = (float)($r->fetch_assoc()['total'] ?? 0);

    $r = $db->query("SELECT id, CONCAT(CONVERT(First_Name USING utf8mb4) COLLATE utf8mb4_general_ci,' ',CONVERT(Last_Name USING utf8mb4) COLLATE utf8mb4_general_ci) as name, Email, application_status, created_at FROM applicants WHERE application_status != 'Enrolled' ORDER BY created_at DESC LIMIT 5");
    $stats['recent_applicants']    = $r->fetch_all(MYSQLI_ASSOC);
    $stats['status_distribution']  = $byStatus;

    respond(true, 'ok', ['data' => $stats]);
}

// ═════════════════════════════════════════════════════════════════════════════
// §07  RESOURCE: applicants
// ─────────────────────────────────────────────────────────────────────────────
// Manages the pre-enrollment pipeline.  Applicants whose status reaches
// "Enrolled" are converted to student records but remain in this table for
// audit purposes (the dashboard excludes them from the pipeline count).
//
// GET  ?id=<int>
//   Returns a single applicant with all related tables joined (admission_info,
//   intended_course, family_info, educational_background) plus status audit log.
//
// GET  (no id)
//   Returns filtered list.  Enrolled applicants are always excluded.
//   Filters: search, status, campus, program, date_from, date_to
//   Extra response key: enrolled_count (sidebar context)
//
// POST action=update_status
//   Params: applicant_id (or legacy student_id), status
//   Allowed statuses: Pending | Draft | Submitted | Enrolled | Rejected
//   Side-effect: writes to applicant_status_log
//
// POST action=delete
//   Params: applicant_id (or legacy student_id)
//   Guard: blocked if the applicant has an existing student record.
//   Cascades: admission_info, intended_course, family_info, educational_background
//
// POST action=update_full
//   Params: applicant_id + all personal, admission, course, family, education fields
//   Uses INSERT … ON DUPLICATE KEY UPDATE for related tables (upsert pattern).
//
// POST action=create_full
//   Params: email (unique), first_name, last_name + optional personal/course/family fields
//   Creates applicant + all related rows in a single request.
//   Returns: id, temp_password (auto-generated 10-char hex for credential email)
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'applicants') {
    if ($method === 'GET') {
        $id     = pInt('id');
        $search = pNull('search');
        $status = pNull('status');
        $campus = pNull('campus');

        if ($id) {
            $stmt = db()->prepare("
                SELECT a.*, ai.campus, ai.student_type, ai.year_level, ai.admission_type,
                       ic.Program_Code, ic.Specialization, p.Program_Name, c.college_name,
                       fi.guardian_first_name, fi.guardian_last_name, fi.guardian_contact_number,
                       fi.guardian_email, fi.guardian_relationship,
                       fi.guardian_barangay, fi.guardian_municipality, fi.guardian_province,
                       fi.father_first_name, fi.father_middle_name, fi.father_last_name,
                       fi.father_age, fi.father_citizenship,
                       fi.father_educational_attainment, fi.father_employment_status, fi.father_occupation,
                       fi.mother_first_name, fi.mother_middle_name, fi.mother_last_name,
                       fi.mother_age, fi.mother_citizenship,
                       fi.mother_educational_attainment, fi.mother_employment_status, fi.mother_occupation,
                       eb.elementary_school_name, eb.elementary_school_address, eb.elementary_type,
                       eb.elementary_year_from, eb.elementary_year_to,
                       eb.high_school_name, eb.high_school_address, eb.high_school_type,
                       eb.high_school_year_from, eb.high_school_year_to,
                       eb.senior_high_school_name, eb.senior_high_school_address, eb.senior_high_school_type,
                       eb.senior_high_school_year_from, eb.senior_high_school_year_to, eb.track_strand
                FROM applicants a
                LEFT JOIN admission_info ai ON ai.applicant_id = a.id
                LEFT JOIN intended_course ic ON ic.applicant_id = a.id
                LEFT JOIN programs p ON p.Program_Code = ic.Program_Code
                LEFT JOIN colleges c ON c.college_id = p.college_id
                LEFT JOIN family_info fi ON fi.applicant_id = a.id
                LEFT JOIN educational_background eb ON eb.applicant_id = a.id
                WHERE a.id = ?
            ");
            if (!$stmt) respond(false, 'Query prepare failed: ' . db()->error);
            $stmt->bind_param('i', $id);
            $stmt->execute();
            $row = stmtFetchOne($stmt);
            if ($row) unset($row['password_hash']);

            // Fetch audit trail (silently empty if table doesn't exist yet)
            $statusLog = [];
            $logStmt = @db()->prepare(
                "SELECT status, changed_by, changed_at
                 FROM applicant_status_log
                 WHERE applicant_id = ?
                 ORDER BY changed_at ASC"
            );
            if ($logStmt) {
                $logStmt->bind_param('i', $id);
                $logStmt->execute();
                $statusLog = stmtFetchAll($logStmt);
            }

            respond(true, 'ok', ['data' => $row, 'status_log' => $statusLog]);
        }

        $program  = pNull('program');
        $dateFrom = pNull('date_from');
        $dateTo   = pNull('date_to');

        $where = ["a.application_status != 'Enrolled'"]; // Enrolled applicants live in Students
        $params = [];
        $types = '';
        if ($search) {
            $like = "%$search%";
            $where[] = "(CONVERT(a.First_Name USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(a.Last_Name USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(a.Email USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ?)";
            $params = array_merge($params, [$like, $like, $like]);
            $types .= 'sss';
        }
        if ($status) {
            $where[] = "a.application_status = ?";
            $params[] = $status;
            $types .= 's';
        }
        if ($campus) {
            $where[] = "ai.campus = ?";
            $params[] = $campus;
            $types .= 's';
        }
        if ($program) {
            $where[] = "ic.Program_Code = ?";
            $params[] = $program;
            $types .= 's';
        }
        if ($dateFrom) {
            $where[] = "DATE(a.created_at) >= ?";
            $params[] = $dateFrom;
            $types .= 's';
        }
        if ($dateTo) {
            $where[] = "DATE(a.created_at) <= ?";
            $params[] = $dateTo;
            $types .= 's';
        }

        $sql = "SELECT a.id,
                       s.student_id,
                       CONCAT(CONVERT(a.First_Name USING utf8mb4) COLLATE utf8mb4_general_ci,' ',IFNULL(CONVERT(a.Middle_Name USING utf8mb4) COLLATE utf8mb4_general_ci, '' COLLATE utf8mb4_general_ci),' ',CONVERT(a.Last_Name USING utf8mb4) COLLATE utf8mb4_general_ci) as full_name,
                       a.Email, a.application_status, a.Contact_Number, a.Sex, a.created_at,
                       ai.campus, ai.year_level, ic.Program_Code, p.Program_Name
                FROM applicants a
                LEFT JOIN students s ON s.applicant_id = a.id
                LEFT JOIN admission_info ai ON ai.applicant_id = a.id
                LEFT JOIN intended_course ic ON ic.applicant_id = a.id
                LEFT JOIN programs p ON p.Program_Code = ic.Program_Code
                WHERE " . implode(' AND ', $where) . "
                ORDER BY a.created_at DESC";

        $stmt = db()->prepare($sql);
        if (!$stmt) respond(false, 'Query prepare failed: ' . db()->error);
        if ($params) $stmt->bind_param($types, ...$params);
        $stmt->execute();
        $rows = stmtFetchAll($stmt);

        // Sidebar tally: how many applicants have been enrolled (for context)
        $cntRow = db()->query("SELECT COUNT(*) as cnt FROM applicants WHERE application_status = 'Enrolled'");
        $enrolledCount = $cntRow ? (int)$cntRow->fetch_assoc()['cnt'] : 0;

        respond(true, 'ok', ['data' => $rows, 'enrolled_count' => $enrolledCount]);
    }

    if ($method === 'POST') {

        // ── Update status ──────────────────────────────────────────────────
        if ($action === 'update_status') {
            // Accept both 'applicant_id' (preferred) and legacy 'student_id' for backwards compat
            $id     = pInt('applicant_id') ?: pInt('student_id');
            $status = p('status');
            $allowed = ['Pending', 'Draft', 'Submitted', 'Enrolled', 'Rejected'];
            if (!in_array($status, $allowed)) respond(false, 'Invalid status.');
            $db = db();
            $stmt = $db->prepare("UPDATE applicants SET application_status=? WHERE id=?");
            $stmt->bind_param('si', $status, $id);
            if ($stmt->execute()) {
                logStatusChange($db, $id, $status);
                respond(true, 'Status updated.');
            } else {
                respond(false, $db->error);
            }
        }

        // ── Delete ─────────────────────────────────────────────────────────
        if ($action === 'delete') {
            // Accept both 'applicant_id' (preferred) and legacy 'student_id' for backwards compat
            $id = pInt('applicant_id') ?: pInt('student_id');
            $db = db();

            // Block deletion if this applicant has already been enrolled as a student
            $chk = $db->prepare("SELECT id, student_id FROM students WHERE applicant_id = ? LIMIT 1");
            $chk->bind_param('i', $id);
            $chk->execute();
            $enrolled = stmtFetchOne($chk);
            if ($enrolled) {
                respond(false, "Cannot delete: this applicant has already been enrolled as a student (ID: {$enrolled['student_id']}). Remove the student record first.");
            }

            foreach (['admission_info', 'intended_course', 'family_info', 'educational_background'] as $tbl) {
                $s = $db->prepare("DELETE FROM `$tbl` WHERE applicant_id=?");
                $s->bind_param('i', $id);
                $s->execute();
            }
            $stmt = $db->prepare("DELETE FROM applicants WHERE id=?");
            $stmt->bind_param('i', $id);
            $stmt->execute() ? respond(true, 'Applicant deleted.') : respond(false, $db->error);
        }

        // ── Update full applicant ──────────────────────────────────────────
        if ($action === 'update_full') {
            $db = db();
            // Accept both 'applicant_id' (preferred) and legacy 'student_id' for backwards compat
            $id = pInt('applicant_id') ?: pInt('student_id');
            if (!$id) respond(false, 'Missing id.');

            $first    = p('first_name');
            $middle   = pNull('middle_name');
            $last     = p('last_name');
            $suffix   = pNull('suffix');
            $email    = p('email');
            if (!$first || !$last || !$email) respond(false, 'First name, last name, and email are required.');

            // Check duplicate email (allow same email for this student)
            $chk = $db->prepare("SELECT id FROM applicants WHERE Email=? AND id != ?");
            $chk->bind_param('si', $email, $id);
            $chk->execute();
            $chkRow = stmtFetchOne($chk);
            if ($chkRow) respond(false, 'Email already used by another applicant.');

            $birthday     = pNull('birthdate');
            $birthplace   = pNull('birth_place');
            $citizenship  = pNull('citizenship');
            $sex          = pNull('sex');
            $civil        = pNull('civil_status');
            $religion     = pNull('religion');
            $disability   = pNull('disability');
            $firstgen     = pNull('first_gen');
            $contact      = pNull('contact_number');
            $landline     = pNull('landline_number');
            $house        = pNull('house_number');
            $street       = pNull('street');
            $barangay     = pNull('barangay');
            $municipality = pNull('municipality');
            $province     = pNull('province');
            $zip          = pNull('zip_code');

            $stmt = $db->prepare("
                UPDATE applicants SET
                  Email=?, First_Name=?, Middle_Name=?, Last_Name=?, Suffix=?,
                  Birthdate=?, Birth_Place=?, Citizenship=?, Sex=?, Civil_Status=?,
                  Religion=?, Disability=?, First_Generation_Student=?,
                  Contact_Number=?, Landline_Number=?, House_Number=?, Street=?,
                  Barangay=?, Municipality=?, Province=?, Zip_Code=?
                WHERE id=?
            ");
            $stmt->bind_param(
                'sssssssssssssssssssss' . 'i',  // 21 string fields + WHERE id
                $email, $first, $middle, $last, $suffix,
                $birthday, $birthplace, $citizenship, $sex, $civil,
                $religion, $disability, $firstgen,
                $contact, $landline, $house, $street,
                $barangay, $municipality, $province, $zip,
                $id
            );
            if (!$stmt->execute()) respond(false, 'Could not update applicant: ' . $db->error);

            // Admission info — upsert
            $campus        = pNull('campus');
            $studentType   = pNull('student_type');
            $yearLevel     = pNull('year_level');
            $admissionType = pNull('admission_type');
            $s = $db->prepare("
                INSERT INTO admission_info (applicant_id, campus, student_type, year_level, admission_type)
                VALUES (?,?,?,?,?)
                ON DUPLICATE KEY UPDATE campus=VALUES(campus), student_type=VALUES(student_type),
                  year_level=VALUES(year_level), admission_type=VALUES(admission_type)
            ");
            $s->bind_param('issss', $id, $campus, $studentType, $yearLevel, $admissionType);
            $s->execute();

            // Intended course — upsert
            $programCode = pNull('program_code');
            $spec        = pNull('specialization');
            $s = $db->prepare("
                INSERT INTO intended_course (applicant_id, Program_Code, Specialization)
                VALUES (?,?,?)
                ON DUPLICATE KEY UPDATE Program_Code=VALUES(Program_Code), Specialization=VALUES(Specialization)
            ");
            $s->bind_param('iss', $id, $programCode, $spec);
            $s->execute();

            // Family info — upsert
            $gFirst   = pNull('guardian_first_name');
            $gLast    = pNull('guardian_last_name');
            $gContact = pNull('guardian_contact_number');
            $gEmail   = pNull('guardian_email');
            $gRel     = pNull('guardian_relationship');
            $gBrgy    = pNull('guardian_barangay');
            $gMun     = pNull('guardian_municipality');
            $gProv    = pNull('guardian_province');
            $fFirst   = pNull('father_first_name');
            $fMiddle  = pNull('father_middle_name');
            $fLast    = pNull('father_last_name');
            $fAge     = pNull('father_age');
            $fCit     = pNull('father_citizenship');
            $fEdu     = pNull('father_educational_attainment');
            $fEmp     = pNull('father_employment_status');
            $fOcc     = pNull('father_occupation');
            $mFirst   = pNull('mother_first_name');
            $mMiddle  = pNull('mother_middle_name');
            $mLast    = pNull('mother_last_name');
            $mAge     = pNull('mother_age');
            $mCit     = pNull('mother_citizenship');
            $mEdu     = pNull('mother_educational_attainment');
            $mEmp     = pNull('mother_employment_status');
            $mOcc     = pNull('mother_occupation');
            $s = $db->prepare("
                INSERT INTO family_info
                  (applicant_id, guardian_first_name, guardian_last_name, guardian_contact_number,
                   guardian_email, guardian_relationship, guardian_barangay, guardian_municipality, guardian_province,
                   father_first_name, father_middle_name, father_last_name, father_age, father_citizenship,
                   father_educational_attainment, father_employment_status, father_occupation,
                   mother_first_name, mother_middle_name, mother_last_name, mother_age, mother_citizenship,
                   mother_educational_attainment, mother_employment_status, mother_occupation)
                VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
                ON DUPLICATE KEY UPDATE
                  guardian_first_name=VALUES(guardian_first_name), guardian_last_name=VALUES(guardian_last_name),
                  guardian_contact_number=VALUES(guardian_contact_number), guardian_email=VALUES(guardian_email),
                  guardian_relationship=VALUES(guardian_relationship), guardian_barangay=VALUES(guardian_barangay),
                  guardian_municipality=VALUES(guardian_municipality), guardian_province=VALUES(guardian_province),
                  father_first_name=VALUES(father_first_name), father_middle_name=VALUES(father_middle_name),
                  father_last_name=VALUES(father_last_name), father_age=VALUES(father_age),
                  father_citizenship=VALUES(father_citizenship),
                  father_educational_attainment=VALUES(father_educational_attainment),
                  father_employment_status=VALUES(father_employment_status), father_occupation=VALUES(father_occupation),
                  mother_first_name=VALUES(mother_first_name), mother_middle_name=VALUES(mother_middle_name),
                  mother_last_name=VALUES(mother_last_name), mother_age=VALUES(mother_age),
                  mother_citizenship=VALUES(mother_citizenship),
                  mother_educational_attainment=VALUES(mother_educational_attainment),
                  mother_employment_status=VALUES(mother_employment_status), mother_occupation=VALUES(mother_occupation)
            ");
            $s->bind_param(
                'issssssssssssssssssssssss',
                $id, $gFirst, $gLast, $gContact, $gEmail, $gRel, $gBrgy, $gMun, $gProv,
                $fFirst, $fMiddle, $fLast, $fAge, $fCit, $fEdu, $fEmp, $fOcc,
                $mFirst, $mMiddle, $mLast, $mAge, $mCit, $mEdu, $mEmp, $mOcc
            );
            $s->execute();

            // Educational background — upsert
            $elemName  = pNull('elementary_school_name');
            $elemAddr  = pNull('elementary_school_address');
            $elemType  = pNull('elementary_type');
            $elemFrom  = pNull('elementary_year_from');
            $elemTo    = pNull('elementary_year_to');
            $hsName    = pNull('high_school_name');
            $hsAddr    = pNull('high_school_address');
            $hsType    = pNull('high_school_type');
            $hsFrom    = pNull('high_school_year_from');
            $hsTo      = pNull('high_school_year_to');
            $shsName   = pNull('senior_high_school_name');
            $shsAddr   = pNull('senior_high_school_address');
            $shsType   = pNull('senior_high_school_type');
            $shsFrom   = pNull('senior_high_school_year_from');
            $shsTo     = pNull('senior_high_school_year_to');
            $track     = pNull('track_strand');
            $s = $db->prepare("
                INSERT INTO educational_background
                  (applicant_id, elementary_school_name, elementary_school_address, elementary_type,
                   elementary_year_from, elementary_year_to,
                   high_school_name, high_school_address, high_school_type,
                   high_school_year_from, high_school_year_to,
                   senior_high_school_name, senior_high_school_address, senior_high_school_type,
                   senior_high_school_year_from, senior_high_school_year_to, track_strand)
                VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
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
                  track_strand=VALUES(track_strand)
            ");
            $s->bind_param(
                'issssssssssssssss',
                $id, $elemName, $elemAddr, $elemType, $elemFrom, $elemTo,
                $hsName, $hsAddr, $hsType, $hsFrom, $hsTo,
                $shsName, $shsAddr, $shsType, $shsFrom, $shsTo, $track
            );
            $s->execute();

            respond(true, 'Applicant updated successfully.');
        }

        // ── Create full applicant ──────────────────────────────────────────
        if ($action === 'create_full') {
            $db = db();

            $email    = p('email');
            $first    = p('first_name');
            $middle   = pNull('middle_name');
            $last     = p('last_name');
            $suffix   = pNull('suffix');

            if (!$email || !$first || !$last)
                respond(false, 'First name, last name, and email are required.');

            // Check duplicate email
            $chk = $db->prepare("SELECT id FROM applicants WHERE Email=?");
            $chk->bind_param('s', $email);
            $chk->execute();
            $chkRow = stmtFetchOne($chk);
            if ($chkRow) respond(false, 'Email already registered.');

            // Auto-generate a temporary password — the applicant will receive
            // this via email so they can log in and review/edit their profile.
            $tempPassword = bin2hex(random_bytes(5)); // e.g. "a3f9c12e4b"
            $hash = password_hash($tempPassword, PASSWORD_BCRYPT);

            // Personal fields
            $birthday     = pNull('birthdate');
            $birthplace   = pNull('birth_place');
            $citizenship  = pNull('citizenship');
            $sex          = pNull('sex');
            $civil        = pNull('civil_status');
            $religion     = pNull('religion');
            $disability   = pNull('disability');
            $firstgen     = pNull('first_gen');
            $contact      = pNull('contact_number');
            $house        = pNull('house_number');
            $street       = pNull('street');
            $barangay     = pNull('barangay');
            $municipality = pNull('municipality');
            $province     = pNull('province');
            $zip          = pNull('zip_code');

            $stmt = $db->prepare("
                INSERT INTO applicants
                  (Email, password_hash, application_status,
                   First_Name, Middle_Name, Last_Name, Suffix,
                   Birthdate, Birth_Place, Citizenship, Sex, Civil_Status,
                   Religion, Disability, First_Generation_Student,
                   Contact_Number, House_Number, Street, Barangay,
                   Municipality, Province, Zip_Code)
                VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
            ");
            $appStatus = 'Pending';
            $stmt->bind_param(
                'ssssssssssssssssssssss',
                $email, $hash, $appStatus,
                $first, $middle, $last, $suffix,
                $birthday, $birthplace, $citizenship, $sex, $civil,
                $religion, $disability, $firstgen,
                $contact, $house, $street, $barangay,
                $municipality, $province, $zip
            );
            if (!$stmt->execute()) respond(false, 'Could not create applicant: ' . $db->error);
            $newId = $db->insert_id;

            // Admission info
            $campus        = p('campus');
            $studentType   = p('student_type') ?: 'College';
            $yearLevel     = p('year_level');
            $admissionType = p('admission_type');
            if ($campus && $yearLevel) {
                $s = $db->prepare("INSERT INTO admission_info (applicant_id, campus, student_type, year_level, admission_type) VALUES (?,?,?,?,?)");
                $s->bind_param('issss', $newId, $campus, $studentType, $yearLevel, $admissionType);
                $s->execute();
            }

            // Intended course
            $programCode = pNull('program_code');
            $spec        = pNull('specialization');
            if ($programCode) {
                $s = $db->prepare("INSERT INTO intended_course (applicant_id, Program_Code, Specialization) VALUES (?,?,?)");
                $s->bind_param('iss', $newId, $programCode, $spec);
                $s->execute();
            }

            // Family info
            $gFirst   = pNull('guardian_first_name');
            $gLast    = pNull('guardian_last_name');
            $gRel     = pNull('guardian_relationship');
            $gContact = pNull('guardian_contact_number');
            $fFirst   = pNull('father_first_name');
            $fLast    = pNull('father_last_name');
            $mFirst   = pNull('mother_first_name');
            $mLast    = pNull('mother_last_name');
            if ($gFirst || $fFirst || $mFirst) {
                $s = $db->prepare("INSERT INTO family_info (applicant_id, guardian_first_name, guardian_last_name, guardian_relationship, guardian_contact_number, father_first_name, father_last_name, mother_first_name, mother_last_name) VALUES (?,?,?,?,?,?,?,?,?)");
                $s->bind_param('issssssss', $newId, $gFirst, $gLast, $gRel, $gContact, $fFirst, $fLast, $mFirst, $mLast);
                $s->execute();
            }

            // Educational background
            $elemName  = pNull('elementary_school_name');
            $elemType  = pNull('elementary_type');
            $hsName    = pNull('high_school_name');
            $hsType    = pNull('high_school_type');
            $shsName   = pNull('senior_high_school_name');
            $shsType   = pNull('senior_high_school_type');
            $track     = pNull('track_strand');
            if ($elemName || $hsName || $shsName || $track) {
                $s = $db->prepare("INSERT INTO educational_background (applicant_id, elementary_school_name, elementary_type, high_school_name, high_school_type, senior_high_school_name, senior_high_school_type, track_strand) VALUES (?,?,?,?,?,?,?,?)");
                $s->bind_param('isssssss', $newId, $elemName, $elemType, $hsName, $hsType, $shsName, $shsType, $track);
                $s->execute();
            }

            // Log the initial status
            logStatusChange($db, $newId, 'Pending', 'admin');

            respond(true, 'Applicant created successfully.', [
                'id'            => $newId,
                'temp_password' => $tempPassword,  // used by the admin to send credentials email
            ]);
        }
    }
}

// ═════════════════════════════════════════════════════════════════════════════
// §08  RESOURCE: students
// ─────────────────────────────────────────────────────────────────────────────
// Manages enrolled students.  Student rows are created by the enrollment
// actions below; they are never inserted directly via a "create" action.
// All name/contact fields use COALESCE(applicants.col, students.col) so that
// students who were created from an applicant inherit that data automatically,
// while manually created students can carry their own standalone values.
//
// GET  ?id=<int>
//   Single student with full joins: applicant data, admission_info,
//   intended_course, programs, section, semester, educational_background,
//   family_info.  Used by the Student Detail / Edit modal.
//
// GET  (no id)
//   Filtered list.  Filters: search (name/student_id/email), status, campus,
//   program, section, year_level, date_from, date_to.
//
// POST action=update
//   Params: student_id + any subset of: section_id, year_level, campus,
//           program_code, email, contact_number.
//   Builds a dynamic SET clause so only provided fields are touched.
//
// POST action=update_status
//   Params: student_id, status (Active | Inactive | LOA)
//
// POST action=enroll_from_applicant  (single enrollment)
//   Params: applicant_id, section_id, semester_id, year_level
//   Wraps enrollOneApplicant() in a transaction.
//   Returns: student_number, already_existed flag
//
// POST action=bulk_enroll_from_applicants
//   Body (JSON): { applicant_ids: int[], section_id, semester_id, year_level }
//   Enrolls multiple applicants in a single transaction.
//   Returns: enrolled, already_existed, failed counts + errors array
//
// INTERNAL HELPERS (defined inside the students block):
//   generateStudentNumber(db, year) – generates YYYY-NNNN with FOR UPDATE lock
//   enrollOneApplicant(db, ...) – idempotent single-applicant enrollment
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'students') {

    // ── GET — list or single ──────────────────────────────────────────────
    if ($method === 'GET') {
        $id     = pInt('id');
        $search = pNull('search');
        $status = pNull('status');

        if ($id) {
            $stmt = db()->prepare("
                SELECT s.id, s.student_id, s.Status, s.Enrollment_Date, s.year_level,
                       s.section_id, s.semester_id, s.applicant_id,
                       COALESCE(a.First_Name,        s.first_name)        AS First_Name,
                       COALESCE(a.Middle_Name,       s.middle_name)       AS Middle_Name,
                       COALESCE(a.Last_Name,         s.last_name)         AS Last_Name,
                       COALESCE(a.Suffix,            s.suffix)            AS Suffix,
                       COALESCE(a.Email,             s.email)             AS Email,
                       COALESCE(a.Contact_Number,    s.contact_number)    AS Contact_Number,
                       a.Sex, a.Civil_Status, a.Religion, a.Birthdate,
                       a.Birth_Place, a.Citizenship, a.Disability, a.First_Generation_Student,
                       a.Landline_Number, a.House_Number, a.Street,
                       a.Barangay, a.Municipality, a.Province, a.Zip_Code,
                       a.application_status,
                       TRIM(CONCAT_WS(' ',
                         NULLIF(CONVERT(COALESCE(a.First_Name,  s.first_name)  USING utf8mb4) COLLATE utf8mb4_general_ci, '' COLLATE utf8mb4_general_ci),
                         NULLIF(CONVERT(COALESCE(a.Middle_Name, s.middle_name) USING utf8mb4) COLLATE utf8mb4_general_ci, '' COLLATE utf8mb4_general_ci),
                         NULLIF(CONVERT(COALESCE(a.Last_Name,   s.last_name)   USING utf8mb4) COLLATE utf8mb4_general_ci, '' COLLATE utf8mb4_general_ci)
                       )) AS full_name,
                       COALESCE(ai.campus,      s.campus)       AS campus,
                       ai.admission_type, ai.student_type,
                       COALESCE(ic.Program_Code, s.program_code) AS Program_Code,
                       p.Program_Name,
                       sec.section_name, sem.semester_name,
                       eb.elementary_school_name, eb.elementary_school_address, eb.elementary_type,
                         eb.elementary_year_from, eb.elementary_year_to,
                       eb.high_school_name, eb.high_school_address, eb.high_school_type,
                         eb.high_school_year_from, eb.high_school_year_to,
                       eb.senior_high_school_name, eb.senior_high_school_address, eb.senior_high_school_type,
                         eb.senior_high_school_year_from, eb.senior_high_school_year_to,
                       eb.track_strand,
                       fi.guardian_first_name, fi.guardian_last_name, fi.guardian_contact_number,
                         fi.guardian_email, fi.guardian_relationship,
                         fi.guardian_barangay, fi.guardian_municipality, fi.guardian_province,
                       fi.father_first_name, fi.father_middle_name, fi.father_last_name,
                         fi.father_age, fi.father_citizenship, fi.father_educational_attainment,
                         fi.father_employment_status, fi.father_occupation,
                       fi.mother_first_name, fi.mother_middle_name, fi.mother_last_name,
                         fi.mother_age, fi.mother_citizenship, fi.mother_educational_attainment,
                         fi.mother_employment_status, fi.mother_occupation
                FROM students s
                LEFT JOIN applicants            a   ON a.id             = s.applicant_id
                LEFT JOIN admission_info        ai  ON ai.applicant_id  = s.applicant_id
                LEFT JOIN intended_course       ic  ON ic.applicant_id  = s.applicant_id
                LEFT JOIN programs              p   ON p.Program_Code   = CONVERT(COALESCE(ic.Program_Code, s.program_code) USING utf8mb4) COLLATE utf8mb4_unicode_ci
                LEFT JOIN section               sec ON sec.section_id   = s.section_id
                LEFT JOIN semester              sem ON sem.semester_id  = s.semester_id
                LEFT JOIN educational_background eb ON eb.applicant_id  = s.applicant_id
                LEFT JOIN family_info           fi  ON fi.applicant_id  = s.applicant_id
                WHERE s.id = ?
            ");
            if (!$stmt) respond(false, 'Query prepare failed: ' . db()->error);
            $stmt->bind_param('i', $id);
            $stmt->execute();
            respond(true, 'ok', ['data' => stmtFetchOne($stmt)]);
        }

        // List with optional filters
        $campus   = pNull('campus');
        $program  = pNull('program');
        $section  = pNull('section');
        $year     = pNull('year_level');
        $dateFrom = pNull('date_from');
        $dateTo   = pNull('date_to');

        $where  = ['1=1'];
        $params = [];
        $types  = '';

        if ($search) {
            $like    = "%$search%";
            $where[] = "(CONVERT(COALESCE(a.First_Name, s.first_name) USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(COALESCE(a.Last_Name, s.last_name) USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(s.student_id USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(COALESCE(a.Email, s.email) USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ?)";
            array_push($params, $like, $like, $like, $like);
            $types  .= 'ssss';
        }
        if ($status) {
            $where[] = "s.Status = ?";
            $params[] = $status;
            $types   .= 's';
        }
        if ($campus) {
            $where[] = "COALESCE(ai.campus, s.campus) = ?";
            $params[] = $campus;
            $types   .= 's';
        }
        if ($program) {
            $where[] = "COALESCE(ic.Program_Code, s.program_code) = ?";
            $params[] = $program;
            $types   .= 's';
        }
        if ($section) {
            $where[] = "sec.section_name = ?";
            $params[] = $section;
            $types   .= 's';
        }
        if ($year) {
            $where[] = "s.year_level = ?";
            $params[] = $year;
            $types   .= 's';
        }
        if ($dateFrom) {
            $where[] = "DATE(s.Enrollment_Date) >= ?";
            $params[] = $dateFrom;
            $types   .= 's';
        }
        if ($dateTo) {
            $where[] = "DATE(s.Enrollment_Date) <= ?";
            $params[] = $dateTo;
            $types   .= 's';
        }

        $sql = "
            SELECT s.id, s.student_id, s.Status, s.Enrollment_Date, s.year_level,
                   COALESCE(ai.campus,      s.campus)        AS campus,
                   TRIM(CONCAT_WS(' ',
                     NULLIF(CONVERT(COALESCE(a.First_Name,  s.first_name)  USING utf8mb4) COLLATE utf8mb4_general_ci, '' COLLATE utf8mb4_general_ci),
                     NULLIF(CONVERT(COALESCE(a.Middle_Name, s.middle_name) USING utf8mb4) COLLATE utf8mb4_general_ci, '' COLLATE utf8mb4_general_ci),
                     NULLIF(CONVERT(COALESCE(a.Last_Name,   s.last_name)   USING utf8mb4) COLLATE utf8mb4_general_ci, '' COLLATE utf8mb4_general_ci)
                   )) AS full_name,
                   COALESCE(a.Email,         s.email)         AS Email,
                   COALESCE(a.Contact_Number,s.contact_number)AS Contact_Number,
                   COALESCE(ic.Program_Code, s.program_code)  AS Program_Code,
                   p.Program_Name,
                   sec.section_name,
                   sem.semester_name
            FROM students s
            LEFT JOIN applicants      a   ON a.id             = s.applicant_id
            LEFT JOIN admission_info  ai  ON ai.applicant_id  = s.applicant_id
            LEFT JOIN intended_course ic  ON ic.applicant_id  = s.applicant_id
            LEFT JOIN programs        p   ON p.Program_Code   = CONVERT(COALESCE(ic.Program_Code, s.program_code) USING utf8mb4) COLLATE utf8mb4_unicode_ci
            LEFT JOIN section         sec ON sec.section_id   = s.section_id
            LEFT JOIN semester        sem ON sem.semester_id  = s.semester_id
            WHERE " . implode(' AND ', $where) . "
            ORDER BY s.id DESC
        ";

        $stmt = db()->prepare($sql);
        if (!$stmt) respond(false, 'Query prepare failed: ' . db()->error);
        if ($params) $stmt->bind_param($types, ...$params);
        $stmt->execute();
        respond(true, 'ok', ['data' => stmtFetchAll($stmt)]);
    }

    // ── POST ──────────────────────────────────────────────────────────────
    if ($method === 'POST') {

        // ── action: update — partial student record update ─────────────────────
        // Accepts any subset of editable fields; only provided (non-null/non-zero)
        // values are written.  Builds the SET clause dynamically to avoid
        // overwriting unrelated columns with empty strings.
        if ($action === 'update') {
            $id          = pInt('student_id');
            $sectionId   = pInt('section_id');   // nullable — 0 means keep
            $yearLevel   = pNull('year_level');
            $campus      = pNull('campus');
            $programCode = pNull('program_code');
            $email       = pNull('email');
            $contact     = pNull('contact_number');

            if (!$id) respond(false, 'student_id is required.');

            $db = db();

            // Build dynamic SET clause
            $sets   = [];
            $params = [];
            $types  = '';

            if ($sectionId) { $sets[] = 'section_id=?';    $params[] = $sectionId; $types .= 'i'; }
            if ($yearLevel)  { $sets[] = 'year_level=?';    $params[] = $yearLevel; $types .= 's'; }
            if ($campus)     { $sets[] = 'campus=?';        $params[] = $campus;    $types .= 's'; }
            if ($programCode){ $sets[] = 'program_code=?';  $params[] = $programCode; $types .= 's'; }
            if ($email !== null) { $sets[] = 'email=?';     $params[] = $email;     $types .= 's'; }
            if ($contact !== null) { $sets[] = 'contact_number=?'; $params[] = $contact; $types .= 's'; }

            if (!$sets) respond(false, 'Nothing to update.');

            $params[] = $id;
            $types   .= 'i';
            $stmt = $db->prepare("UPDATE students SET " . implode(', ', $sets) . " WHERE id=?");
            $stmt->bind_param($types, ...$params);
            $stmt->execute() ? respond(true, 'Student updated.') : respond(false, $db->error);
        }

        // ── update_status ──────────────────────────────────────────────────
        if ($action === 'update_status') {
            $id     = pInt('student_id');
            $status = p('status');
            $stmt   = db()->prepare("UPDATE students SET Status=? WHERE id=?");
            $stmt->bind_param('si', $status, $id);
            $stmt->execute() ? respond(true, 'Status updated.') : respond(false, db()->error);
        }

        // ── Helper: generate next student number ─────────────────────────────
        /**
         * Generate the next sequential student number for a given year.
         *
         * Format: YYYY-NNNN (e.g. "2025-0001", "2025-0042").
         * Uses SELECT … FOR UPDATE inside the caller's transaction to prevent
         * two concurrent requests from issuing the same number under load.
         *
         * @param  mysqli $db   Active database connection (must be inside a transaction).
         * @param  int    $year Four-digit enrollment year (typically the current year).
         * @return string       Zero-padded student number string.
         */
        function generateStudentNumber(mysqli $db, int $year): string
        {
            $prefix = $year . '-';
            $stmt = $db->prepare("
                SELECT student_id FROM students
                WHERE student_id LIKE ?
                ORDER BY student_id DESC LIMIT 1
                FOR UPDATE
            ");
            $like = $year . '-%';
            $stmt->bind_param('s', $like);
            $stmt->execute();
            $row = stmtFetchOne($stmt);

            if ($row) {
                $parts = explode('-', $row['student_id']);
                $next  = (int)end($parts) + 1;
            } else {
                $next = 1;
            }
            return $prefix . str_pad((string)$next, 4, '0', STR_PAD_LEFT);
        }

        // ── Helper: convert one applicant to student ────────────────────────
        /**
         * Idempotent single-applicant enrollment.
         *
         * Checks for an existing student record first (duplicate guard).
         * If one exists, re-syncs the applicant status to "Enrolled" and
         * returns already_existed=true without inserting a duplicate row.
         * If none exists, fetches applicant data, inserts a new student row,
         * marks the applicant as Enrolled, and writes to the audit log.
         *
         * Called by both enroll_from_applicant (single) and
         * bulk_enroll_from_applicants.  The caller is responsible for
         * wrapping calls in a transaction and committing/rolling back.
         *
         * @param  mysqli $db          Active database connection.
         * @param  int    $applicantId Row ID from the applicants table.
         * @param  int    $sectionId   Target section_id for enrollment.
         * @param  int    $semesterId  Target semester_id for enrollment.
         * @param  string $yearLevel   Override year level; falls back to
         *                             admission_info.year_level then "1st Year".
         * @param  int    $year        Four-digit year for student number generation.
         * @return array{
         *           ok: bool,
         *           student_number: string|null,
         *           already_existed: bool,
         *           msg: string
         *         }
         */
        function enrollOneApplicant(
            mysqli $db,
            int    $applicantId,
            int    $sectionId,
            int    $semesterId,
            string $yearLevel,
            int    $year
        ): array {
            // Duplicate guard
            $chk = $db->prepare("SELECT id, student_id FROM students WHERE applicant_id = ? LIMIT 1");
            $chk->bind_param('i', $applicantId);
            $chk->execute();
            $existing = stmtFetchOne($chk);
            if ($existing) {
                $upd = $db->prepare("UPDATE applicants SET application_status='Enrolled' WHERE id=?");
                $upd->bind_param('i', $applicantId);
                $upd->execute();
                logStatusChange($db, $applicantId, 'Enrolled', 'system');
                return ['ok' => true, 'student_number' => $existing['student_id'], 'already_existed' => true, 'msg' => 'Already a student.'];
            }

            // Fetch applicant data
            $stmt = $db->prepare("
                SELECT a.First_Name, a.Middle_Name, a.Last_Name, a.Suffix,
                       a.Email, a.Contact_Number,
                       ai.campus, ai.year_level AS adm_year_level, ai.admission_type,
                       ic.Program_Code
                FROM applicants a
                LEFT JOIN admission_info  ai ON ai.applicant_id = a.id
                LEFT JOIN intended_course ic ON ic.applicant_id = a.id
                WHERE a.id = ?
            ");
            $stmt->bind_param('i', $applicantId);
            $stmt->execute();
            $ap = stmtFetchOne($stmt);

            if (!$ap) {
                return ['ok' => false, 'student_number' => null, 'already_existed' => false, 'msg' => "Applicant #$applicantId not found."];
            }

            $finalYearLevel = $yearLevel ?: ($ap['adm_year_level'] ?? '1st Year');
            $studentNumber  = generateStudentNumber($db, $year);
            $enrollDate     = date('Y-m-d');

            $ins = $db->prepare("
                INSERT INTO students
                  (student_id, applicant_id,
                   first_name, middle_name, last_name, suffix,
                   email, contact_number,
                   program_code, campus, year_level,
                   section_id, semester_id,
                   Enrollment_Date, Status, created_at)
                VALUES (?, ?,
                        ?, ?, ?, ?,
                        ?, ?,
                        ?, ?, ?,
                        ?, ?,
                        ?, 'Active', NOW())
            ");
            $ins->bind_param(
                'sisssssssssiis',
                $studentNumber,
                $applicantId,
                $ap['First_Name'],
                $ap['Middle_Name'],
                $ap['Last_Name'],
                $ap['Suffix'],
                $ap['Email'],
                $ap['Contact_Number'],
                $ap['Program_Code'],
                $ap['campus'],
                $finalYearLevel,
                $sectionId,
                $semesterId,
                $enrollDate
            );

            if (!$ins->execute()) {
                return ['ok' => false, 'student_number' => null, 'already_existed' => false, 'msg' => $db->error];
            }

            $upd = $db->prepare("UPDATE applicants SET application_status='Enrolled' WHERE id=?");
            $upd->bind_param('i', $applicantId);
            $upd->execute();
            logStatusChange($db, $applicantId, 'Enrolled', 'admin');

            return ['ok' => true, 'student_number' => $studentNumber, 'already_existed' => false, 'msg' => 'Enrolled.'];
        }

        // ── enroll_from_applicant (single) ────────────────────────────────
        if ($action === 'enroll_from_applicant') {
            $applicantId = pInt('applicant_id');
            $sectionId   = pInt('section_id');
            $semesterId  = pInt('semester_id');
            $yearLevel   = p('year_level');
            $year        = (int)date('Y');

            if (!$applicantId || !$sectionId || !$semesterId) {
                respond(false, 'applicant_id, section_id, and semester_id are required.');
            }

            $db = db();
            $db->begin_transaction();
            $result = enrollOneApplicant($db, $applicantId, $sectionId, $semesterId, $yearLevel, $year);
            if ($result['ok']) {
                $db->commit();
                respond(true, $result['msg'], [
                    'student_number'  => $result['student_number'],
                    'already_existed' => $result['already_existed'],
                ]);
            } else {
                $db->rollback();
                respond(false, $result['msg']);
            }
        }

        // ── bulk_enroll_from_applicants ────────────────────────────────────
        if ($action === 'bulk_enroll_from_applicants') {
            $applicantIds = $body['applicant_ids'] ?? [];
            $sectionId    = isset($body['section_id'])  ? (int)$body['section_id']  : 0;
            $semesterId   = isset($body['semester_id']) ? (int)$body['semester_id'] : 0;
            $yearLevel    = isset($body['year_level'])  ? trim($body['year_level'])  : '';
            $year         = (int)date('Y');

            if (!is_array($applicantIds) || !count($applicantIds)) {
                respond(false, 'applicant_ids array is required.');
            }
            if (!$sectionId || !$semesterId) {
                respond(false, 'section_id and semester_id are required.');
            }

            $db = db();
            $db->begin_transaction();

            $enrolled      = 0;
            $alreadyExisted = 0;
            $failed        = 0;
            $studentNumbers = [];
            $errors        = [];

            foreach ($applicantIds as $rawId) {
                $applicantId = (int)$rawId;
                if (!$applicantId) continue;

                $result = enrollOneApplicant($db, $applicantId, $sectionId, $semesterId, $yearLevel, $year);
                if ($result['ok']) {
                    $studentNumbers[] = $result['student_number'];
                    if ($result['already_existed']) {
                        $alreadyExisted++;
                    } else {
                        $enrolled++;
                    }
                } else {
                    $failed++;
                    $errors[] = "ID $applicantId: " . $result['msg'];
                }
            }

            $db->commit();

            respond(true, "Enrollment complete: $enrolled new, $alreadyExisted already existed, $failed failed.", [
                'enrolled'        => $enrolled,
                'already_existed' => $alreadyExisted,
                'failed'          => $failed,
                'student_numbers' => $studentNumbers,
                'errors'          => $errors,
            ]);
        }
    }
}

// ═════════════════════════════════════════════════════════════════════════════
// §09  RESOURCE: enrollment
// ─────────────────────────────────────────────────────────────────────────────
// Read-only view of the enrollment table with full context joins.
// Enrollment rows are created by enrollOneApplicant(), not via this resource.
//
// GET  ?student_id=<int>  (optional filter)
//   Returns enrollment records joined with student, applicant, section,
//   semester, year, intended_course, and programs.
//   Omitting student_id returns all enrollment records.
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'enrollment') {
    if ($method === 'GET') {
        $studentId = pInt('student_id');

        $where  = ['1=1'];
        $params = [];
        $types  = '';
        if ($studentId) {
            $where[] = 'e.student_id = ?';
            $params[] = $studentId;
            $types   .= 'i';
        }

        $sql = "
            SELECT e.enrollment_id, e.status, e.enrollment_date,
                   s.student_id,
                   CONCAT(CONVERT(a.First_Name USING utf8mb4) COLLATE utf8mb4_general_ci,' ',CONVERT(a.Last_Name USING utf8mb4) COLLATE utf8mb4_general_ci) as student_name,
                   ic.Program_Code, p.Program_Name,
                   sec.section_name, sem.semester_name, y.academic_year
            FROM enrollment e
            JOIN students s ON s.id = e.student_id
            LEFT JOIN applicants a ON a.id = s.applicant_id
            LEFT JOIN section sec ON sec.section_id = e.section_id
            LEFT JOIN semester sem ON sem.semester_id = e.semester_id
            LEFT JOIN year y ON y.year_id = e.year_id
            LEFT JOIN intended_course ic ON ic.applicant_id = s.applicant_id
            LEFT JOIN programs p ON p.Program_Code = ic.Program_Code
            WHERE " . implode(' AND ', $where) . "
            ORDER BY e.enrollment_date DESC
        ";
        $stmt = db()->prepare($sql);
        if (!$stmt) respond(false, 'Query prepare failed: ' . db()->error);
        if ($params) $stmt->bind_param($types, ...$params);
        $stmt->execute();
        respond(true, 'ok', ['data' => stmtFetchAll($stmt)]);
    }
}

// ═════════════════════════════════════════════════════════════════════════════
// §10  RESOURCE: grades
// ─────────────────────────────────────────────────────────────────────────────
// GET  ?mode=students  (or no student_id)
//   Returns a distinct list of students who have at least one grade record.
//   Used to populate the grade management list view.
//
// GET  ?student_id=<int>
//   Returns all grade rows for the student joined with subject and instructor.
//   Used by the Student Detail panel and the print/PDF record.
//
// POST action=update
//   Params: grade_id, class_engagement, learning_outputs, quizzes, midterm, final
//   Recalculates derived fields on the server side:
//     total       = sum of five components × 0.20  (percentage weight)
//     final_grade = GPA equivalent (1.00–5.0 scale) based on raw average
//     remarks     = Passed (≥75) | Conditional Failure (≥70) | Failed (<70)
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'grades') {
    if ($method === 'GET') {
        $mode      = p('mode');
        $search    = pNull('search');
        $studentId = pInt('student_id');

        if ($mode === 'students' || (!$studentId && !$mode)) {
            $where = '1=1';
            $params = [];
            $types = '';
            if ($search) {
                $like = "%$search%";
                $where = "(CONVERT(a.First_Name USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(a.Last_Name USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(s.student_id USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ?)";
                $params = [$like, $like, $like];
                $types = 'sss';
            }
            $sql = "SELECT DISTINCT s.id, s.student_id,
                           CONCAT(CONVERT(a.First_Name USING utf8mb4) COLLATE utf8mb4_general_ci,' ',IFNULL(CONVERT(a.Middle_Name USING utf8mb4) COLLATE utf8mb4_general_ci,'' COLLATE utf8mb4_general_ci),' ',CONVERT(a.Last_Name USING utf8mb4) COLLATE utf8mb4_general_ci) as student_name,
                           a.Email, ic.Program_Code, sem.semester_name
                    FROM students s
                    LEFT JOIN applicants a ON a.id = s.applicant_id
                    LEFT JOIN intended_course ic ON ic.applicant_id = s.applicant_id
                    LEFT JOIN enrollment e ON e.student_id = s.id
                    LEFT JOIN semester sem ON sem.semester_id = e.semester_id
                    LEFT JOIN enrolled_subjects es ON es.enrollment_id = e.enrollment_id
                    LEFT JOIN grades g ON g.enrolled_subject_id = es.enrolled_subject_id
                    WHERE $where AND g.grade_id IS NOT NULL
                    ORDER BY s.id DESC";
            $stmt = db()->prepare($sql);
            if ($params) $stmt->bind_param($types, ...$params);
            $stmt->execute();
            respond(true, 'ok', ['data' => stmtFetchAll($stmt)]);
        }

        if ($studentId) {
            $stmt = db()->prepare("
                SELECT g.grade_id,
                       g.class_engagement, g.learning_outputs, g.quizzes, g.midterm, g.final,
                       g.total, g.final_grade, g.remarks,
                       sub.Subject_Code, sub.Subject_Name, sub.Credits,
                       CONCAT(CONVERT(i.First_Name USING utf8mb4) COLLATE utf8mb4_general_ci,' ',CONVERT(i.Last_Name USING utf8mb4) COLLATE utf8mb4_general_ci) as instructor_name
                FROM grades g
                JOIN enrolled_subjects es ON es.enrolled_subject_id = g.enrolled_subject_id
                JOIN enrollment e ON e.enrollment_id = es.enrollment_id
                JOIN students s ON s.id = e.student_id
                JOIN subjects sub ON sub.Subject_Id = es.subject_id
                LEFT JOIN instructors i ON i.Instructor_ID = es.instructor_id
                WHERE s.id = ?
                ORDER BY sub.Subject_Code
            ");
            $stmt->bind_param('i', $studentId);
            $stmt->execute();
            respond(true, 'ok', ['data' => stmtFetchAll($stmt)]);
        }
    }

    if ($method === 'POST' && $action === 'update') {
        $id           = pInt('grade_id');
        $class_eng    = (float)p('class_engagement');
        $learning_out = (float)p('learning_outputs');
        $quizzes      = (float)p('quizzes');
        $midterm      = (float)p('midterm');
        $final        = (float)p('final');
        $total        = round(($class_eng + $learning_out + $quizzes + $midterm + $final) * 0.20, 2);

        $avg = ($class_eng + $learning_out + $quizzes + $midterm + $final) / 5;
        if ($avg >= 99)      $fg = '1.00';
        elseif ($avg >= 96)  $fg = '1.25';
        elseif ($avg >= 93)  $fg = '1.50';
        elseif ($avg >= 90)  $fg = '1.75';
        elseif ($avg >= 87)  $fg = '2.00';
        elseif ($avg >= 84)  $fg = '2.25';
        elseif ($avg >= 81)  $fg = '2.50';
        elseif ($avg >= 78)  $fg = '2.75';
        elseif ($avg >= 75)  $fg = '3.00';
        elseif ($avg >= 70)  $fg = '4.0';
        else                 $fg = '5.0';

        if ($total >= 75)       $remarks = 'Passed';
        elseif ($total >= 70)   $remarks = 'Conditional Failure';
        else                    $remarks = 'Failed';

        $stmt = db()->prepare("UPDATE grades SET class_engagement=?, learning_outputs=?, quizzes=?, midterm=?, final=?, remarks=? WHERE grade_id=?");
        $stmt->bind_param('dddddsi', $class_eng, $learning_out, $quizzes, $midterm, $final, $remarks, $id);
        $stmt->execute() ? respond(true, 'Grade updated.') : respond(false, db()->error);
    }
}

// ═════════════════════════════════════════════════════════════════════════════
// §11  RESOURCE: payments
// ─────────────────────────────────────────────────────────────────────────────
// GET  ?student_id=<int>&search=<str>&status=<str>
//   Returns payment records joined with student, applicant, semester,
//   year, and receipt (for receipt_number).
//   Filters: student_id (exact), search (name/student_id/receipt), status.
//   Used by the Student Detail payment panel and the print/PDF record.
//
// POST action=update_status
//   Params: payment_id, status
//   Simple status column update; no business logic.
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'payments') {
    if ($method === 'GET') {
        $search    = pNull('search');
        $status    = pNull('status');
        $studentId = pInt('student_id');

        $where = ['1=1'];
        $params = [];
        $types = '';
        if ($studentId) {
            $where[] = "pay.student_id = ?";
            $params[] = $studentId;
            $types .= 'i';
        }
        if ($search) {
            $like = "%$search%";
            $where[] = "(CONVERT(a.First_Name USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(a.Last_Name USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(s.student_id USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(r.receipt_number USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ?)";
            $params = array_merge($params, [$like, $like, $like, $like]);
            $types .= 'ssss';
        }
        if ($status) {
            $where[] = "pay.status = ?";
            $params[] = $status;
            $types .= 's';
        }

        $sql = "SELECT pay.payment_id, pay.amount, pay.payment_date, pay.payment_method, pay.status,
                       CONCAT(CONVERT(a.First_Name USING utf8mb4) COLLATE utf8mb4_general_ci,' ',CONVERT(a.Last_Name USING utf8mb4) COLLATE utf8mb4_general_ci) as student_name,
                       s.student_id, sem.semester_name, y.academic_year,
                       r.receipt_number
                FROM payment pay
                JOIN students s ON s.id = pay.student_id
                LEFT JOIN applicants a ON a.id = s.applicant_id
                LEFT JOIN semester sem ON sem.semester_id = pay.semester_id
                LEFT JOIN year y ON y.year_id = pay.year_id
                LEFT JOIN receipt r ON r.payment_id = pay.payment_id
                WHERE " . implode(' AND ', $where) . "
                ORDER BY pay.payment_date DESC";

        $stmt = db()->prepare($sql);
        if ($params) $stmt->bind_param($types, ...$params);
        $stmt->execute();
        respond(true, 'ok', ['data' => stmtFetchAll($stmt)]);
    }

    if ($method === 'POST' && $action === 'update_status') {
        $id     = pInt('payment_id');
        $status = p('status');
        $stmt = db()->prepare("UPDATE payment SET status=? WHERE payment_id=?");
        $stmt->bind_param('si', $status, $id);
        $stmt->execute() ? respond(true, 'Payment status updated.') : respond(false, db()->error);
    }
}

// ═════════════════════════════════════════════════════════════════════════════
// §12  RESOURCE: programs
// ─────────────────────────────────────────────────────────────────────────────
// Requires Admin or Super Admin role for all POST operations.
//
// GET  ?specializations=1&program_code=<str>
//   Returns specialization rows for a single program.
//
// GET  ?search=<str>
//   Returns program list joined with college and specialization count.
//
// POST action=create
//   Params: program_code (unique PK), program_name, college_id,
//           specializations (comma-separated names, optional)
//   Inserts program row then specialization rows using INSERT IGNORE.
//
// POST action=add_specialization
//   Params: program_code, specialization (name)
//   Auto-derives spec_code by stripping non-alphanumeric chars and uppercasing.
//
// POST action=delete
//   Params: program_code
//   Cascades: deletes all specializations for the program first.
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'programs') {
    if ($method === 'GET') {
        $search   = pNull('search');
        $specMode = (bool)p('specializations');
        $progCode = pNull('program_code');

        if ($specMode && $progCode) {
            $stmt = db()->prepare("SELECT spec_code, spec_name as Specialization FROM specializations WHERE Program_Code=? ORDER BY spec_name");
            $stmt->bind_param('s', $progCode);
            $stmt->execute();
            respond(true, 'ok', ['data' => stmtFetchAll($stmt)]);
        }

        $where = '1=1';
        $params = [];
        $types = '';
        if ($search) {
            $like = "%$search%";
            $where = "(CONVERT(p.Program_Code USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(p.Program_Name USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ?)";
            $params = [$like, $like];
            $types = 'ss';
        }
        $sql = "SELECT p.Program_Code, p.Program_Name, c.college_name,
                       COUNT(DISTINCT sp.id) as spec_count
                FROM programs p
                JOIN colleges c ON c.college_id = p.college_id
                LEFT JOIN specializations sp ON sp.Program_Code = p.Program_Code
                WHERE $where
                GROUP BY p.Program_Code
                ORDER BY c.college_name, p.Program_Name";
        $stmt = db()->prepare($sql);
        if ($params) $stmt->bind_param($types, ...$params);
        $stmt->execute();
        respond(true, 'ok', ['data' => stmtFetchAll($stmt)]);
    }

    if ($method === 'POST') {
        // Reference data writes: Admin and Super Admin only
        if (!in_array($_currentRole, ['Super Admin', 'Admin'], true))
            respond(false, 'Access denied. Admin or higher required.');

        if ($action === 'create') {
            $code      = p('program_code');
            $name      = p('program_name');
            $collegeId = pInt('college_id');
            $specsRaw  = pRaw('specializations');

            if (!$code || !$name) respond(false, 'Program code and name are required.');

            $db = db();
            $stmt = $db->prepare("INSERT INTO programs (Program_Code, Program_Name, college_id) VALUES (?,?,?)");
            $stmt->bind_param('ssi', $code, $name, $collegeId);
            if (!$stmt->execute()) respond(false, 'Could not create program: ' . $db->error);

            if ($specsRaw) {
                $specs = array_filter(array_map('trim', explode(',', $specsRaw)));
                foreach ($specs as $spec) {
                    $specCode = strtoupper(preg_replace('/[^A-Za-z0-9]/', '', $spec));
                    $s = $db->prepare("INSERT IGNORE INTO specializations (Program_Code, spec_code, spec_name) VALUES (?,?,?)");
                    $s->bind_param('sss', $code, $specCode, $spec);
                    $s->execute();
                }
            }
            respond(true, 'Program created.');
        }

        if ($action === 'add_specialization') {
            $progCode = p('program_code');
            $specName = p('specialization');
            if (!$progCode || !$specName) respond(false, 'Program code and specialization name are required.');
            $specCode = strtoupper(preg_replace('/[^A-Za-z0-9]/', '', $specName));
            $stmt = db()->prepare("INSERT INTO specializations (Program_Code, spec_code, spec_name) VALUES (?,?,?)");
            $stmt->bind_param('sss', $progCode, $specCode, $specName);
            $stmt->execute() ? respond(true, 'Specialization added.') : respond(false, db()->error);
        }

        if ($action === 'delete') {
            $code = p('program_code');
            $db = db();
            $s = $db->prepare("DELETE FROM specializations WHERE Program_Code=?");
            $s->bind_param('s', $code);
            $s->execute();
            $stmt = $db->prepare("DELETE FROM programs WHERE Program_Code=?");
            $stmt->bind_param('s', $code);
            $stmt->execute() ? respond(true, 'Program deleted.') : respond(false, $db->error);
        }
    }
}

// ═════════════════════════════════════════════════════════════════════════════
// §13  RESOURCE: subjects
// ─────────────────────────────────────────────────────────────────────────────
// Requires Admin or Super Admin role for POST operations.
//
// GET  ?search=<str>
//   Returns subjects joined with college, filtered by Subject_Code or
//   Subject_Name.  Used to populate subject lists and instructor modals.
//
// POST action=create
//   Params: subject_code, subject_name, credits (int), college_id (int)
//
// POST action=delete
//   Params: subject_id
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'subjects') {
    if ($method === 'GET') {
        $search = pNull('search');
        $where  = '1=1';
        $params = [];
        $types = '';
        if ($search) {
            $like = "%$search%";
            $where = "(CONVERT(s.Subject_Code USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(s.Subject_Name USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ?)";
            $params = [$like, $like];
            $types = 'ss';
        }
        $sql = "SELECT s.Subject_Id, s.Subject_Code, s.Subject_Name, s.Credits, c.college_name
                FROM subjects s
                LEFT JOIN colleges c ON c.college_id = s.College_Id
                WHERE $where
                ORDER BY s.Subject_Code";
        $stmt = db()->prepare($sql);
        if ($params) $stmt->bind_param($types, ...$params);
        $stmt->execute();
        respond(true, 'ok', ['data' => stmtFetchAll($stmt)]);
    }

    if ($method === 'POST') {
        if (!in_array($_currentRole, ['Super Admin', 'Admin'], true))
            respond(false, 'Access denied. Admin or higher required.');
        if ($action === 'create') {
            $code      = p('subject_code');
            $name      = p('subject_name');
            $credits   = pInt('credits');
            $collegeId = pInt('college_id');
            if (!$code || !$name) respond(false, 'Subject code and name are required.');
            $stmt = db()->prepare("INSERT INTO subjects (Subject_Code, Subject_Name, Credits, College_Id) VALUES (?,?,?,?)");
            $stmt->bind_param('ssii', $code, $name, $credits, $collegeId);
            $stmt->execute() ? respond(true, 'Subject created.') : respond(false, db()->error);
        }
        if ($action === 'delete') {
            $id = pInt('subject_id');
            $stmt = db()->prepare("DELETE FROM subjects WHERE Subject_Id=?");
            $stmt->bind_param('i', $id);
            $stmt->execute() ? respond(true, 'Subject deleted.') : respond(false, db()->error);
        }
    }
}

// ═════════════════════════════════════════════════════════════════════════════
// §14  RESOURCE: instructors
// ─────────────────────────────────────────────────────────────────────────────
// Requires Admin or Super Admin role for POST operations.
//
// GET  ?search=<str>
//   Returns instructors joined with subjects, college, and campus.
//   Search matches First_Name, Last_Name, or Degree.
//
// POST action=create
//   Params: first_name, last_name, middle_name, suffix_title, degree, email,
//           subject_code (resolved to Subject_Id), college_id, campus_name
//           (resolved to Campus_Id).
//   campus_name and subject_code are resolved via separate SELECT queries
//   before the INSERT so foreign key references are always integer IDs.
//
// POST action=delete
//   Params: instructor_id
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'instructors') {
    if ($method === 'GET') {
        $search = pNull('search');
        $where  = '1=1';
        $params = [];
        $types = '';
        if ($search) {
            $like = "%$search%";
            $where = "(CONVERT(i.First_Name USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(i.Last_Name USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(i.Degree USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ?)";
            $params = [$like, $like, $like];
            $types = 'sss';
        }
        $sql = "SELECT i.Instructor_ID as instructor_id, i.Last_Name, i.First_Name, i.Middle_Name,
                       i.Degree, i.Suffix_Title,
                       sub.Subject_Code, sub.Subject_Name,
                       c.college_name, camp.Campus_Name
                FROM instructors i
                LEFT JOIN subjects sub ON sub.Subject_Id = i.Subject_ID
                LEFT JOIN colleges c ON c.college_id = i.College_ID
                LEFT JOIN campus camp ON camp.Campus_Id = i.Campus_ID
                WHERE $where
                ORDER BY i.Last_Name";
        $stmt = db()->prepare($sql);
        if ($params) $stmt->bind_param($types, ...$params);
        $stmt->execute();
        respond(true, 'ok', ['data' => stmtFetchAll($stmt)]);
    }

    if ($method === 'POST') {
        if (!in_array($_currentRole, ['Super Admin', 'Admin'], true))
            respond(false, 'Access denied. Admin or higher required.');
        if ($action === 'create') {
            $first      = p('first_name');
            $middle     = pNull('middle_name');
            $last       = p('last_name');
            $suffix     = pNull('suffix_title');
            $degree     = pNull('degree');
            $email      = pNull('email');
            $subjCode   = pNull('subject_code');
            $collegeId  = pNull('college_id');
            $campusName = pNull('campus_name');

            if (!$first || !$last) respond(false, 'First and last name are required.');

            $db = db();

            $subjectId = null;
            if ($subjCode) {
                $s = $db->prepare("SELECT Subject_Id FROM subjects WHERE Subject_Code=?");
                $s->bind_param('s', $subjCode);
                $s->execute();
                $row = stmtFetchOne($s);
                $subjectId = $row ? (int)$row['Subject_Id'] : null;
            }

            $campusId = null;
            if ($campusName) {
                $s = $db->prepare("SELECT Campus_Id FROM campus WHERE Campus_Name=?");
                $s->bind_param('s', $campusName);
                $s->execute();
                $row = stmtFetchOne($s);
                $campusId = $row ? (int)$row['Campus_Id'] : null;
            }

            $stmt = $db->prepare("INSERT INTO instructors (First_Name, Middle_Name, Last_Name, Suffix_Title, Degree, Subject_ID, College_ID, Campus_ID) VALUES (?,?,?,?,?,?,?,?)");
            $stmt->bind_param('ssssssii', $first, $middle, $last, $suffix, $degree, $subjectId, $collegeId, $campusId);
            $stmt->execute() ? respond(true, 'Instructor created.') : respond(false, $db->error);
        }

        if ($action === 'delete') {
            $id = pInt('instructor_id');
            $stmt = db()->prepare("DELETE FROM instructors WHERE Instructor_ID=?");
            $stmt->bind_param('i', $id);
            $stmt->execute() ? respond(true, 'Instructor deleted.') : respond(false, db()->error);
        }
    }
}

// ═════════════════════════════════════════════════════════════════════════════
// §15  RESOURCE: colleges
// ─────────────────────────────────────────────────────────────────────────────
// GET  (no params)
//   Returns all colleges with their program_count (used in college filter
//   dropdowns and the Colleges management section).
//   Ordered alphabetically by college_name.
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'colleges') {
    $r = db()->query("
        SELECT c.college_id, c.college_name, c.college_code, c.college_email,
               COUNT(DISTINCT p.Program_Code) as program_count
        FROM colleges c
        LEFT JOIN programs p ON p.college_id = c.college_id
        GROUP BY c.college_id ORDER BY c.college_name
    ");
    respond(true, 'ok', ['data' => $r->fetch_all(MYSQLI_ASSOC)]);
}

// ═════════════════════════════════════════════════════════════════════════════
// §16  RESOURCE: campus
// ─────────────────────────────────────────────────────────────────────────────
// GET  (no params)
//   Returns all campus rows ordered by Campus_Name.
//   Used at boot time by initCampusDropdowns() in admin.js to populate
//   every campus <select> element from a single API call.
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'campus') {
    $r = db()->query("SELECT * FROM campus ORDER BY Campus_Name");
    respond(true, 'ok', ['data' => $r->fetch_all(MYSQLI_ASSOC)]);
}

// ═════════════════════════════════════════════════════════════════════════════
// §17  RESOURCE: sections
// ─────────────────────────────────────────────────────────────────────────────
// Requires Admin or Super Admin role for POST operations.
//
// GET  ?search=<str>&year_level=<str>&campus=<str>
//   Returns sections joined with programs and campus.
//   Includes a correlated subquery for student_count (active enrollments
//   in each section) — kept as a subquery for simplicity over a JOIN.
//
// POST action=create
//   Params: section_name, program_code, year_level (required),
//           campus_name (optional — resolved to campus_id).
//
// POST action=delete
//   Params: section_id
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'sections') {
    if ($method === 'GET') {
        $search    = pNull('search');
        $yearLevel = pNull('year_level');
        $campus    = pNull('campus');
        $where = ['1=1'];
        $params = [];
        $types = '';
        if ($search) {
            $like = "%$search%";
            $where[] = "(CONVERT(s.section_name USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(p.Program_Name USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ? OR CONVERT(s.program_code USING utf8mb4) COLLATE utf8mb4_general_ci LIKE ?)";
            $params = array_merge($params, [$like, $like, $like]);
            $types .= 'sss';
        }
        if ($yearLevel) {
            $where[] = "s.year_level = ?";
            $params[] = $yearLevel;
            $types .= 's';
        }
        if ($campus) {
            $where[] = "camp.Campus_Name = ?";
            $params[] = $campus;
            $types .= 's';
        }

        $sql = "SELECT s.section_id, s.section_name, s.year_level, s.program_code,
                       p.Program_Name, camp.Campus_Name,
                       (SELECT COUNT(*) FROM students st
                        WHERE st.section_id = s.section_id) as student_count
                FROM section s
                LEFT JOIN programs p ON p.Program_Code = s.program_code
                LEFT JOIN campus camp ON camp.Campus_Id = s.campus_id
                WHERE " . implode(' AND ', $where) . "
                ORDER BY s.section_name";
        $stmt = db()->prepare($sql);
        if ($params) $stmt->bind_param($types, ...$params);
        $stmt->execute();
        respond(true, 'ok', ['data' => stmtFetchAll($stmt)]);
    }

    if ($method === 'POST') {
        if (!in_array($_currentRole, ['Super Admin', 'Admin'], true))
            respond(false, 'Access denied. Admin or higher required.');
        if ($action === 'create') {
            $name       = p('section_name');
            $progCode   = p('program_code');
            $yearLevel  = pNull('year_level');
            $campusName = pNull('campus_name');
            if (!$name || !$progCode || !$yearLevel) respond(false, 'Section name, program, and year level are required.');

            $db = db();
            $campusId = null;
            if ($campusName) {
                $s = $db->prepare("SELECT Campus_Id FROM campus WHERE Campus_Name=?");
                $s->bind_param('s', $campusName);
                $s->execute();
                $row = stmtFetchOne($s);
                $campusId = $row ? (int)$row['Campus_Id'] : null;
            }
            $stmt = $db->prepare("INSERT INTO section (section_name, program_code, year_level, campus_id) VALUES (?,?,?,?)");
            $stmt->bind_param('sssi', $name, $progCode, $yearLevel, $campusId);
            $stmt->execute() ? respond(true, 'Section created.') : respond(false, $db->error);
        }

        if ($action === 'delete') {
            $id = pInt('section_id');
            $stmt = db()->prepare("DELETE FROM section WHERE section_id=?");
            $stmt->bind_param('i', $id);
            $stmt->execute() ? respond(true, 'Section deleted.') : respond(false, db()->error);
        }
    }
}

// ═════════════════════════════════════════════════════════════════════════════
// §18  RESOURCE: semesters
// ─────────────────────────────────────────────────────────────────────────────
// GET  (no params)
//   Returns all semester rows ordered by semester_id DESC (newest first).
//   Used to populate semester dropdowns in the enrollment modal and the
//   Semesters management section.
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'semesters') {
    $r = db()->query("SELECT * FROM semester ORDER BY semester_id DESC");
    respond(true, 'ok', ['data' => $r->fetch_all(MYSQLI_ASSOC)]);
}

// ═════════════════════════════════════════════════════════════════════════════
// §19  RESOURCE: registrar  [DEPRECATED]
// ─────────────────────────────────────────────────────────────────────────────
// Staff accounts (including the Registrar role) were consolidated into the
// `admins` table.  This handler exists only for backward-compatibility:
// any client still calling ?resource=registrar receives a clear JSON error
// instead of a silent query against a table that no longer exists.
//
// DO NOT extend or add actions here.  Use ?resource=admins instead.
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'registrar') {
    respond(false, 'The registrar resource is deprecated. Staff accounts (including Registrar role) are now managed via the admins resource.');
}

// ═════════════════════════════════════════════════════════════════════════════
// §20  RESOURCE: schedule
// ─────────────────────────────────────────────────────────────────────────────
// GET  (no params)
//   Returns the full class schedule joined with subjects, instructors,
//   sections, semesters, and academic year.  Ordered by day then time_start.
//   Write operations (create/update/delete) are not yet exposed through the
//   admin API; schedules are managed directly in the database for now.
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'schedule') {
    if ($method === 'GET') {
        $r = db()->query("
            SELECT sch.schedule_id, sch.day, sch.time_start, sch.time_end, sch.room,
                   sub.Subject_Code, sub.Subject_Name,
                   CONCAT(CONVERT(i.First_Name USING utf8mb4) COLLATE utf8mb4_general_ci,' ',CONVERT(i.Last_Name USING utf8mb4) COLLATE utf8mb4_general_ci) as instructor_name,
                   sec.section_name, sem.semester_name, y.academic_year
            FROM schedule sch
            JOIN subjects sub ON sub.Subject_Id = sch.subject_id
            JOIN instructors i ON i.Instructor_ID = sch.instructor_id
            JOIN section sec ON sec.section_id = sch.section_id
            JOIN semester sem ON sem.semester_id = sch.semester_id
            JOIN year y ON y.year_id = sch.year_id
            ORDER BY sch.day, sch.time_start
        ");
        respond(true, 'ok', ['data' => $r->fetch_all(MYSQLI_ASSOC)]);
    }
}

// ═════════════════════════════════════════════════════════════════════════════
// §21  RESOURCE: admins
// ─────────────────────────────────────────────────────────────────────────────
// Restricted to Super Admin role.  All other roles receive a 403-style error.
//
// GET  (no params)
//   Returns all admin accounts (password_hash excluded).
//   Ordered by admin_id ascending.
//
// POST action=create
//   Params: first_name, last_name, email, password (raw), role
//   Validates email format and role whitelist, hashes password with PASSWORD_BCRYPT.
//   Allowed roles: Super Admin | Admin | Registrar
//
// POST action=update_status
//   Params: admin_id, status (Active | Inactive)
//   Guard: an admin cannot change their own status (prevents self-lockout).
//
// POST action=update_role
//   Params: admin_id, role
//   Guard: an admin cannot change their own role (prevents accidental demotion).
//   Note: the role change takes effect on the target user's next login.
//
// POST action=reset_password
//   Params: admin_id, password (raw, min 6 chars)
//   Hashes the new password with PASSWORD_BCRYPT and updates password_hash.
// ═════════════════════════════════════════════════════════════════════════════
if ($resource === 'admins') {
    if ($_currentRole !== 'Super Admin') respond(false, 'Access denied. Super Admin only.');

    if ($method === 'GET') {
        $r = db()->query("SELECT admin_id, email, first_name, last_name, role, status, created_at FROM admins ORDER BY admin_id");
        respond(true, 'ok', ['data' => $r->fetch_all(MYSQLI_ASSOC)]);
    }

    if ($method === 'POST') {
        if ($action === 'create') {
            $first   = p('first_name');
            $last    = p('last_name');
            $email   = strtolower(p('email'));
            $role    = p('role');
            $passRaw = pRaw('password');
            $allowed = ['Super Admin', 'Admin', 'Registrar'];
            if (!$first || !$last || !$email || !$passRaw) respond(false, 'All fields are required.');
            if (!filter_var($email, FILTER_VALIDATE_EMAIL))  respond(false, 'Invalid email address.');
            if (!in_array($role, $allowed, true))            respond(false, 'Invalid role.');
            $hash = password_hash($passRaw, PASSWORD_BCRYPT);
            $stmt = db()->prepare('INSERT INTO admins (email, password_hash, first_name, last_name, role) VALUES (?,?,?,?,?)');
            $stmt->bind_param('sssss', $email, $hash, $first, $last, $role);
            $stmt->execute() ? respond(true, 'Account created.') : respond(false, db()->error);
        }

        if ($action === 'update_status') {
            $id     = pInt('admin_id');
            $status = p('status');
            if (!in_array($status, ['Active', 'Inactive'], true)) respond(false, 'Invalid status.');
            if ($id === (int)$_SESSION['admin_id']) respond(false, 'You cannot change your own status.');
            $stmt = db()->prepare('UPDATE admins SET status=? WHERE admin_id=?');
            $stmt->bind_param('si', $status, $id);
            $stmt->execute() ? respond(true, 'Status updated.') : respond(false, db()->error);
        }

        if ($action === 'update_role') {
            $id   = pInt('admin_id');
            $role = p('role');
            if (!in_array($role, ['Super Admin', 'Admin', 'Registrar'], true)) respond(false, 'Invalid role.');
            if ($id === (int)$_SESSION['admin_id']) respond(false, 'You cannot change your own role.');
            $stmt = db()->prepare('UPDATE admins SET role=? WHERE admin_id=?');
            $stmt->bind_param('si', $role, $id);
            $stmt->execute() ? respond(true, 'Role updated.') : respond(false, db()->error);
        }

        if ($action === 'reset_password') {
            $id      = pInt('admin_id');
            $passRaw = pRaw('password');
            if (strlen($passRaw) < 6) respond(false, 'Password must be at least 6 characters.');
            $hash = password_hash($passRaw, PASSWORD_BCRYPT);
            $stmt = db()->prepare('UPDATE admins SET password_hash=? WHERE admin_id=?');
            $stmt->bind_param('si', $hash, $id);
            $stmt->execute() ? respond(true, 'Password reset.') : respond(false, db()->error);
        }
    }
}

// ═════════════════════════════════════════════════════════════════════════════
// §22  FALLBACK — Unknown resource
// ─────────────────────────────────────────────────────────────────────────────
// No resource block above matched.  Return a descriptive JSON error so the
// front-end can surface a useful message rather than a silent empty response.
// ═════════════════════════════════════════════════════════════════════════════
respond(false, 'Unknown resource: ' . htmlspecialchars($resource));