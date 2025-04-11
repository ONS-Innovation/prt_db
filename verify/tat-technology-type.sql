-- Verify prt_db:tat-technology-type on pg

BEGIN;

SELECT *
FROM tech_audit.technology_type
WHERE FALSE;

ROLLBACK;
