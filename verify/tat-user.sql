-- Verify prt_db:tat-user on pg

BEGIN;

-- SQLFluff doesn't like the table being called user.
-- This can be ignored.

SELECT *
FROM tat.user   -- noqa: PRS
WHERE FALSE;

ROLLBACK;
