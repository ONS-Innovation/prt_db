-- Revert prt_db:tat-user from pg

BEGIN;

DROP TABLE IF EXISTS tat.user;

COMMIT;
