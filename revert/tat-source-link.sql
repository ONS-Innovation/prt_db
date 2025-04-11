-- Revert prt_db:tat-source-link from pg

BEGIN;

DROP TABLE IF EXISTS tech_audit.source_link;

COMMIT;
