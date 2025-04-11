-- Verify prt_db:gpd-secret-scanning on pg

BEGIN;

SELECT *
FROM github_policy.secret_scanning
WHERE FALSE;

ROLLBACK;
