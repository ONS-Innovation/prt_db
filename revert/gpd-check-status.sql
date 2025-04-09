-- Revert prt_db:gpd-check-status from pg

BEGIN;

DROP TABLE IF EXISTS gpd.check_status;

COMMIT;
