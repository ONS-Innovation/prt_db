-- Verify prt_db:tat-role on pg

BEGIN;

SELECT *
FROM tat.role
WHERE FALSE;

ROLLBACK;
