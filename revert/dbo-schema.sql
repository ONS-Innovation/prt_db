-- Revert prt_db:dbo-schema from pg

BEGIN;

DROP SCHEMA dbo;

COMMIT;
