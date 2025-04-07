-- Revert prt_db:tat-project-technology from pg

BEGIN;

DROP TABLE IF EXISTS tat.project_technology;

COMMIT;
