-- Deploy prt_db:gpd-insert-default-checks to pg
-- requires: gpd-schema
-- requires: gpd-policy-check

BEGIN;

INSERT INTO gpd.policy_check (name, description, is_security_rule, is_policy_rule)
VALUES
('inactive', 'The repository has not been updated in the last year.', TRUE, TRUE),
('unprotected_branches', 'The repository has unprotected branches.', TRUE, TRUE),
('unsigned_commits', 'One of the last 15 commits to this repository is unsigned.', TRUE, TRUE),
('readme_missing', 'The repository does not have a README file.', FALSE, TRUE),
('license_missing', 'The repository does not have a LICENSE file (Public Only).', FALSE, TRUE),
('pirr_missing', 'The repository does not have a PIRR file (Private/Internal Only).', TRUE, TRUE),
('gitignore_missing', 'The repository does not have a .gitignore file.', FALSE, TRUE),
('external_pr', 'The repository has a pull request from a user which isn''t a member of the organisation.', TRUE, FALSE),
('breaks_naming_convention', 'The repository name does not follow ONS naming convention (No Capitals, Special Characters or Spaces).', FALSE, TRUE),
('secret_scanning_disabled', 'The repository does not have secret scanning enabled (Public Only due to GitHub Advanced Security).', TRUE, TRUE),
('push_protection_disabled', 'The repository does not have push protection enabled.', TRUE, TRUE),
('dependabot_disabled', 'The repository does not have dependabot enabled.', TRUE, TRUE),
('codeowners_missing', 'The repository does not have a CODEOWNERS file.', FALSE, TRUE),
('point_of_contact_missing', 'A contact email address cannot be found from the CODEOWNERS file.', TRUE, TRUE);

COMMIT;
