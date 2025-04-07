-- Verify prt_db:tat-source-control on pg

BEGIN;

SELECT *
FROM tat.source_control
WHERE FALSE;

ROLLBACK;
