-- Verify prt_db:tat-role on pg

BEGIN;

SELECT *
FROM tech_audit.role
WHERE FALSE;

ROLLBACK;
