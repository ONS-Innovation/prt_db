-- Verify prt_db:ghschema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('gh', 'usage');

ROLLBACK;
