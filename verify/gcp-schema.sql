-- Verify prt_db:gcp-schema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('github_copilot', 'usage');

ROLLBACK;
