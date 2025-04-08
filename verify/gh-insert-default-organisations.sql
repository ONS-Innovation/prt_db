-- Verify prt_db:gh-insert-default-organisations on pg

BEGIN;

DO $$
BEGIN
    ASSERT (
        SELECT COUNT(*) = 2
        FROM gh.organisation AS o
        WHERE o.name IN (
            'ONSdigital',
            'ONS-Innovation'
        )
    );
END $$;

ROLLBACK;
