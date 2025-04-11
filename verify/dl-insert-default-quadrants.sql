-- Verify prt_db:dl-add-default-quadrants on pg

BEGIN;

DO $$
BEGIN
    ASSERT (
        SELECT COUNT(*) = 6
        FROM digital_landscape.radar_quadrant AS q 
        WHERE q.name IN (
            'Infrastructure', 
            'Languages', 
            'Supporting Tools', 
            'Frameworks',
            'Review',
            'Ignore'
        )
    );
END $$;

ROLLBACK;
