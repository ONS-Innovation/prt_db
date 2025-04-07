-- Verify prt_db:dl-radar-quadrant on pg

BEGIN;

SELECT *
FROM dl.radar_quadrant
WHERE FALSE;

ROLLBACK;
