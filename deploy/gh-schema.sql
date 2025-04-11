-- Deploy prt_db:gh-schema to pg

BEGIN;

CREATE SCHEMA github_scraper;

COMMIT;
