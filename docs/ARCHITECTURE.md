# Architecture

## System flow

Browser -> Vercel-hosted frontend -> Vercel serverless API -> Supabase Auth and PostgreSQL

The frontend remains based on the existing HTML, CSS, and JavaScript structure. A React or Next.js rewrite is not required.

## Frontend

The existing frontend is retained where practical.

Responsibilities:

- Render pages and forms
- Collect user input
- Call API endpoints
- Display API responses
- Manage normal browser-side UI state

Sensitive database credentials must never be placed in frontend JavaScript.

## API

Serverless API functions are under api/.

The API layer authenticates sessions, checks roles, reads and writes Supabase data, handles database relationships, and returns data in the format expected by the existing frontend.

api/admin.js contains the main administrative resource routing.

## Supabase clients

api/_lib/supabase.js provides an admin client for server-side operations and a public client for browser-safe Supabase operations.

The admin client uses the server-only Supabase service credential. The public client uses the publishable key, with the anonymous key supported as a fallback.

## Authorization

Protected API requests authenticate the session and then check the account role.

PostgreSQL Row Level Security is also used for protected tables.

## Configuration

vercel.json enables clean URLs and disables trailing slashes.

package.json depends on @supabase/supabase-js and bcryptjs.
