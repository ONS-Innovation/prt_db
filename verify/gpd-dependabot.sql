-- Verify prt_db:gpd-dependabot on pg

BEGIN;

SELECT *
FROM github_policy.dependabot
WHERE FALSE;

ROLLBACK;
