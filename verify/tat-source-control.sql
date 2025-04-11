-- Verify prt_db:tat-source-control on pg

BEGIN;

SELECT *
FROM tech_audit.source_control
WHERE FALSE;

ROLLBACK;
