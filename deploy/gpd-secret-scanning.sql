-- Deploy prt_db:gpd-secret-scanning to pg
-- requires: gpd-schema
-- requires: gh-repository

BEGIN;

CREATE TABLE gpd.secret_scanning (
    url VARCHAR(255) REFERENCES gh.github_repository (url) PRIMARY KEY NOT NULL,
    oldest_alert TIMESTAMP NOT NULL,
    alert_count INT NOT NULL
);

COMMIT;
