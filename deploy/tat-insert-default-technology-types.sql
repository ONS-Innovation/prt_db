-- Deploy prt_db:tat-insert-default-technology-types to pg
-- requires: tat-schema
-- requires: tat-technology-type

BEGIN;

INSERT INTO tech_audit.technology_type (name)
VALUES
('hosting'),
('database'),
('languages'),
('frameworks'),
('cicd'),
('infrastructure'),
('code_editors'),
('user_interface'),
('diagrams'),
('project_tracking'),
('documentation'),
('communication'),
('collaboration'),
('incident_management');

COMMIT;
