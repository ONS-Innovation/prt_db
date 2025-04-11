-- Verify prt_db:tat-contributor on pg

BEGIN;

SELECT *
FROM tech_audit.contributor
WHERE FALSE;

ROLLBACK;
