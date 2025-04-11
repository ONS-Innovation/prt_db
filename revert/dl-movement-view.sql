-- Revert prt_db:dl-movement-view from pg

BEGIN;

DROP VIEW IF EXISTS digital_landscape.ring_movement;

COMMIT;
