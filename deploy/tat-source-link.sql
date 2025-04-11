-- Deploy prt_db:tat-source-link to pg
-- requires: tat-schema
-- requires: tat-project
-- requires: tat-source-control
-- requires: gh-organisation

BEGIN;

CREATE TABLE tech_audit.source_link (
    source_control_id INT REFERENCES tech_audit.source_control (source_control_id) NOT NULL,
    project_id INT REFERENCES tech_audit.project (project_id) NOT NULL,
    url VARCHAR(255) NOT NULL,
    organisation_id INT REFERENCES github_scraper.organisation (organisation_id),
    PRIMARY KEY (project_id, url)
);

COMMIT;
