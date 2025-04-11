-- Verify prt_db:dl-movement-view on pg

BEGIN;

SELECT *
FROM digital_landscape.ring_movement
WHERE FALSE;

ROLLBACK;
