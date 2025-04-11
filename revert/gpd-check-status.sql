-- Revert prt_db:gpd-check-status from pg

BEGIN;

DROP TABLE IF EXISTS github_policy.check_status;

COMMIT;
