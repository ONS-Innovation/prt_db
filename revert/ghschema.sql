-- Revert prt_db:ghschema from pg

BEGIN;

DROP SCHEMA gh;

COMMIT;
