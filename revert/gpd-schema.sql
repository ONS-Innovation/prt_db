-- Revert prt_db:gpd-schema from pg

BEGIN;

DROP SCHEMA gpd;

COMMIT;
