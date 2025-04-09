-- Revert prt_db:tat-technology-type from pg

BEGIN;

DROP TABLE IF EXISTS tat.technology_type;

COMMIT;
