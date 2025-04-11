-- Revert prt_db:dl-radar-quadrant from pg

BEGIN;

DROP TABLE IF EXISTS digital_landscape.radar_quadrant;

COMMIT;
