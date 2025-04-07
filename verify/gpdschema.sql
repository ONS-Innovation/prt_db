-- Verify prt_db:gpdschema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('gpd', 'usage');

ROLLBACK;
