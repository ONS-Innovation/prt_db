-- Verify prt_db:tat-project-hosting on pg

BEGIN;

SELECT *
FROM tat.project_hosting
WHERE FALSE;

ROLLBACK;
