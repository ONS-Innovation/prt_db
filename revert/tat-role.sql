-- Revert prt_db:tat-role from pg

BEGIN;

DROP TABLE IF EXISTS tech_audit.role;

COMMIT;
