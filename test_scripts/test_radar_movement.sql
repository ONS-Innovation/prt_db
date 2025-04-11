-- This script inserts example values into dbo.technology and digital_landscape.radar_timeline to simulate a technology being moved between rings.
-- This is helpful to test that digital_landscape.ring_movement is working correctly.

-- Note: If the database has pre-existing values, some of the ID's passed during insertion may need to be changed.

INSERT INTO dbo.technology (name, quadrant_id, technology_type_id)
VALUES ('Python', 2, 3);

INSERT INTO digital_landscape.radar_timeline (technology_id, ring_id, reason)
VALUES (3, 3, 'Initial Placement');

INSERT INTO digital_landscape.radar_timeline (technology_id, ring_id, reason)
VALUES (3, 1, 'Move to Adopt');
