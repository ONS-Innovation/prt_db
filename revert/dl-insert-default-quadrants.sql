-- Revert prt_db:dl-add-default-quadrants from pg

BEGIN;

DELETE FROM dl.radar_quadrant AS q
WHERE q.name IN (
    'Infrastructure',
    'Languages',
    'Supporting Tools',
    'Frameworks'
);

COMMIT;
