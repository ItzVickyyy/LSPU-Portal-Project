from pathlib import Path
import re

SOURCE = Path("supabase/seed/20261002_data.sql")
OUTPUT = Path("supabase/seed/20261002_data-ordered.sql")

IMPORT_ORDER = [
    "admins",
    "campus",
    "colleges",
    "semester",
    "year",
    "programs",
    "subjects",
    "section",
    "specializations",
    "special_programs",
    "instructors",
    "applicants",
    "admission_info",
    "applicant_status_log",
    "educational_background",
    "family_info",
    "intended_course",
    "students",
]


def quote_insert_columns(statement):
    """
    Quote the column names in:
    INSERT INTO table (col1, col2, ...) VALUES
    while leaving the VALUES data untouched.
    """

    pattern = re.compile(
        r"^(INSERT INTO\s+\w+\s*)\((.*?)\)(\s*VALUES\b)",
        re.IGNORECASE | re.DOTALL,
    )

    match = pattern.search(statement)

    if not match:
        raise ValueError(
            "Could not parse INSERT statement:\n"
            + statement[:500]
        )

    prefix = match.group(1)
    columns = match.group(2)
    values_keyword = match.group(3)

    column_names = [
        column.strip()
        for column in columns.split(",")
    ]

    quoted_columns = [
        '"' + column.replace('"', '""') + '"'
        for column in column_names
    ]

    return (
        prefix
        + "("
        + ", ".join(quoted_columns)
        + ")"
        + values_keyword
        + statement[match.end():]
    )


sql = SOURCE.read_text(encoding="utf-8")

blocks = {}

for table in IMPORT_ORDER:
    pattern = re.compile(
        rf"INSERT INTO\s+{re.escape(table)}\s+.*?;\s*",
        re.IGNORECASE | re.DOTALL,
    )

    matches = pattern.findall(sql)

    if matches:
        blocks[table] = matches


output = [
    "-- LSPU Portal PostgreSQL data migration",
    "-- Ordered according to foreign-key dependencies.",
    "-- Existing IDs are preserved.",
    "-- Column identifiers are quoted to preserve legacy mixed-case names.",
    "",
    "BEGIN;",
    "",
]


for table in IMPORT_ORDER:
    matches = blocks.get(table, [])

    if not matches:
        continue

    output.append(f"-- {table}")
    output.append("")

    for statement in matches:
        converted = quote_insert_columns(statement)
        output.append(converted.strip())
        output.append("")


output.append("COMMIT;")
output.append("")

OUTPUT.write_text("\n".join(output), encoding="utf-8")

print(f"Generated: {OUTPUT}")
print("")
print("Import order:")

for number, table in enumerate(IMPORT_ORDER, 1):
    count = len(blocks.get(table, []))
    print(f"{number:2}. {table:<25} {count} INSERT statement(s)")