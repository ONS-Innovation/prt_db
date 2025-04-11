-- Deploy prt_db:tat-hosting to pg
-- requires: tat-schema

BEGIN;

CREATE TABLE tech_audit.hosting (
    hosting_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(10) NOT NULL
);

COMMIT;
