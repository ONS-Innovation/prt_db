-- Revert prt_db:dboschema from pg

BEGIN;

DROP SCHEMA dbo;

COMMIT;
