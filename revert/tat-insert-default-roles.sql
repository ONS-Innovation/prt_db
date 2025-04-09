-- Revert prt_db:tat-insert-default-roles from pg

BEGIN;

DELETE FROM tat.role AS r
WHERE r.name IN (
    'Technical Contact',
    'Delivery Manager',
    'Editor'
);

COMMIT;
