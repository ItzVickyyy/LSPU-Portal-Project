from pathlib import Path
import re

SOURCE = Path("db/lspu_portal_v2.68.sql")
OUTPUT = Path("supabase/seed/20261002_data.sql")

TABLES = [
    "admins",
    "admission_info",
    "applicants",
    "applicant_status_log",
    "campus",
    "colleges",
    "educational_background",
    "enrolled_subjects",
    "enrollment",
    "family_info",
    "grades",
    "instructors",
    "intended_course",
    "payment",
    "programs",
    "receipt",
    "schedule",
    "section",
    "semester",
    "specializations",
    "special_programs",
    "students",
    "subjects",
    "year",
]

if not SOURCE.exists():
    raise FileNotFoundError(f"Source file not found: {SOURCE}")

sql = SOURCE.read_text(encoding="utf-8")

OUTPUT.parent.mkdir(parents=True, exist_ok=True)

output = []
output.append("-- LSPU Portal data migration")
output.append("-- Generated from db/lspu_portal_v2.68.sql")
output.append("-- Existing IDs are preserved.")
output.append("")
output.append("BEGIN;")
output.append("")

total_statements = 0
tables_with_data = []

for table in TABLES:
    pattern = re.compile(
        rf"INSERT INTO\s+`{re.escape(table)}`\s+.*?;\s*",
        re.IGNORECASE | re.DOTALL,
    )

    matches = pattern.findall(sql)

    if not matches:
        continue

    tables_with_data.append(table)

    output.append(f"-- Data: {table}")
    output.append("")

    for statement in matches:
        converted = statement.replace("`", "")
        output.append(converted.strip())
        output.append("")

        total_statements += 1

output.append("COMMIT;")
output.append("")

OUTPUT.write_text("\n".join(output), encoding="utf-8")

print(f"Generated: {OUTPUT}")
print(f"INSERT statements: {total_statements}")
print("")
print("Tables with data:")
for table in tables_with_data:
    print(f"  - {table}")