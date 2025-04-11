-- Verify prt_db:dl-schema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('digital_landscape', 'usage');

ROLLBACK;
