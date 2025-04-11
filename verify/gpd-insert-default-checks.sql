-- Verify prt_db:gpd-insert-default-checks on pg

BEGIN;

DO $$
BEGIN
    ASSERT (
        SELECT COUNT(*) = 14
        FROM github_policy.policy_check AS p
        WHERE p.name IN (
            'inactive',
            'unprotected_branches',
            'unsigned_commits',
            'readme_missing',
            'license_missing',
            'pirr_missing',
            'gitignore_missing',
            'external_pr',
            'breaks_naming_convention',
            'secret_scanning_disabled',
            'push_protection_disabled',
            'dependabot_disabled',
            'codeowners_missing',
            'point_of_contact_missing'
        )
    );
END $$;

ROLLBACK;
