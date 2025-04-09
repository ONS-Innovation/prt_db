-- Verify prt_db:tat-documentation on pg

BEGIN;

SELECT *
FROM tat.documentation
WHERE FALSE;

ROLLBACK;
