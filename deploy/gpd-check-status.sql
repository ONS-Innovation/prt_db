-- Deploy prt_db:gpd-check-status to pg
-- requires: gpd-schema
-- requires: gpd-policy-check

BEGIN;

CREATE TABLE gpd.check_status (
    url VARCHAR(255) REFERENCES gh.github_repository (url) NOT NULL,
    check_id INT REFERENCES gpd.policy_check (check_id) NOT NULL,
    status BOOLEAN NOT NULL,
    PRIMARY KEY (url, check_id)
);

COMMIT;
