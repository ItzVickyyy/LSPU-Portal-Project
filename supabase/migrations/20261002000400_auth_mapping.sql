-- LSPU Portal Supabase Auth account mapping
-- Links Supabase Auth users to the existing application account records.
-- Roles remain authoritative in admins.role. Applicant accounts are represented by applicants.

CREATE TABLE public.portal_users (
    id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    account_type text NOT NULL CHECK (account_type IN ('admin', 'applicant')),
    admin_id integer UNIQUE REFERENCES public.admins(admin_id) ON DELETE CASCADE,
    applicant_id integer UNIQUE REFERENCES public.applicants(id) ON DELETE CASCADE,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),

    CONSTRAINT portal_users_one_account_type
        CHECK (
            (account_type = 'admin' AND admin_id IS NOT NULL AND applicant_id IS NULL)
            OR
            (account_type = 'applicant' AND applicant_id IS NOT NULL AND admin_id IS NULL)
        )
);

CREATE INDEX portal_users_admin_id_idx ON public.portal_users(admin_id);
CREATE INDEX portal_users_applicant_id_idx ON public.portal_users(applicant_id);

CREATE OR REPLACE FUNCTION public.set_portal_users_updated_at()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;

CREATE TRIGGER portal_users_set_updated_at
BEFORE UPDATE ON public.portal_users
FOR EACH ROW
EXECUTE FUNCTION public.set_portal_users_updated_at();

-- The mapping contains authorization-sensitive account relationships.
-- Browser clients must not read or write it directly.
ALTER TABLE public.portal_users ENABLE ROW LEVEL SECURITY;
