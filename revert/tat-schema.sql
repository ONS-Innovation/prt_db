-- Revert prt_db:tat-schema from pg

BEGIN;

DROP SCHEMA tat;

COMMIT;
