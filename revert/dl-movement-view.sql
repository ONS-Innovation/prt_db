-- Revert prt_db:dl-movement-view from pg

BEGIN;

DROP VIEW IF EXISTS dl.ring_movement;

COMMIT;
