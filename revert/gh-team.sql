-- Revert prt_db:gh-team from pg

BEGIN;

DROP TABLE IF EXISTS gh.github_team;

COMMIT;
