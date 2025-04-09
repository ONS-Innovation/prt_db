-- Verify prt_db:tat-hosting on pg

BEGIN;

SELECT *
FROM tat.hosting
WHERE FALSE;

ROLLBACK;
