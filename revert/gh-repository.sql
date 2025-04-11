-- Revert prt_db:gh-repository from pg

BEGIN;

DROP TABLE IF EXISTS github_scraper.github_repository;

COMMIT;
