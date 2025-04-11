-- Verify prt_db:tat-project-technology on pg

BEGIN;

SELECT *
FROM tech_audit.project_technology
WHERE FALSE;

ROLLBACK;
