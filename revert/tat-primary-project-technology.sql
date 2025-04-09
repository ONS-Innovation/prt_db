-- Revert prt_db:tat-primary-project-technology from pg

BEGIN;

ALTER TABLE tat.project_technology
DROP COLUMN is_primary;

COMMIT;
