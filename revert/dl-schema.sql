-- Revert prt_db:dl-schema from pg

BEGIN;

DROP SCHEMA dl;

COMMIT;
