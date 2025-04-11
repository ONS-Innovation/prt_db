-- Deploy prt_db:dl-movement-view to pg
-- requires: dl-radar-timeline

BEGIN;

CREATE OR REPLACE VIEW digital_landscape.ring_movement AS
SELECT
    *,
    previous_ring - ring_id AS movement
FROM (
    SELECT
        t1.*,
        (
            SELECT t2.ring_id
            FROM digital_landscape.radar_timeline AS t2
            WHERE
                t2.technology_id = t1.technology_id
                AND t2.change_date < t1.change_date
            ORDER BY t2.change_date DESC
            LIMIT 1
        ) AS previous_ring
    FROM digital_landscape.radar_timeline AS t1
);

COMMIT;
