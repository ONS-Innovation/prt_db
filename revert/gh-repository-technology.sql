-- Revert prt_db:gh-repository-technology from pg

BEGIN;

DROP TABLE IF EXISTS github_scraper.repository_technology;

COMMIT;
