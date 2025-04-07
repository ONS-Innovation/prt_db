-- Revert prt_db:tat-project-hosting from pg

BEGIN;

DROP TABLE IF EXISTS tat.project_hosting;

COMMIT;
