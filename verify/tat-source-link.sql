-- Verify prt_db:tat-source-link on pg

BEGIN;

SELECT *
FROM tat.source_link
WHERE FALSE;

ROLLBACK;
