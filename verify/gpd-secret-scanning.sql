-- Verify prt_db:gpd-secret-scanning on pg

BEGIN;

SELECT *
FROM gpd.secret_scanning
WHERE FALSE;

ROLLBACK;
