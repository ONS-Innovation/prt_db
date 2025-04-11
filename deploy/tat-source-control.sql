-- Deploy prt_db:tat-source-control to pg
-- requires: tat-schema

BEGIN;

CREATE TABLE tech_audit.source_control (
    source_control_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(30) NOT NULL
);

COMMIT;
