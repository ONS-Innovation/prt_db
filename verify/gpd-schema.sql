-- Verify prt_db:gpd-schema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('gpd', 'usage');

ROLLBACK;
