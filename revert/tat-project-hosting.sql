-- Revert prt_db:tat-project-hosting from pg

BEGIN;

DROP TABLE IF EXISTS tech_audit.project_hosting;

COMMIT;
