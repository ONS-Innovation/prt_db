-- Revert prt_db:gcp-schema from pg

BEGIN;

DROP SCHEMA gcp;

COMMIT;
