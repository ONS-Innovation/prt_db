-- Verify prt_db:dl-insert-default-rings on pg

BEGIN;

DO $$
BEGIN
    ASSERT (
        SELECT COUNT(*) = 4
        FROM dl.radar_ring AS r
        WHERE r.name IN (
            'Adopt',
            'Trial',
            'Assess',
            'Hold'
        )
    );
END $$;

ROLLBACK;
