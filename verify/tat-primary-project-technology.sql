-- Verify prt_db:tat-primary-project-technology on pg

BEGIN;

SELECT is_primary
FROM tat.project_technology
WHERE FALSE;

ROLLBACK;
