-- Verify prt_db:gh-repository-technology on pg

BEGIN;

SELECT *
FROM github_scraper.repository_technology
WHERE FALSE;

ROLLBACK;
