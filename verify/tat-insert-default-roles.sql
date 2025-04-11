-- Verify prt_db:tat-insert-default-roles on pg

BEGIN;

DO $$
BEGIN
    ASSERT (
        SELECT COUNT(*) = 3
        FROM tech_audit.role AS r
        WHERE r.name IN (
            'Technical Contact',
            'Delivery Manager',
            'Editor'
        )
    );
END $$;

ROLLBACK;
