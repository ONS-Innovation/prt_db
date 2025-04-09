-- Revert prt_db:gpd-policy-check from pg

BEGIN;

DROP TABLE IF EXISTS gpd.policy_check;

COMMIT;
