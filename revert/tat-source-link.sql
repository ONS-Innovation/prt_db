-- Revert prt_db:tat-source-link from pg

BEGIN;

DROP TABLE IF EXISTS tat.source_link;

COMMIT;
