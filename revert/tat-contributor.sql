-- Revert prt_db:tat-contributor from pg

BEGIN;

DROP TABLE IF EXISTS tat.contributor;

COMMIT;
