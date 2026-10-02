# Database Documentation

## Platform

The project uses Supabase PostgreSQL.

The migrated schema preserves the existing portal data model while adapting it to PostgreSQL.

## Main entities

- Admins
- Applicants
- Applicant status history
- Admission information
- Campuses
- Colleges
- Educational background
- Family information
- Intended courses
- Programs
- Specializations
- Students
- Sections
- Semesters
- Academic years
- Subjects
- Instructors
- Enrollment
- Enrolled subjects
- Grades
- Payments
- Receipts
- Schedules
- Portal authentication OTPs
- Portal user mappings

## Relationships

An applicant can have related admission information, intended course, family information, educational background, status history, and portal account mapping.

A student is linked to an applicant and can be associated with a program, campus, section, semester, and enrollment records.

Enrollment connects a student with a section, semester, and academic year.

## Semesters and academic years

The semester table is linked to the year table through year_id.

Supported semester names:

- 1st Semester
- 2nd Semester
- Inter Semester

When a semester is created or edited, the API resolves the supplied academic-year label to an existing year record or creates it when necessary.

## Identity sequences

Imported MySQL data contains explicit numeric IDs. PostgreSQL identity sequences therefore had to be synchronized after import.

The project has 25 identity columns.

The synchronization aligns populated-table sequences with the current maximum ID. Empty-table sequences are initialized so their next generated ID is 1.

This prevents duplicate primary-key errors during later Create operations.

## Grades

The grades table contains generated grade values. API updates modify the component grade fields and remarks rather than attempting to write generated columns directly.

## Migrations

Migration files are stored under supabase/migrations/.

Current migration sequence:

1. 20261002000100_schema.sql
2. 20261002000200_functions_triggers.sql
3. 20261002000300_constraints_indexes.sql
4. 20261002000400_auth_mapping.sql
5. 20261002000500_auth_otps.sql
6. 20261002000600_semester_year.sql

## Data import

The original MySQL data was converted to PostgreSQL-compatible SQL and imported in dependency order.

Migration utilities include tools/mysql-to-postgres-data.py and tools/reorder-postgres-data.py.
