-- Verify prt_db:gpd-policy-check on pg

BEGIN;

SELECT *
FROM github_policy.policy_check
WHERE FALSE;

ROLLBACK;
