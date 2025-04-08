-- Verify prt_db:gpd-check-status on pg

BEGIN;

SELECT *
FROM gpd.check_status
WHERE FALSE;

ROLLBACK;
