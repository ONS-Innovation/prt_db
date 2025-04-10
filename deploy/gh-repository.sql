-- Deploy prt_db:gh-repository to pg
-- requires: gh-schema
-- requires: gh-organisation

BEGIN;

CREATE TABLE gh.github_repository (
    url VARCHAR(255) PRIMARY KEY NOT NULL,
    organisation_id INT REFERENCES gh.organisation (organisation_id) NOT NULL,
    name VARCHAR(60) NOT NULL,
    visibility VARCHAR(8) NOT NULL,
    is_archived BOOLEAN NOT NULL,
    last_commit TIMESTAMP
);

COMMIT;
