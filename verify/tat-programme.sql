-- Verify prt_db:tat-programme on pg

BEGIN;

SELECT *
FROM tech_audit.programme
WHERE FALSE;

ROLLBACK;
