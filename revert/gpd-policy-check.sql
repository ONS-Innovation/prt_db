-- Revert prt_db:gpd-policy-check from pg

BEGIN;

DROP TABLE IF EXISTS github_policy.policy_check;

COMMIT;
