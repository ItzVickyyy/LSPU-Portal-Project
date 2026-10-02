# LSPU Portal

A web-based portal for managing applicant, student, academic, enrollment, payment, and administrative records.

## Current Version

The project has been migrated from the original PHP and MySQL setup to:

- Vercel for deployment
- Supabase PostgreSQL for the database
- Supabase Auth for authentication
- Vercel serverless API functions for backend operations

The existing HTML, CSS, and JavaScript frontend is retained where practical.

## Main Features

- Applicant registration and authentication
- Student management
- Applicant management
- Enrollment
- Grades
- Payments
- Schedule
- Programs and specializations
- Subjects
- Instructors
- Campuses
- Colleges
- Sections
- Semesters
- Administrator management
- Role-based access

## User Roles

### Super Admin

The Super Admin manages administrative accounts.

Functions include:

- Create management accounts
- Enable or disable accounts
- Change management roles

### Admin

Manages portal records and administrative functions based on assigned access.

### Registrar

Handles registrar-related portal records and operations.

Applicant accounts are separate from management accounts.

## Project Structure

```text
LSPU-Portal-Project/
├── admin/                 # Admin interface
├── applicant/             # Applicant pages
├── api/                   # API and backend logic
├── assets/                # Images, fonts, and other assets
├── portal/                # Main portal interface
├── archive/               # Archived project files
├── db/                    # Database files and archives
├── docs/                  # Project documentation
├── supabase/              # Supabase migrations and seed data
├── index.html             # Landing page
├── index.css              # Landing page styles
├── index.js               # Landing page scripts
├── Dockerfile
└── README.md
```

## Documentation

Detailed documentation is available in the `docs/` folder:

- [Project Overview](docs/PROJECT-OVERVIEW.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Database](docs/DATABASE.md)
- [Authentication](docs/AUTHENTICATION.md)
- [Supabase Migration](docs/SUPABASE-MIGRATION.md)
- [Deployment](docs/DEPLOYMENT.md)
- [CRUD QA](docs/CRUD-QA.md)

## Deployment

Production:

https://lspu-portal.vercel.app/

Repository:

https://github.com/ItzVickyyy/LSPU-Portal-Project

## Development Notes

Environment variables are required for the Supabase connection and must be configured in the deployment environment.

Do not commit Supabase service-role keys, passwords, or other secrets to the repository.

## Project Status

The project is currently deployed through Vercel with Supabase as its backend infrastructure.
