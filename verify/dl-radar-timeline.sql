-- Verify prt_db:dl-radar-timeline on pg

BEGIN;

SELECT *
FROM digital_landscape.radar_timeline
WHERE FALSE;

ROLLBACK;
