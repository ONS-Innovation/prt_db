-- Verify prt_db:gpd-dependabot on pg

BEGIN;

SELECT *
FROM gpd.dependabot
WHERE FALSE;

ROLLBACK;
