-- Verify prt_db:dl-radar-quadrant on pg

BEGIN;

SELECT *
FROM digital_landscape.radar_quadrant
WHERE FALSE;

ROLLBACK;
