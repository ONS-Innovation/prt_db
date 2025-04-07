-- Deploy prt_db:tat-source-link to pg
-- requires: tat-schema
-- requires: tat-project
-- requires: tat-source-control
-- requires: gh-organisation

BEGIN;

CREATE TABLE tat.source_link (
    source_control_id INT REFERENCES tat.source_control (source_control_id) NOT NULL,
    project_id INT REFERENCES tat.project (project_id) NOT NULL,
    url VARCHAR(255) NOT NULL,
    organisation_id INT REFERENCES gh.organisation (organisation_id)
);

COMMIT;
