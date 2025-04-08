-- Revert prt_db:dl-insert-default-rings from pg

BEGIN;

DELETE FROM dl.radar_ring AS r
WHERE r.name IN (
    'Adopt',
    'Trial',
    'Assess',
    'Hold'
);

COMMIT;
