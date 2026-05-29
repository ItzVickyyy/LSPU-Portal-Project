<?php
// ── LSPU Portal — Database Configuration ──
// Edit these values to match your XAMPP setup.
define('DB_HOST', 'localhost');
define('DB_USER', 'root');       // XAMPP default
define('DB_PASS', '');           // XAMPP default (blank)
define('DB_NAME', 'lspu_portal');
s
function db(): mysqli
{
    static $conn = null;
    if ($conn === null) {
        $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
        if ($conn->connect_error) {
            http_response_code(500);
            die(json_encode(['ok' => false, 'msg' => 'Database connection failed: ' . $conn->connect_error]));
        }
        $conn->set_charset('utf8mb4');
    }
    return $conn;
}

// Start session if not already started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}