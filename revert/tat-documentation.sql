-- Revert prt_db:tat-documentation from pg

BEGIN;

DROP TABLE IF EXISTS tat.documentation;

COMMIT;
