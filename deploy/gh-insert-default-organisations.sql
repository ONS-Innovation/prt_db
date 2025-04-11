-- Deploy prt_db:gh-insert-default-organisations to pg
-- requires: gh-schema
-- requires: gh-organisation

BEGIN;

INSERT INTO github_scraper.organisation (name)
VALUES
('ONSdigital'),
('ONS-Innovation');

COMMIT;
