-- Verify prt_db:gh-team on pg

BEGIN;

SELECT *
FROM github_scraper.github_team
WHERE FALSE;

ROLLBACK;
