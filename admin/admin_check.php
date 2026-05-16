<?php

/**
 * Check if an admin user is authenticated.
 *
 * Returns:
 * - HTTP 200 with admin session data if authenticated
 * - HTTP 401 if not authenticated
*/

require_once __DIR__ . '/../api/config.php';

// Return JSON response
header('Content-Type: application/json');

/** If admin session exists, return admin information. */
if (!empty($_SESSION['admin_id'])) {

    echo json_encode([
        'ok'         => true,
        'admin_id'   => $_SESSION['admin_id'],
        'admin_name' => $_SESSION['admin_name'] ?? 'Admin',
        'email'      => $_SESSION['admin_email'] ?? '',
        'role'       => $_SESSION['role'] ?? 'Admin',
    ]);

} else {

    // User is not authenticated
    http_response_code(401);

    echo json_encode([
        'ok'  => false,
        'msg' => 'Not authenticated.'
    ]);
}