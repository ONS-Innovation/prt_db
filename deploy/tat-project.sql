-- Deploy prt_db:tat-project to pg
-- requires: tat-schema
-- requires: tat-programme

BEGIN;

CREATE TABLE tat.project (
    project_id SERIAL PRIMARY KEY NOT NULL,
    programme_id INT REFERENCES tat.programme (programme_id),
    name VARCHAR(50) NOT NULL,
    short_name VARCHAR(10),
    description VARCHAR(1000),
    stage VARCHAR(30),
    developed VARCHAR(30),
    hosted VARCHAR(30)
);

COMMIT;
