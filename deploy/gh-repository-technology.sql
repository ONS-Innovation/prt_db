-- Deploy prt_db:gh-repository-technology to pg
-- requires: gh-schema
-- requires: gh-repository
-- requires: dbo-technology

BEGIN;

CREATE TABLE github_scraper.repository_technology (
    url VARCHAR(255) REFERENCES github_scraper.github_repository (url) NOT NULL,
    technology_id INT REFERENCES dbo.technology (technology_id) NOT NULL,
    size INT,
    percentage DECIMAL,
    PRIMARY KEY (url, technology_id)
);

COMMIT;
