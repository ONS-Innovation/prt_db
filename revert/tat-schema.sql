-- Revert prt_db:tat-schema from pg

BEGIN;

DROP SCHEMA tech_audit;

COMMIT;
