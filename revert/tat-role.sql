-- Revert prt_db:tat-role from pg

BEGIN;

DROP TABLE IF EXISTS tat.role;

COMMIT;
