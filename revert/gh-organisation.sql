-- Revert prt_db:gh-organisation from pg

BEGIN;

DROP TABLE IF EXISTS gh.organisation;

COMMIT;
