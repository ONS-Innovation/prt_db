-- Deploy prt_db:tat-technology-type to pg
-- requires: tat-schema

BEGIN;

CREATE TABLE tat.technology_type (
    technology_type_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(30) NOT NULL
);

COMMIT;
