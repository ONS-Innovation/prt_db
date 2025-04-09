-- Deploy prt_db:tat-insert-default-roles to pg
-- requires: tat-schema
-- requires: tat-role

BEGIN;

INSERT INTO tat.role (name)
VALUES
('Technical Contact'),
('Delivery Manager'),
('Editor');

COMMIT;
