-- Revert prt_db:dl-radar-timeline from pg

BEGIN;

DROP TABLE IF EXISTS dl.radar_timeline;

COMMIT;
