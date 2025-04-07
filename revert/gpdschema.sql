-- Revert prt_db:gpdschema from pg

BEGIN;

DROP SCHEMA gpd;

COMMIT;
