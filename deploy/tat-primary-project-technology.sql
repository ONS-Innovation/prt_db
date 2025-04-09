-- Deploy prt_db:tat-primary-project-technology to pg
-- requires: tat-project-technology

BEGIN;

ALTER TABLE tat.project_technology
ADD is_primary BOOLEAN NOT NULL;

COMMIT;
