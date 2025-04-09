-- Revert prt_db:dbo-technology from pg

BEGIN;

DROP TABLE IF EXISTS dbo.technology;

COMMIT;
