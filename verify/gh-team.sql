-- Verify prt_db:gh-team on pg

BEGIN;

SELECT *
FROM gh.github_team
WHERE FALSE;

ROLLBACK;
