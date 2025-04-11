-- Deploy prt_db:gpd-dependabot to pg
-- requires: gpd-schema
-- requires: gh-repository

BEGIN;

CREATE TABLE github_policy.dependabot (
    url VARCHAR(255) REFERENCES github_scraper.github_repository (url) PRIMARY KEY NOT NULL,
    oldest_alert TIMESTAMP NOT NULL,
    worst_severity VARCHAR(8) NOT NULL,
    critical_alerts INT NOT NULL,
    high_alerts INT NOT NULL,
    medium_alerts INT NOT NULL,
    low_alerts INT NOT NULL
);

COMMIT;
