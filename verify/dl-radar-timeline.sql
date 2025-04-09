-- Verify prt_db:dl-radar-timeline on pg

BEGIN;

SELECT *
FROM dl.radar_timeline
WHERE FALSE;

ROLLBACK;
