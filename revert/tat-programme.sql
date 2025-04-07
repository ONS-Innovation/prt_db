-- Revert prt_db:tat-programme from pg

BEGIN;

DROP TABLE IF EXISTS tat.programme;

COMMIT;
