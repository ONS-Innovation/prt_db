-- Verify prt_db:dbo-technology on pg

BEGIN;

SELECT *
FROM dbo.technology
WHERE FALSE;

ROLLBACK;
