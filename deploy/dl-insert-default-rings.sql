-- Deploy prt_db:dl-insert-default-rings to pg
-- requires: dl-schema
-- requires: dl-radar-ring

BEGIN;

INSERT INTO dl.radar_ring (name) 
VALUES
    ('Adopt'),
    ('Trial'),
    ('Assess'),
    ('Hold');

COMMIT;
