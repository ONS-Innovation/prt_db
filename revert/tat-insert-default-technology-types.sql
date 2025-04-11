-- Revert prt_db:tat-insert-default-technology-types from pg

BEGIN;

DELETE FROM tech_audit.technology_type AS t
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
);

COMMIT;
