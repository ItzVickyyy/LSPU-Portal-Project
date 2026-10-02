-- LSPU Portal PostgreSQL timestamp triggers
-- Replaces MySQL ON UPDATE CURRENT_TIMESTAMP() behavior.

CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "admission_info_set_updated_at"
BEFORE UPDATE ON "admission_info"
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER "applicants_set_updated_at"
BEFORE UPDATE ON "applicants"
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER "educational_background_set_updated_at"
BEFORE UPDATE ON "educational_background"
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER "family_info_set_updated_at"
BEFORE UPDATE ON "family_info"
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER "intended_course_set_updated_at"
BEFORE UPDATE ON "intended_course"
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();
