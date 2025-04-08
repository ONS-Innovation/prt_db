-- Deploy prt_db:gh-repository-technology to pg
-- requires: gh-schema
-- requires: gh-repository
-- requires: dbo-technology

BEGIN;

CREATE TABLE gh.repository_technology (
    url VARCHAR(255) REFERENCES gh.github_repository (url) NOT NULL,
    technology_id INT REFERENCES dbo.technology (technology_id) NOT NULL,
    size INT,
    percentage DECIMAL,
    PRIMARY KEY (url, technology_id)
);

COMMIT;
