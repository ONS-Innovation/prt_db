-- Deploy prt_db:tat-programme to pg
-- requires: tat-schema

BEGIN;

CREATE TABLE tat.programme (
    programme_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    short_name VARCHAR(10)
);

COMMIT;
