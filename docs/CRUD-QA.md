# CRUD and QA

## Verification method

For each CRUD resource:

1. List or read existing records.
2. Create a temporary record.
3. Confirm the record appears.
4. Edit the record.
5. Confirm the changes persist.
6. Delete the temporary record.
7. Confirm the record is removed.

Use the application's warning and confirmation flow for destructive actions where provided.

## Confirmed migration work

### Authentication

Applicant registration was migrated to Supabase Auth.

Applicant login works with the migrated authentication flow.

OTP registration and password-reset reuse prevention were implemented.

### Students

Student relationship queries were corrected for the migrated Supabase relationships.

### Applicants

Applicant creation and editing were corrected during migration.

### Enrollment

Enrollment creation was corrected so the related enrollment record is created with the student workflow.

### Grades

Grade updates were corrected so generated database columns are not written directly.

### Specializations

Specialization display and related program queries were corrected.

### Semester

Semester CRUD has been verified for:

- List
- Create
- Edit
- Status update
- Delete
- Academic-year creation and linking
- Academic-year relationship

Supported semester names:

- 1st Semester
- 2nd Semester
- Inter Semester

## Identity sequence issue

Imported numeric IDs initially caused duplicate-key failures because PostgreSQL identity sequences were not advanced to the imported maximum values.

Known examples were applicants and semesters.

The identity sequence audit covered all 25 identity columns.

The sequences were then synchronized. Empty tables were initialized so their next generated ID is 1.

## Remaining QA

Remaining CRUD resources should be tested individually after sequence synchronization.

For each failure:

- Record the exact UI action.
- Record the API response or database error.
- Identify whether the issue is frontend, API, relationship, constraint, or database configuration.
- Fix only the verified defect.
- Repeat the same test.

Do not mark an operation as verified without an actual successful test.
