-- Verify prt_db:gh-organisation on pg

BEGIN;

SELECT *
FROM gh.organisation
WHERE FALSE;

ROLLBACK;
