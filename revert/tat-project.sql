-- Revert prt_db:tat-project from pg

BEGIN;

DROP TABLE IF EXISTS tat.project;

COMMIT;
