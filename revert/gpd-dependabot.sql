-- Revert prt_db:gpd-dependabot from pg

BEGIN;

DROP TABLE IF EXISTS gpd.dependabot;

COMMIT;
