-- Revert prt_db:gh-team from pg

BEGIN;

DROP TABLE IF EXISTS github_scraper.github_team;

COMMIT;
