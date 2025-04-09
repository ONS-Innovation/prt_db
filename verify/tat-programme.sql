-- Verify prt_db:tat-programme on pg

BEGIN;

SELECT *
FROM tat.programme
WHERE FALSE;

ROLLBACK;
