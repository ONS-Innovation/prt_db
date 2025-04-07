-- Revert prt_db:tat-source-control from pg

BEGIN;

DROP TABLE IF EXISTS tat.source_control;

COMMIT;
