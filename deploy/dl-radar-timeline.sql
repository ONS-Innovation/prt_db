-- Deploy prt_db:dl-radar-timeline to pg
-- requires: dl-schema
-- requires: dbo-technology
-- requires: dl-radar-ring

BEGIN;

CREATE TABLE dl.radar_timeline (
    technology_id INT REFERENCES dbo.technology (technology_id) NOT NULL,
    ring_id INT REFERENCES dl.radar_ring (ring_id) NOT NULL,
    change_date TIMESTAMP NOT NULL,
    reason VARCHAR(1000) NOT NULL,
    PRIMARY KEY (technology_id, ring_id, change_date)
);

COMMIT;
