-- Verify prt_db:gcpschema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('gcp', 'usage');

ROLLBACK;
