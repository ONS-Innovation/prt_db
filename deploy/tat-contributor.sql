-- Deploy prt_db:tat-contributor to pg
-- requires: tat-schema
-- requires: tat-project

BEGIN;

CREATE TABLE contributor (
    contributor_id SERIAL PRIMARY KEY NOT NULL,
    project_id INT REFERENCES tat.project (project_id) NOT NULL,
    name VARCHAR(50) NOT NULL
);

COMMIT;
