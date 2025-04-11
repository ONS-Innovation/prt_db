-- Revert prt_db:tat-project-technology from pg

BEGIN;

DROP TABLE IF EXISTS tech_audit.project_technology;

COMMIT;
