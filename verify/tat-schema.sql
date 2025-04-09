-- Verify prt_db:tat-schema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('tat', 'usage');

ROLLBACK;
