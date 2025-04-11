-- Deploy prt_db:gh-team to pg
-- requires: gh-schema
-- requires: gh-repository

BEGIN;

CREATE TABLE github_scraper.github_team (
    url VARCHAR(255) REFERENCES github_scraper.github_repository (url) NOT NULL,
    team_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (url, team_name)
);

COMMIT;
