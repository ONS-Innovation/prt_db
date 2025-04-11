-- Revert prt_db:tat-technology-type from pg

BEGIN;

DROP TABLE IF EXISTS tech_audit.technology_type;

COMMIT;
