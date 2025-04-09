-- Revert prt_db:dl-radar-quadrant from pg

BEGIN;

DROP TABLE IF EXISTS dl.radar_quadrant;

COMMIT;
