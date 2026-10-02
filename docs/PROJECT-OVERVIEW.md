# Project Overview

## Purpose

The LSPU Portal is a web-based portal for managing applicant, student, academic, enrollment, payment, and administrative records.

The original system used PHP and MySQL. The migration keeps the existing frontend structure while moving backend infrastructure to Vercel and Supabase.

## Migration goals

- Preserve the existing HTML, CSS, and JavaScript frontend where practical.
- Replace MySQL with Supabase PostgreSQL.
- Replace PHP session authentication with Supabase Auth.
- Move PHP API operations to Vercel serverless API functions.
- Use PostgreSQL relationships and constraints for data integrity.
- Use Row Level Security for protected Supabase data.
- Remove the Flask status-checker dependency.
- Deploy through Vercel.

## Roles

Administrative roles:

- Super Admin
- Admin
- Registrar

Applicant accounts are separate from administrative accounts.

## Main functional areas

- Dashboard
- Applicants
- Students
- Enrollment
- Grades
- Payments
- Schedule
- Programs
- Specializations
- Subjects
- Instructors
- Campuses
- Colleges
- Sections
- Semesters
- Administrators
- Applicant registration and authentication

## Deployment

Production application:

https://lspu-portal.vercel.app/

Repository:

https://github.com/ItzVickyyy/LSPU-Portal-Project
