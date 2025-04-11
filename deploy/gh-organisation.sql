-- Deploy prt_db:gh-organisation to pg
-- requires: gh-schema

BEGIN;

CREATE TABLE github_scraper.organisation (
    organisation_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(39) NOT NULL
);

COMMIT;
