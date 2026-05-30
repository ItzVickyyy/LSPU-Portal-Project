<?php

/**
 * auth.php — LSPU Portal Authentication API
 * All responses are JSON.
 * Actions: check_email | send_otp | verify_otp | register | login | logout | reset_request | reset_password
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
// Brevo Email Sender
// ---------------------------------------------------------------------------
function sendBrevoEmail(string $toEmail, string $toName, string $subject, string $htmlBody): bool
{
    $apiKey  = getenv('BREVO_API_KEY');
    $fromEmail = getenv('MAIL_FROM');
    $fromName  = 'LSPU Portal';

    $payload = json_encode([
        'sender'     => ['name' => $fromName, 'email' => $fromEmail],
        'to'         => [['email' => $toEmail, 'name' => $toName]],
        'subject'    => $subject,
        'htmlContent' => $htmlBody,
    ]);

    $ch = curl_init('https://api.brevo.com/v3/smtp/email');
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST           => true,
        CURLOPT_POSTFIELDS     => $payload,
        CURLOPT_HTTPHEADER     => [
            'accept: application/json',
            'api-key: ' . $apiKey,
            'content-type: application/json',
        ],
    ]);
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    return $httpCode === 201;
}

function otpEmailHtml(string $otp, string $purpose = 'verification'): string
{
    return "
    <div style='font-family:DM Sans,Arial,sans-serif;max-width:480px;margin:auto;padding:32px;background:#f9fafb;border-radius:12px;'>
      <div style='text-align:center;margin-bottom:24px;'>
        <img src='https://lspu.edu.ph/wp-content/uploads/2021/03/LSPU-Logo.png' alt='LSPU' style='height:60px;'>
        <h2 style='color:#1a3c6e;margin:12px 0 4px;'>LSPU Portal</h2>
        <p style='color:#6b7280;font-size:13px;margin:0;'>Laguna State Polytechnic University</p>
      </div>
      <div style='background:#fff;border-radius:10px;padding:28px;text-align:center;border:1px solid #e5e7eb;'>
        <p style='color:#374151;font-size:15px;margin:0 0 20px;'>Your <strong>$purpose</strong> code is:</p>
        <div style='font-size:36px;font-weight:700;letter-spacing:10px;color:#1a3c6e;background:#f0f4ff;padding:16px 24px;border-radius:8px;display:inline-block;'>$otp</div>
        <p style='color:#6b7280;font-size:13px;margin:20px 0 0;'>This code expires in <strong>10 minutes</strong>. Do not share it with anyone.</p>
      </div>
      <p style='color:#9ca3af;font-size:12px;text-align:center;margin-top:20px;'>
        If you did not request this, please ignore this email.<br>
        &copy; 2026 Laguna State Polytechnic University
      </p>
    </div>";
}

// ---------------------------------------------------------------------------
// Router
// ---------------------------------------------------------------------------
$action = $_POST['action'] ?? $_GET['action'] ?? '';

switch ($action) {

    // ── Check if email already registered ───────────────────────────────
    case 'check_email': {
            $email = strtolower(h($_POST['email'] ?? ''));
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) respond(false, 'Invalid email address.');
            $stmt = db()->prepare('SELECT id FROM applicants WHERE Email = ?');
            $stmt->bind_param('s', $email);
            $stmt->execute();
            $stmt->store_result();
            respond(true, 'ok', ['exists' => $stmt->num_rows > 0]);
        }

    // ── Generate & send OTP via Brevo ────────────────────────────────────
    case 'send_otp': {
            $email = strtolower(h($_POST['email'] ?? ''));
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) respond(false, 'Invalid email address.');

            $otp = str_pad((string)random_int(0, 999999), 6, '0', STR_PAD_LEFT);
            storeOtp('otp_register_' . $email, $otp);

            $sent = sendBrevoEmail(
                $email,
                $email,
                'LSPU Portal — Email Verification Code',
                otpEmailHtml($otp, 'email verification')
            );

            if (!$sent) respond(false, 'Failed to send verification email. Please try again.');
            respond(true, 'Verification code sent to your email.');
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

            $chk = db()->prepare('SELECT admin_id FROM admins WHERE email = ?');
            $chk->bind_param('s', $email);
            $chk->execute();
            $chk->store_result();
            if ($chk->num_rows > 0) respond(false, 'This email address is not available.');

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

            // Send welcome email
            sendBrevoEmail(
                $email,
                "$first $last",
                'Welcome to LSPU Portal!',
                "<div style='font-family:Arial,sans-serif;max-width:480px;margin:auto;padding:32px;'>
                  <h2 style='color:#1a3c6e;'>Welcome, $first!</h2>
                  <p>Your LSPU applicant account has been created successfully.</p>
                  <p><strong>Email:</strong> $email</p>
                  <p>You may now log in to the portal and complete your application profile.</p>
                  <p style='color:#6b7280;font-size:12px;margin-top:24px;'>&copy; 2026 Laguna State Polytechnic University</p>
                </div>"
            );

            session_regenerate_id(true);
            $_SESSION['applicant_id'] = $applicant_id;
            $_SESSION['email']        = $email;
            $_SESSION['name']         = "$first $last";
            $_SESSION['role']         = 'User';

            respond(true, 'Account created successfully!', [
                'applicant_id' => $applicant_id,
                'role'         => 'User',
                'redirect'     => '../applicant/applicant_profile.php',
            ]);
        }

    // ── Unified Login ────────────────────────────────────────────────────
    case 'login': {
            $email    = strtolower(h($_POST['email']    ?? ''));
            $password = $_POST['password'] ?? '';

            if (!$email || !$password) respond(false, 'Please fill in all fields.');

            $stmt = db()->prepare(
                'SELECT admin_id, password_hash, first_name, last_name, role
                 FROM admins WHERE email = ? AND status = "Active"'
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
                    'role'     => $role,
                    'name'     => "$first $last",
                    'redirect' => '../admin/admin.html',
                ]);
            }
            $stmt->close();

            $stmt2 = db()->prepare(
                'SELECT id, password_hash, First_Name, Last_Name
                 FROM applicants WHERE Email = ?'
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
                    'redirect' => '../applicant/applicant_profile.php',
                ]);
            }

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

            $found = false;
            $name  = $email;

            $stmt = db()->prepare('SELECT First_Name, Last_Name FROM applicants WHERE Email = ?');
            $stmt->bind_param('s', $email);
            $stmt->execute();
            $row = $stmt->get_result()->fetch_assoc();
            if ($row) {
                $found = true;
                $name  = $row['First_Name'] . ' ' . $row['Last_Name'];
            }

            if (!$found) {
                $stmt2 = db()->prepare('SELECT first_name, last_name FROM admins WHERE email = ?');
                $stmt2->bind_param('s', $email);
                $stmt2->execute();
                $row2 = $stmt2->get_result()->fetch_assoc();
                if ($row2) {
                    $found = true;
                    $name  = $row2['first_name'] . ' ' . $row2['last_name'];
                }
            }

            if (!$found) respond(false, 'No account found with that email.');

            $otp = str_pad((string)random_int(0, 999999), 6, '0', STR_PAD_LEFT);
            storeOtp('otp_reset_' . $email, $otp);

            $sent = sendBrevoEmail(
                $email,
                $name,
                'LSPU Portal — Password Reset Code',
                otpEmailHtml($otp, 'password reset')
            );

            if (!$sent) respond(false, 'Failed to send reset email. Please try again.');
            respond(true, 'Reset code sent to your email.');
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

            $hash    = password_hash($newpass, PASSWORD_BCRYPT);
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