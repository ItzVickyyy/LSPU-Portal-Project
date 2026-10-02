# Supabase Migration

## Original system

The original portal used PHP, MySQL, PHP sessions, PHP API endpoints, and a Flask status-checker component.

## Target system

The migrated system uses:

- Existing HTML, CSS, and JavaScript frontend
- Vercel serverless API functions
- Supabase PostgreSQL
- Supabase Auth
- PostgreSQL Row Level Security
- Supabase Storage where file storage is required

## Migration approach

### Schema migration

The MySQL schema was converted to PostgreSQL while preserving the application data model.

### Data migration

Existing records were converted and imported in dependency order so foreign-key relationships could be satisfied.

### Authentication migration

Supabase Auth was introduced through portal_users and portal_otps.

### API migration

PHP database operations were replaced with Supabase queries inside Vercel API functions.

### Relationship fixes

API queries were updated where PostgreSQL and Supabase relationship results differed from the original implementation.

### Academic-year normalization

The semester table was linked to the year table through year_id.

### Identity sequence synchronization

After importing explicit IDs, all PostgreSQL identity sequences were synchronized with the imported data.

## Migration files

- 20261002000100_schema.sql
- 20261002000200_functions_triggers.sql
- 20261002000300_constraints_indexes.sql
- 20261002000400_auth_mapping.sql
- 20261002000500_auth_otps.sql
- 20261002000600_semester_year.sql

## Security

Supabase server credentials are server-only and must never be committed to the repository.
