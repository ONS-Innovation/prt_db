-- Verify prt_db:gpd-policy-check on pg

BEGIN;

SELECT *
FROM gpd.policy_check
WHERE FALSE;

ROLLBACK;
