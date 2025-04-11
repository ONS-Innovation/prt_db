-- Revert prt_db:tat-documentation from pg

BEGIN;

DROP TABLE IF EXISTS tech_audit.documentation;

COMMIT;
