-- Revert prt_db:gh-schema from pg

BEGIN;

DROP SCHEMA gh;

COMMIT;
