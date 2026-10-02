-- Link semesters to the normalized academic-year table.
ALTER TABLE "semester"
  ADD COLUMN "year_id" integer;

ALTER TABLE "semester"
  ADD CONSTRAINT "fk_semester_year"
  FOREIGN KEY ("year_id") REFERENCES "year" ("year_id")
  ON DELETE NO ACTION ON UPDATE CASCADE;

CREATE INDEX "idx_semester_year" ON "semester" ("year_id");

-- Backfill existing semesters when the semester start year matches
-- the first year in an academic-year label such as 2025-2026.
UPDATE "semester" s
SET "year_id" = y."year_id"
FROM "year" y
WHERE s."year_id" IS NULL
  AND s."start_date" >= make_date(
    split_part(y."academic_year", '-', 1)::integer, 1, 1
  )
  AND s."start_date" < make_date(
    split_part(y."academic_year", '-', 1)::integer + 1, 1, 1
  );
