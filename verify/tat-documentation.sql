-- Verify prt_db:tat-documentation on pg

BEGIN;

SELECT *
FROM tech_audit.documentation
WHERE FALSE;

ROLLBACK;
