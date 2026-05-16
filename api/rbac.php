<?php
/**
 * rbac.php — LSPU Portal Role-Based Access Control
 * Include this at the top of every protected PHP file.
 *
 * USAGE:
 *   require_once __DIR__ . '/rbac.php';
 *   requireRole(['Super Admin', 'Admin']);        // staff pages
 *   requireRole(['Super Admin']);                  // super admin only
 *   requireApplicant();                            // applicant pages
 *
 * ROLES:
 *   Super Admin — full access
 *   Admin       — no user management
 *   Registrar   — applicant data + status only
 *   User        — applicant profile only
 */
require_once __DIR__ . '/config.php';

// ---------------------------------------------------------------------------
// Core role checker — staff (admins table)
// ---------------------------------------------------------------------------
/**
 * Require the current session to have one of the given roles.
 * If not authenticated or role not allowed → respond with 401 JSON and exit.
 *
 * @param string[] $allowed  e.g. ['Super Admin', 'Admin', 'Registrar']
 */
function requireRole(array $allowed): void
{
    if (empty($_SESSION['role']) || empty($_SESSION['admin_id'])) {
        _denyAccess('Not authenticated. Please log in.');
    }

    if (!in_array($_SESSION['role'], $allowed, true)) {
        _denyAccess('Access denied. You do not have permission to perform this action.');
    }
}

// ---------------------------------------------------------------------------
// Applicant checker — User (applicants table)
// ---------------------------------------------------------------------------
/**
 * Require the current session to be a logged-in applicant (User role).
 * If not → respond with 401 JSON and exit.
 */
function requireApplicant(): void
{
    if (empty($_SESSION['role']) || $_SESSION['role'] !== 'User' || empty($_SESSION['applicant_id'])) {
        _denyAccess('Not authenticated. Please log in.');
    }
}

// ---------------------------------------------------------------------------
// Convenience wrappers — use these in your files for clarity
// ---------------------------------------------------------------------------

/** Any staff member (Super Admin, Admin, or Registrar) */
function requireStaff(): void
{
    requireRole(['Super Admin', 'Admin', 'Registrar']);
}

/** Super Admin and Admin only (excludes Registrar) */
function requireAdmin(): void
{
    requireRole(['Super Admin', 'Admin']);
}

/** Super Admin only */
function requireSuperAdmin(): void
{
    requireRole(['Super Admin']);
}

// ---------------------------------------------------------------------------
// Session info helpers — use in PHP pages to get current user details
// ---------------------------------------------------------------------------

/** Returns the current user's role string, or null if not logged in */
function currentRole(): ?string
{
    return $_SESSION['role'] ?? null;
}

/** Returns true if the current user has the given role */
function hasRole(string $role): bool
{
    return ($_SESSION['role'] ?? '') === $role;
}

/** Returns true if the current user has ANY of the given roles */
function hasAnyRole(array $roles): bool
{
    return in_array($_SESSION['role'] ?? '', $roles, true);
}

/** Returns the current user's display name */
function currentName(): string
{
    return $_SESSION['admin_name'] ?? $_SESSION['name'] ?? 'Unknown';
}

/** Returns the current user's ID (admin_id or applicant_id) */
function currentId(): ?int
{
    return $_SESSION['admin_id'] ?? $_SESSION['applicant_id'] ?? null;
}

// ---------------------------------------------------------------------------
// Internal — deny and exit
// ---------------------------------------------------------------------------
function _denyAccess(string $msg): void
{
    // If the request expects JSON (API calls), return JSON
    $wantsJson = (
        (isset($_SERVER['HTTP_ACCEPT']) && str_contains($_SERVER['HTTP_ACCEPT'], 'application/json'))
        || (isset($_SERVER['CONTENT_TYPE']) && str_contains($_SERVER['CONTENT_TYPE'], 'application/json'))
        || !empty($_SERVER['HTTP_X_REQUESTED_WITH'])
    );

    http_response_code(401);

    if ($wantsJson) {
        header('Content-Type: application/json');
        echo json_encode(['ok' => false, 'msg' => $msg]);
    } else {
        // Browser request — redirect to login
        header('Location: ../index.html?error=' . urlencode($msg));
    }

    exit;
}