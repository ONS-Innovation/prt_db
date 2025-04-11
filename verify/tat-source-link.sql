-- Verify prt_db:tat-source-link on pg

BEGIN;

SELECT *
FROM tech_audit.source_link
WHERE FALSE;

ROLLBACK;
