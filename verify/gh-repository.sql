-- Verify prt_db:gh-repository on pg

BEGIN;

SELECT *
FROM gh.github_repository
WHERE FALSE;

ROLLBACK;
