-- Revert prt_db:tat-project from pg

BEGIN;

DROP TABLE IF EXISTS tech_audit.project;

COMMIT;
