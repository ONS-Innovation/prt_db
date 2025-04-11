-- Verify prt_db:dl-radar-ring on pg

BEGIN;

SELECT *
FROM digital_landscape.radar_ring
WHERE FALSE;

ROLLBACK;
