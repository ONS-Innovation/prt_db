-- Verify prt_db:dl-movement-view on pg

BEGIN;

SELECT *
FROM dl.ring_movement
WHERE FALSE;

ROLLBACK;
