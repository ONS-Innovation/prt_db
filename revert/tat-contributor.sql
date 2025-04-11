-- Revert prt_db:tat-contributor from pg

BEGIN;

DROP TABLE IF EXISTS tech_audit.contributor;

COMMIT;
