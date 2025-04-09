-- Revert prt_db:gh-insert-default-organisations from pg

BEGIN;

DELETE FROM gh.organisation AS o
WHERE o.name IN (
    'ONSdigital',
    'ONS-Innovation'
);

COMMIT;
