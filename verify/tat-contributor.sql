-- Verify prt_db:tat-contributor on pg

BEGIN;

SELECT *
FROM tat.contributor
WHERE FALSE;

ROLLBACK;
