-- Verify prt_db:tat-project-technology on pg

BEGIN;

SELECT *
FROM tat.project_technology
WHERE FALSE;

ROLLBACK;
