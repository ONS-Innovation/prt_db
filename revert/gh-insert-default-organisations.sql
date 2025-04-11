-- Revert prt_db:gh-insert-default-organisations from pg

BEGIN;

DELETE FROM github_scraper.organisation AS o
WHERE o.name IN (
    'ONSdigital',
    'ONS-Innovation'
);

COMMIT;
