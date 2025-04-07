-- Verify prt_db:tat-technology-type on pg

BEGIN;

SELECT *
FROM tat.technology_type
WHERE FALSE;

ROLLBACK;
