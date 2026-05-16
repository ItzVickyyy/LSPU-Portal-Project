<?php
/**
 * insert_admin.php — LSPU Portal: Insert Default Admin Account
 *
 * HOW TO USE:
 *   1. Place this file in your project root (same folder as config.php).
 *   2. Open it in your browser: http://localhost/your-project/insert_admin.php
 *   3. ⚠ DELETE THIS FILE immediately after seeing the success message.
 *
 * Admin credentials that will be inserted:
 *   Email    : admin@gmail.com
 *   Password : 87654321
 *   Name     : Civ John Nhoj
 */
require_once __DIR__ . '/config.php';

$email      = 'admin@gmail.com';   // stored lowercase; login is case-insensitive
$password   = '87654321';
$first_name = 'Civ';
$last_name  = 'John Nhoj';
$status     = 'Active';

$hash = password_hash($password, PASSWORD_BCRYPT);

// Create admins table if it doesn't exist yet
db()->query("
    CREATE TABLE IF NOT EXISTS `admins` (
      `admin_id`      INT UNSIGNED NOT NULL AUTO_INCREMENT,
      `email`         VARCHAR(191) NOT NULL,
      `password_hash` VARCHAR(255) NOT NULL,
      `first_name`    VARCHAR(80)  NOT NULL,
      `last_name`     VARCHAR(80)  NOT NULL,
      `status`        ENUM('Active','Inactive') NOT NULL DEFAULT 'Active',
      `created_at`    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (`admin_id`),
      UNIQUE KEY `uq_admin_email` (`email`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
");

// Insert or update the admin account
$stmt = db()->prepare("
    INSERT INTO admins (email, password_hash, first_name, last_name, status)
    VALUES (?, ?, ?, ?, ?)
    ON DUPLICATE KEY UPDATE
        password_hash = VALUES(password_hash),
        first_name    = VALUES(first_name),
        last_name     = VALUES(last_name),
        status        = VALUES(status)
");
$stmt->bind_param('sssss', $email, $hash, $first_name, $last_name, $status);
$ok = $stmt->execute();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Admin Setup — LSPU Portal</title>
  <style>
    *{box-sizing:border-box;margin:0;padding:0}
    body{font-family:'Segoe UI',sans-serif;background:#f4f7fc;display:flex;align-items:center;justify-content:center;min-height:100vh;}
    .card{background:#fff;border-radius:14px;padding:40px 36px;max-width:480px;width:95%;box-shadow:0 6px 32px rgba(11,94,215,.13);border-top:5px solid <?= $ok ? '#0B5ED7' : '#dc3545' ?>;}
    h2{font-size:1.4rem;margin-bottom:18px;color:<?= $ok ? '#0B5ED7' : '#dc3545' ?>;}
    table{width:100%;border-collapse:collapse;margin:18px 0;font-size:.9rem;}
    td{padding:8px 10px;border-bottom:1px solid #e8eef8;}
    td:first-child{font-weight:600;color:#6b7280;width:40%;}
    .badge{display:inline-block;padding:4px 14px;border-radius:20px;font-size:.8rem;font-weight:700;}
    .ok{background:#d4edda;color:#155724;}
    .err{background:#fdecea;color:#c0392b;}
    .warn{margin-top:22px;background:#fff8e1;border:1px solid #f4b400;border-radius:8px;padding:12px 16px;font-size:.84rem;color:#7a5500;line-height:1.6;}
    a{color:#0B5ED7;font-weight:600;text-decoration:none;}
    a:hover{text-decoration:underline;}
    .err-detail{margin-top:14px;background:#fdecea;border-radius:8px;padding:12px 16px;font-size:.84rem;color:#c0392b;}
  </style>
</head>
<body>
<div class="card">
  <?php if ($ok): ?>
    <h2>✅ Admin Account Ready</h2>
    <p style="color:#6b7280;font-size:.88rem;">The following admin account has been inserted into the <code>admins</code> table:</p>
    <table>
      <tr><td>Email</td>    <td><strong><?= htmlspecialchars($email) ?></strong></td></tr>
      <tr><td>Password</td> <td><strong><?= htmlspecialchars($password) ?></strong></td></tr>
      <tr><td>First Name</td><td><?= htmlspecialchars($first_name) ?></td></tr>
      <tr><td>Last Name</td> <td><?= htmlspecialchars($last_name) ?></td></tr>
      <tr><td>Status</td>   <td><span class="badge ok"><?= $status ?></span></td></tr>
    </table>
    <p style="font-size:.88rem;color:#374151;">You can now <a href="index.html">log in via the portal</a> using the Admin lock button 🔒.</p>
    <div class="warn">
      ⚠ <strong>Delete this file now.</strong><br>
      Remove <code>insert_admin.php</code> from your server immediately to prevent unauthorized access.
    </div>
  <?php else: ?>
    <h2>❌ Insert Failed</h2>
    <div class="err-detail"><?= htmlspecialchars(db()->error) ?></div>
    <div class="warn" style="margin-top:16px;">Make sure you have run <code>add_admins_table.sql</code> in phpMyAdmin first, or that your database connection in <code>config.php</code> is correct.</div>
  <?php endif; ?>
</div>
</body>
</html>
