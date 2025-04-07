-- Revert prt_db:gcpschema from pg

BEGIN;

DROP SCHEMA gcp;

COMMIT;
