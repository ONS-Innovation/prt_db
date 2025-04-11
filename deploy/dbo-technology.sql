-- Deploy prt_db:dbo-technology to pg
-- requires: dbo-schema
-- requires: tat-technology-type
-- requires: dl-radar-quadrant

BEGIN;

CREATE TABLE dbo.technology (
    technology_id SERIAL PRIMARY KEY NOT NULL,
    technology_type_id INT REFERENCES tech_audit.technology_type (technology_type_id) NOT NULL,
    quadrant_id INT REFERENCES digital_landscape.radar_quadrant (quadrant_id) NOT NULL,
    name VARCHAR(50) NOT NULL
);

COMMIT;
