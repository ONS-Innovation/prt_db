-- Deploy prt_db:tat-documentation to pg
-- requires: tat-schema
-- requires: tat-project

BEGIN;

CREATE TABLE tat.documentation (
    documentation_id SERIAL PRIMARY KEY NOT NULL,
    project_id INT REFERENCES tat.project (project_id) NOT NULL,
    link VARCHAR(255)
);

COMMIT;
