-- Verify prt_db:tat-hosting on pg

BEGIN;

SELECT *
FROM tech_audit.hosting
WHERE FALSE;

ROLLBACK;
