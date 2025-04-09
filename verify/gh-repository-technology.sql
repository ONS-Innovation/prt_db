-- Verify prt_db:gh-repository-technology on pg

BEGIN;

SELECT *
FROM gh.repository_technology
WHERE FALSE;

ROLLBACK;
