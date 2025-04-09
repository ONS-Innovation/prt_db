-- Verify prt_db:tat-insert-default-technology-types on pg

BEGIN;

DO $$
BEGIN
    ASSERT(
        SELECT COUNT(*) = 14
        FROM tat.technology_type AS t
        WHERE t.name IN (
            'hosting',
            'database',
            'languages',
            'frameworks',
            'cicd',
            'infrastructure',
            'code_editors',
            'user_interface',
            'diagrams',
            'project_tracking',
            'documentation',
            'communication',
            'collaboration',
            'incident_management'
        )
    );
END $$;

ROLLBACK;
