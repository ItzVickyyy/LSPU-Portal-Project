<?php
/**
 * create_admin.php — ONE-TIME SETUP HELPER
 * Use this to create your first admin account.
 * ⚠ DELETE THIS FILE from your server once your admin account is created!
 */
require_once __DIR__ . '/config.php';

$msg   = '';
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email     = strtolower(trim($_POST['email']      ?? ''));
    $first     = trim($_POST['first_name'] ?? '');
    $last      = trim($_POST['last_name']  ?? '');
    $password  = $_POST['password']  ?? '';
    $confirm   = $_POST['confirm']   ?? '';

    if (!$email || !$first || !$last || !$password) {
        $error = 'All fields are required.';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = 'Invalid email address.';
    } elseif (strlen($password) < 6) {
        $error = 'Password must be at least 6 characters.';
    } elseif ($password !== $confirm) {
        $error = 'Passwords do not match.';
    } else {
        $hash = password_hash($password, PASSWORD_BCRYPT);
        $stmt = db()->prepare(
            'INSERT INTO admins (email, password_hash, first_name, last_name, status)
             VALUES (?, ?, ?, ?, "Active")
             ON DUPLICATE KEY UPDATE password_hash=VALUES(password_hash), first_name=VALUES(first_name), last_name=VALUES(last_name)'
        );
        $stmt->bind_param('ssss', $email, $hash, $first, $last);
        if ($stmt->execute()) {
            $msg = "✅ Admin account <strong>{$email}</strong> created successfully! You can now <a href='index.html'>log in</a>.<br><strong>⚠ Delete this file (create_admin.php) from your server now!</strong>";
        } else {
            $error = 'Database error: ' . db()->error;
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Create Admin — LSPU Portal Setup</title>
  <style>
    body { font-family: sans-serif; background: #f4f7fc; display: flex; align-items: center; justify-content: center; min-height: 100vh; }
    .box { background: #fff; border-radius: 12px; padding: 36px 32px; max-width: 420px; width: 100%; box-shadow: 0 4px 24px rgba(0,0,0,.12); border: 2px solid #f4b400; }
    h2 { color: #0B5ED7; margin-bottom: 6px; }
    .warn { background: #fff8e1; border: 1px solid #f4b400; border-radius: 8px; padding: 10px 14px; font-size: .85rem; color: #7a5500; margin-bottom: 20px; }
    label { display: block; font-size: .82rem; font-weight: 600; margin: 12px 0 4px; }
    input { width: 100%; padding: 9px 12px; border: 1.5px solid #d6e2f5; border-radius: 8px; font-size: .9rem; box-sizing: border-box; }
    button { margin-top: 18px; width: 100%; padding: 11px; background: #0B5ED7; color: #fff; border: none; border-radius: 8px; font-size: .95rem; font-weight: 600; cursor: pointer; }
    .msg  { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; border-radius: 8px; padding: 12px 14px; margin-bottom: 16px; font-size: .88rem; }
    .err  { background: #fdecea; color: #c0392b; border: 1px solid #f5c6c2; border-radius: 8px; padding: 12px 14px; margin-bottom: 16px; font-size: .88rem; }
  </style>
</head>
<body>
<div class="box">
  <h2>LSPU Portal — Admin Setup</h2>
  <div class="warn">⚠ <strong>One-time setup only.</strong> Delete this file after creating your admin account.</div>

  <?php if ($msg):  ?><div class="msg"><?= $msg ?></div><?php endif; ?>
  <?php if ($error):?><div class="err"><?= htmlspecialchars($error) ?></div><?php endif; ?>

  <?php if (!$msg): ?>
  <form method="POST">
    <label>First Name</label>
    <input type="text" name="first_name" required placeholder="System">
    <label>Last Name</label>
    <input type="text" name="last_name" required placeholder="Administrator">
    <label>Email Address</label>
    <input type="email" name="email" required placeholder="admin@lspu.edu.ph">
    <label>Password (min 6 characters)</label>
    <input type="password" name="password" required placeholder="••••••••">
    <label>Confirm Password</label>
    <input type="password" name="confirm" required placeholder="••••••••">
    <button type="submit">Create Admin Account</button>
  </form>
  <?php endif; ?>
</div>
</body>
</html>
