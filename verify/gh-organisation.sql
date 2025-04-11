-- Verify prt_db:gh-organisation on pg

BEGIN;

SELECT *
FROM github_scraper.organisation
WHERE FALSE;

ROLLBACK;
