-- Revert prt_db:dl-schema from pg

BEGIN;

DROP SCHEMA digital_landscape;

COMMIT;
