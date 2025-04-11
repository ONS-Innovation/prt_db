-- Verify prt_db:gh-repository on pg

BEGIN;

SELECT *
FROM github_scraper.github_repository
WHERE FALSE;

ROLLBACK;
