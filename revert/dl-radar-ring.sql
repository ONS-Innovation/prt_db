-- Revert prt_db:dl-radar-ring from pg

BEGIN;

DROP TABLE IF EXISTS dl.radar_ring;

COMMIT;
