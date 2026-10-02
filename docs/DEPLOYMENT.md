# Deployment

## Hosting

The application is deployed on Vercel.

Production URL:

https://lspu-portal.vercel.app/

Repository:

https://github.com/ItzVickyyy/LSPU-Portal-Project

## Environment variables

The deployment uses:

- SUPABASE_URL
- SUPABASE_PUBLISHABLE_KEY
- SUPABASE_SERVICE_ROLE_KEY

SUPABASE_ANON_KEY is supported as a fallback for the public client.

## Secret handling

Never put Supabase server credentials, passwords, OTP codes, or other server secrets in frontend source code.

## Supabase CLI

The project uses the Supabase CLI for migration management.

Typical commands are:

npx supabase link --project-ref <project-ref>

npx supabase db push

npx supabase migration list

## Deployment flow

1. Commit source changes.
2. Push changes to the repository.
3. Vercel builds and deploys the configured branch.
4. Apply required Supabase migrations.
5. Verify the deployed feature.

## Database changes

Database structure changes should be represented by migration files under supabase/migrations/.

Do not rely only on manual dashboard changes for schema changes that need to be reproducible.

## Rollback

Application rollback should use Git and Vercel deployment history.

Database rollback should use a deliberate migration or restoration procedure.
