-- Deploy prt_db:dl-radar-quadrant to pg
-- requires: dl-schema

BEGIN;

CREATE TABLE dl.radar_quadrant (
    quadrant_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL
);

COMMIT;
