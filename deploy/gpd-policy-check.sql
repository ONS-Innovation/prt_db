-- Deploy prt_db:gpd-policy-check to pg
-- requires: gpd-schema

BEGIN;

CREATE TABLE gpd.policy_check (
    check_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(255) NOT NULL,
    is_security_rule BOOLEAN NOT NULL,
    is_policy_rule BOOLEAN NOT NULL
);

COMMIT;
