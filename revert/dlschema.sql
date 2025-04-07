-- Revert prt_db:dlschema from pg

BEGIN;

DROP SCHEMA dl;

COMMIT;
