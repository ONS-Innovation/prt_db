-- Verify prt_db:dl-add-default-quadrants on pg

BEGIN;

SELECT 1/COUNT(*) 
FROM dl.radar_quadrant AS q 
WHERE q.name IN (
    'Infrastructure', 
    'Languages', 
    'Supporting Tools', 
    'Frameworks'
);

ROLLBACK;
