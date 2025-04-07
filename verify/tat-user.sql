-- Verify prt_db:tat-user on pg

BEGIN;

SELECT *
FROM tat.user
WHERE FALSE;

ROLLBACK;
