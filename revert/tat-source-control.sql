-- Revert prt_db:tat-source-control from pg

BEGIN;

DROP TABLE IF EXISTS tech_audit.source_control;

COMMIT;
