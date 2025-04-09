-- Verify prt_db:gh-schema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('gh', 'usage');

ROLLBACK;
