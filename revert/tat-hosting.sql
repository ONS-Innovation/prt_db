-- Revert prt_db:tat-hosting from pg

BEGIN;

DROP TABLE IF EXISTS tat.hosting;

COMMIT;
