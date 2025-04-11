-- Deploy prt_db:tat-project-hosting to pg
-- requires: tat-schema
-- requires: tat-project
-- requires: tat-hosting

BEGIN;

CREATE TABLE tech_audit.project_hosting (
    project_id INT REFERENCES tech_audit.project (project_id) NOT NULL,
    hosting_id INT REFERENCES tech_audit.hosting (hosting_id) NOT NULL,
    PRIMARY KEY (project_id, hosting_id)
);

COMMIT;
