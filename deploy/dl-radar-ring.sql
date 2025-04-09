-- Deploy prt_db:dl-radar-ring to pg
-- requires: dl-schema

BEGIN;

CREATE TABLE dl.radar_ring (
    ring_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL
);

COMMIT;
