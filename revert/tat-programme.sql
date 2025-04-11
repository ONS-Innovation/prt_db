-- Revert prt_db:tat-programme from pg

BEGIN;

DROP TABLE IF EXISTS tech_audit.programme;

COMMIT;
