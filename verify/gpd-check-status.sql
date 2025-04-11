-- Verify prt_db:gpd-check-status on pg

BEGIN;

SELECT *
FROM github_policy.check_status
WHERE FALSE;

ROLLBACK;
