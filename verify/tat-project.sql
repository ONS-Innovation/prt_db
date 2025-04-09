-- Verify prt_db:tat-project on pg

BEGIN;

SELECT *
FROM tat.project
WHERE FALSE;

ROLLBACK;
