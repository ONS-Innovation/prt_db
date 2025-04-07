-- Verify prt_db:tatschema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('tat', 'usage');

ROLLBACK;
