# Authentication and Authorization

## Authentication

The migrated project uses Supabase Auth.

The old PHP session-based authentication system was replaced with authenticated Supabase users and server-side session validation.

## Account mapping

Authenticated users are mapped to application records through public.portal_users.

An account is one of:

- admin
- applicant

The mapping connects the Supabase Auth UUID to the corresponding application record.

## Administrative roles

Administrative roles remain stored in public.admins.role.

Supported roles:

- Super Admin
- Admin
- Registrar

The API checks the authenticated user's role before allowing protected administrative operations.

## Applicant registration

The registration flow uses:

1. Email validation
2. OTP verification
3. Supabase Auth account creation
4. Applicant record creation
5. Portal account mapping

OTP records are stored in public.portal_otps.

OTP purposes are register and reset.

OTP records contain a hashed code and an expiration time.

## Password reset

Password reset uses the same OTP infrastructure with the reset purpose.

Successful OTP use is prevented from being reused.

## Security rules

- Never expose server-only Supabase credentials to the browser.
- Keep authentication and authorization checks on the server for protected API operations.
- Do not store plaintext passwords.
- Use Supabase Auth for authentication credentials.
- Keep authorization-sensitive mapping data protected by Row Level Security.
