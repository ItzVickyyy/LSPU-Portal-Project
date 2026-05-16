<?php

/**
 * auth.php — LSPU Portal Authentication API
 * All responses are JSON.
 * Actions: check_email | send_otp | verify_otp | register | login | logout | reset_request | reset_password
 *
 * LOGIN FLOW (unified, role-based):
 *   1. Check `admins` table first (Super Admin, Admin, Registrar)
 *   2. If not found, check `applicants` table (User)
 *   3. Return role + redirect target in response
 */
require_once __DIR__ . '/config.php';

header('Content-Type: application/json');

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------
function respond(bool $ok, string $msg, array $extra = []): void
{
    echo json_encode(array_merge(['ok' => $ok, 'msg' => $msg], $extra));
    exit;
}

function h(string $s): string
{
    return htmlspecialchars(trim($s), ENT_QUOTES);
}

function storeOtp(string $key, string $otp): void
{
    $_SESSION[$key] = ['otp' => $otp, 'expires' => time() + 600]; // 10 min
}
function verifyOtp(string $key, string $entered): bool
{
    if (!isset($_SESSION[$key])) return false;
    $data = $_SESSION[$key];
    if (time() > $data['expires']) {
        unset($_SESSION[$key]);
        return false;
    }
    return $data['otp'] === $entered;
}
function clearOtp(string $key): void
{
    unset($_SESSION[$key]);
}

// ---------------------------------------------------------------------------
// Router
// ---------------------------------------------------------------------------
$action = $_POST['action'] ?? $_GET['action'] ?? '';

switch ($action) {

    // ── Check if email already registered (applicants only) ──────────────
    case 'check_email': {
            $email = strtolower(h($_POST['email'] ?? ''));
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) respond(false, 'Invalid email address.');
            $stmt = db()->prepare('SELECT id FROM applicants WHERE Email = ?');
            $stmt->bind_param('s', $email);
            $stmt->execute();
            $stmt->store_result();
            respond(true, 'ok', ['exists' => $stmt->num_rows > 0]);
        }

    // ── Generate & return OTP ────────────────────────────────────────────
    case 'send_otp': {
            $email = strtolower(h($_POST['email'] ?? ''));
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) respond(false, 'Invalid email address.');

            $otp = str_pad((string)random_int(0, 999999), 6, '0', STR_PAD_LEFT);
            storeOtp('otp_register_' . $email, $otp);

            // Dev: returned in response. Prod: send via PHPMailer/SMTP.
            respond(true, 'OTP generated.', ['dev_otp' => $otp]);
        }

    // ── Verify OTP ───────────────────────────────────────────────────────
    case 'verify_otp': {
            $email = strtolower(h($_POST['email'] ?? ''));
            $otp   = h($_POST['otp'] ?? '');
            if (verifyOtp('otp_register_' . $email, $otp)) {
                $_SESSION['otp_verified_email'] = $email;
                respond(true, 'Email verified.');
            }
            respond(false, 'Invalid or expired code. Please request a new one.');
        }

    // ── Register new applicant ───────────────────────────────────────────
    case 'register': {
            $email    = strtolower(h($_POST['email']       ?? ''));
            $first    = h($_POST['first_name']  ?? '');
            $middle   = h($_POST['middle_name'] ?? '') ?: null;
            $last     = h($_POST['last_name']   ?? '');
            $suffix   = h($_POST['suffix']      ?? '') ?: null;
            $password = $_POST['password'] ?? '';
            $confirm  = $_POST['confirm']  ?? '';

            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) respond(false, 'Invalid email.');
            if (($_SESSION['otp_verified_email'] ?? '') !== $email) respond(false, 'Email not verified. Please verify your email first.');
            if (!$first || !$last)  respond(false, 'First and last name are required.');
            if (strlen($password) < 6) respond(false, 'Password must be at least 6 characters.');
            if ($password !== $confirm)  respond(false, 'Passwords do not match.');

            // Block registration if email belongs to an admin/registrar account
            $chk = db()->prepare('SELECT admin_id FROM admins WHERE email = ?');
            $chk->bind_param('s', $email);
            $chk->execute();
            $chk->store_result();
            if ($chk->num_rows > 0) respond(false, 'This email address is not available.');

            // Check duplicate applicant
            $stmt = db()->prepare('SELECT id FROM applicants WHERE Email = ?');
            $stmt->bind_param('s', $email);
            $stmt->execute();
            $stmt->store_result();
            if ($stmt->num_rows > 0) respond(false, 'An account with this email already exists.');

            $hash = password_hash($password, PASSWORD_BCRYPT);
            $ins  = db()->prepare('INSERT INTO applicants (Email, password_hash, First_Name, Middle_Name, Last_Name, Suffix) VALUES (?,?,?,?,?,?)');
            $ins->bind_param('ssssss', $email, $hash, $first, $middle, $last, $suffix);
            if (!$ins->execute()) respond(false, 'Registration failed. Please try again.');

            $applicant_id = db()->insert_id;
            clearOtp('otp_register_' . $email);
            unset($_SESSION['otp_verified_email']);

            // Auto-login as User
            session_regenerate_id(true);
            $_SESSION['applicant_id'] = $applicant_id;
            $_SESSION['email']        = $email;
            $_SESSION['name']         = "$first $last";
            $_SESSION['role']         = 'User';

            respond(true, 'Account created successfully!', [
                'applicant_id' => $applicant_id,
                'role'         => 'User',
                'redirect' => 'applicant/applicant_profile.php',
            ]);
        }

    // ── Unified Login (all roles) ────────────────────────────────────────
    case 'login': {
            $email    = strtolower(h($_POST['email']    ?? ''));
            $password = $_POST['password'] ?? '';

            if (!$email || !$password) respond(false, 'Please fill in all fields.');

            // --- Check admins table first (Super Admin, Admin, Registrar) ---
            $stmt = db()->prepare(
                'SELECT admin_id, password_hash, first_name, last_name, role
                 FROM admins
                 WHERE email = ? AND status = "Active"'
            );
            $stmt->bind_param('s', $email);
            $stmt->execute();
            $stmt->bind_result($admin_id, $hash, $first, $last, $role);

            if ($stmt->fetch()) {
                if (!password_verify($password, $hash)) respond(false, 'Invalid email or password.');

                session_regenerate_id(true);
                $_SESSION['admin_id']    = $admin_id;
                $_SESSION['admin_email'] = $email;
                $_SESSION['admin_name']  = "$first $last";
                $_SESSION['role']        = $role;

                respond(true, 'Login successful.', [
                    'role'       => $role,
                    'name'       => "$first $last",
                    'redirect' => 'admin/admin.html',
                ]);
            }

            $stmt->close();

            // --- Check applicants table (User) ---
            $stmt2 = db()->prepare(
                'SELECT id, password_hash, First_Name, Last_Name
                 FROM applicants
                 WHERE Email = ?'
            );
            $stmt2->bind_param('s', $email);
            $stmt2->execute();
            $row2 = $stmt2->get_result()->fetch_assoc();

            if ($row2) {
                if (!password_verify($password, $row2['password_hash'])) respond(false, 'Invalid email or password.');

                $applicant_id = $row2['id'];
                $first2       = $row2['First_Name'];
                $last2        = $row2['Last_Name'];

                session_regenerate_id(true);
                $_SESSION['applicant_id'] = $applicant_id;
                $_SESSION['email']        = $email;
                $_SESSION['name']         = "$first2 $last2";
                $_SESSION['role']         = 'User';

                respond(true, 'Login successful.', [
                    'role'     => 'User',
                    'name'     => "$first2 $last2",
                    'redirect' => 'applicant/applicant_profile.php',
                ]);
            }

            // Not found in either table
            respond(false, 'Invalid email or password.');
        }

    // ── Logout ───────────────────────────────────────────────────────────
    case 'logout': {
            session_destroy();
            respond(true, 'Logged out.');
        }

    // ── Password reset — step 1: send OTP ────────────────────────────────
    case 'reset_request': {
            $email = strtolower(h($_POST['email'] ?? ''));
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) respond(false, 'Invalid email address.');

            // Check applicants first, then admins
            $found = false;

            $stmt = db()->prepare('SELECT id FROM applicants WHERE Email = ?');
            $stmt->bind_param('s', $email);
            $stmt->execute();
            $stmt->store_result();
            if ($stmt->num_rows > 0) $found = true;

            if (!$found) {
                $stmt2 = db()->prepare('SELECT admin_id FROM admins WHERE email = ?');
                $stmt2->bind_param('s', $email);
                $stmt2->execute();
                $stmt2->store_result();
                if ($stmt2->num_rows > 0) $found = true;
            }

            if (!$found) respond(false, 'No account found with that email.');

            $otp = str_pad((string)random_int(0, 999999), 6, '0', STR_PAD_LEFT);
            storeOtp('otp_reset_' . $email, $otp);

            // Dev: return OTP. Prod: email it.
            respond(true, 'Reset code generated.', ['dev_otp' => $otp]);
        }

    // ── Password reset — step 2: verify OTP & set new password ───────────
    case 'reset_password': {
            $email   = strtolower(h($_POST['email']   ?? ''));
            $otp     = h($_POST['otp']      ?? '');
            $newpass = $_POST['password']   ?? '';
            $confirm = $_POST['confirm']    ?? '';

            if (!verifyOtp('otp_reset_' . $email, $otp)) respond(false, 'Invalid or expired code.');
            if (strlen($newpass) < 6)  respond(false, 'Password must be at least 6 characters.');
            if ($newpass !== $confirm)  respond(false, 'Passwords do not match.');

            $hash = password_hash($newpass, PASSWORD_BCRYPT);

            // Update whichever table the email belongs to
            $updated = false;

            $stmt = db()->prepare('UPDATE applicants SET password_hash = ? WHERE Email = ?');
            $stmt->bind_param('ss', $hash, $email);
            $stmt->execute();
            if ($stmt->affected_rows > 0) $updated = true;

            if (!$updated) {
                $stmt2 = db()->prepare('UPDATE admins SET password_hash = ? WHERE email = ?');
                $stmt2->bind_param('ss', $hash, $email);
                $stmt2->execute();
                if ($stmt2->affected_rows > 0) $updated = true;
            }

            if (!$updated) respond(false, 'No account found with that email.');

            clearOtp('otp_reset_' . $email);
            respond(true, 'Password reset successfully!');
        }

    default:
        respond(false, 'Unknown action.');
}