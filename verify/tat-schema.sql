-- Verify prt_db:tat-schema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('tech_audit', 'usage');

ROLLBACK;
