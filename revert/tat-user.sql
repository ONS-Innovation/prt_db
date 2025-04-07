-- Revert prt_db:tat-user from pg

BEGIN;

-- SQLFluff doesn't like the table being called user.
-- This can be ignored.

DROP TABLE IF EXISTS tat.user; -- noqa: PRS

COMMIT;
