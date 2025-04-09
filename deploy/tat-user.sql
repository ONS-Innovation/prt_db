-- Deploy prt_db:tat-user to pg
-- requires: tat-schema
-- requires: tat-project
-- requires: tat-role

BEGIN;

-- SQLFluff doesn't like the table being called user.
-- This can be ignored.

CREATE TABLE tat.user ( -- noqa: PRS
    project_id INT REFERENCES tat.project (project_id) NOT NULL,
    role_id INT REFERENCES tat.role (role_id) NOT NULL,
    email VARCHAR(120) NOT NULL,
    grade VARCHAR(10),
    PRIMARY KEY (project_id, role_id, email)
);

COMMIT;
