-- Revert prt_db:tat-insert-default-roles from pg

BEGIN;

DELETE FROM tech_audit.role AS r
WHERE r.name IN (
    'Technical Contact',
    'Delivery Manager',
    'Editor'
);

COMMIT;
