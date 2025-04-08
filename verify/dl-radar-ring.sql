-- Verify prt_db:dl-radar-ring on pg

BEGIN;

SELECT *
FROM dl.radar_ring
WHERE FALSE;

ROLLBACK;
