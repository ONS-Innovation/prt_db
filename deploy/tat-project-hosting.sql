-- Deploy prt_db:tat-project-hosting to pg
-- requires: tat-schema
-- requires: tat-project
-- requires: tat-hosting

BEGIN;

CREATE TABLE tat.project_hosting (
    project_id INT REFERENCES tat.project (project_id) NOT NULL,
    hosting_id INT REFERENCES tat.hosting (hosting_id) NOT NULL,
    PRIMARY KEY (project_id, hosting_id)
);

COMMIT;
