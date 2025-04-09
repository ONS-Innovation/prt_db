-- Revert prt_db:gh-repository-technology from pg

BEGIN;

DROP TABLE IF EXISTS gh.repository_technology;

COMMIT;
