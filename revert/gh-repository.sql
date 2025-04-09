-- Revert prt_db:gh-repository from pg

BEGIN;

DROP TABLE IF EXISTS gh.github_repository;

COMMIT;
