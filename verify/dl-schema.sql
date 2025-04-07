-- Verify prt_db:dl-schema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('dl', 'usage');

ROLLBACK;
