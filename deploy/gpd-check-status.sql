-- Deploy prt_db:gpd-check-status to pg
-- requires: gpd-schema
-- requires: gpd-policy-check

BEGIN;

CREATE TABLE github_policy.check_status (
    url VARCHAR(255) REFERENCES github_scraper.github_repository (url) NOT NULL,
    check_id INT REFERENCES github_policy.policy_check (check_id) NOT NULL,
    status BOOLEAN NOT NULL,
    PRIMARY KEY (url, check_id)
);

COMMIT;
