-- Revert prt_db:tatschema from pg

BEGIN;

DROP SCHEMA tat;

COMMIT;
