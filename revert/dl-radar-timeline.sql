-- Revert prt_db:dl-radar-timeline from pg

BEGIN;

DROP TABLE IF EXISTS digital_landscape.radar_timeline;

COMMIT;
