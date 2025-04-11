-- Verify prt_db:tat-project on pg

BEGIN;

SELECT *
FROM tech_audit.project
WHERE FALSE;

ROLLBACK;
