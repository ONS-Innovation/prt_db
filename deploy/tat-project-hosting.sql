-- Deploy prt_db:tat-project-hosting to pg
-- requires: tat-schema
-- requires: tat-project
-- requires: tat-hosting

BEGIN;

CREATE TABLE tat.project_hosting (
    project_id INT NOT NULL REFERENCES tat.project(project_id),
    hosting_id INT NOT NULL REFERENCES tat.hosting(hosting_id),
    PRIMARY KEY (project_id, hosting_id)
);

COMMIT;
