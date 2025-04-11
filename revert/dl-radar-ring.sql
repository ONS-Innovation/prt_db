-- Revert prt_db:dl-radar-ring from pg

BEGIN;

DROP TABLE IF EXISTS digital_landscape.radar_ring;

COMMIT;
