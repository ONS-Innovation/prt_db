-- Revert prt_db:gpd-secret-scanning from pg

BEGIN;

DROP TABLE IF EXISTS gpd.secret_scanning;

COMMIT;
