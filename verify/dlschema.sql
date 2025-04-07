-- Verify prt_db:dlschema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('dl', 'usage');

ROLLBACK;
