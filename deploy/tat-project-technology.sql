-- Deploy prt_db:tat-project-technology to pg
-- requires: tat-schema
-- requires: tat-project
-- requires: dbo-technology

BEGIN;

CREATE TABLE tech_audit.project_technology (
    project_id INT REFERENCES tech_audit.project (project_id) NOT NULL,
    technology_id INT REFERENCES dbo.technology (technology_id) NOT NULL,
    is_primary BOOLEAN NOT NULL,
    PRIMARY KEY (project_id, technology_id)
);

COMMIT;
