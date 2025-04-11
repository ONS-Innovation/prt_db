-- Verify prt_db:tat-insert-default-technology-types on pg

BEGIN;

DO $$
BEGIN
    ASSERT(
        SELECT COUNT(*) = 15
        FROM tech_audit.technology_type AS t
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
            'incident_management',
            'other'
        )
    );
END $$;

ROLLBACK;
