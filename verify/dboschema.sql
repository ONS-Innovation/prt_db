-- Verify prt_db:dboschema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('dbo', 'usage');

ROLLBACK;
