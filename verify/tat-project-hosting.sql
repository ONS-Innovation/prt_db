-- Verify prt_db:tat-project-hosting on pg

BEGIN;

SELECT *
FROM tech_audit.project_hosting
WHERE FALSE;

ROLLBACK;
