-- Deploy prt_db:tat-role to pg
-- requires: tat-schema

BEGIN;

CREATE TABLE tat.role (
    role_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(30) NOT NULL
);

COMMIT;
