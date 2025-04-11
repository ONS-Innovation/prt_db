-- Verify prt_db:tat-user on pg

BEGIN;

-- SQLFluff doesn't like the table being called user.
-- This can be ignored.

SELECT *
FROM tech_audit.user   -- noqa: PRS
WHERE FALSE;

ROLLBACK;
