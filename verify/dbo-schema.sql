-- Verify prt_db:dbo-schema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('dbo', 'usage');

ROLLBACK;
