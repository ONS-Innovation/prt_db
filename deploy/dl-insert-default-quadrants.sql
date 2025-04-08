-- Deploy prt_db:dl-add-default-quadrants to pg
-- requires: dl-schema
-- requires: dl-radar-quadrant

BEGIN;

INSERT INTO dl.radar_quadrant (name)
VALUES
('Infrastructure'),
('Languages'),
('Supporting Tools'),
('Frameworks'),
('Review'),
('Ignore');

COMMIT;
