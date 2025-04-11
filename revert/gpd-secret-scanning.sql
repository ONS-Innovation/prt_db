-- Revert prt_db:gpd-secret-scanning from pg

BEGIN;

DROP TABLE IF EXISTS github_policy.secret_scanning;

COMMIT;
