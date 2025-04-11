# Using Sqitch

This document provides a brief overview of how to use Sqitch for database version control. It covers the basic commands and workflows to manage your database changes effectively.

Sqitch's documentation is available at [sqitch.org/docs](https://sqitch.org/docs/).

It is recommended to follow [Sqitch's PostgreSQL tutorial](https://sqitch.org/docs/manual/sqitchtutorial/) if you are unfamiliar using Sqitch with PostgreSQL. This will give you a good understanding of how to use Sqitch effectively.

## Contents

- [Using Sqitch](#using-sqitch)
  - [Contents](#contents)
  - [Getting Started](#getting-started)
  - [Sqitch Overview](#sqitch-overview)
  - [Basic Commands](#basic-commands)
    - [Before You Start](#before-you-start)
    - [Deploying Changes](#deploying-changes)
    - [Reverting Changes](#reverting-changes)
    - [Verifying Changes](#verifying-changes)
    - [Checking the Status of the Database](#checking-the-status-of-the-database)
    - [Viewing the Change Log](#viewing-the-change-log)
    - [Adding New Changes](#adding-new-changes)
    - [Editing Existing Changes](#editing-existing-changes)
    - [Tagging and Distrubution](#tagging-and-distrubution)
      - [Tag](#tag)
      - [Bundle](#bundle)


## Getting Started

Before using Sqitch, ensure you have it installed and configured for the project. Instructions on Project Setup, including sqitch can be found in the [README](../README.md#project-setup).

## Sqitch Overview

Sqitch organises changes into deployments, which are then applied to the database in order. Each change is tracked and documented with `sqitch.plan`. Similarly to a Git Log, the `sqitch.plan` file contains a list of changes that can be applied to a database, with a name for each change, the changes dependencies and a description of the change.

Each change creates 3 SQL files:

- A deploy script within the `deploy` directory.
- A revert script within the `revert` directory.
- A verify script within the `verify` directory.

These scripts are used to apply, revert, and verify the changes made to the database.

## Basic Commands

### Before You Start

When installing Sqitch via the repository's Makefile (`make install_sqitch`), the repository will use Sqitch within a docker container, using a shell wrapper to run commands.

When using the wrapper, you can run the following command to see the available options:

```bash
./sqitch help
```

If Sqitch is installed via the system package manager (Homebrew on OSX), you can run the following command to see the available options:

```bash
sqitch help
```

When using Sqitch for the first time, you will need to configure a name and email address for the commits. This can be done using the following command:

```bash
make configure_sqitch
```

This will prompt you for your name and email address, which will be used for the commits.

A manual guide is available within our [manual setup](./manual_setup.md#sqitch) documentation for Sqitch.

### Deploying Changes

To deploy changes to the database, you can use the following command:

```bash
./sqitch deploy
```

This will apply all changes within `sqitch.plan` to the database. 

Further documentation is available at [Sqitch Deploy](https://sqitch.org/docs/manual/sqitch-deploy/).

### Reverting Changes

To revert changes, you can use the following command:

```bash
./sqitch revert
```

This will revert all changes in the `sqitch.plan` file. 

You can also specify the number of changes to revert using `@HEAD`:

```bash
./sqitch revert @HEAD^
```

This will revert the last change in the `sqitch.plan` file.

If you want to revert the last 3 changes, you would add 3 `^` symbols:

```bash
./sqitch revert @HEAD^^^
```

Further documentation is available at [Sqitch Revert](https://sqitch.org/docs/manual/sqitch-revert/).

### Verifying Changes

To verify changes, you can use the following command:

```bash
./sqitch verify
```

This will verify all changes in the `sqitch.plan` file.

Further documentation is available at [Sqitch Verify](https://sqitch.org/docs/manual/sqitch-verify/).

### Checking the Status of the Database

To check Sqitch's current deployment status, you can use the following command:

```bash
./sqitch status
```

This will show the current status of the database, including the current version and any pending changes.

Further documentation is available at [Sqitch Status](https://sqitch.org/docs/manual/sqitch-status/).

### Viewing the Change Log

To view the change log, you can use the following command:

```bash
./sqitch log
```

This will show the change log for the database, showing who has made changes and when.

Further documentation is available at [Sqitch Log](https://sqitch.org/docs/manual/sqitch-log/).

### Adding New Changes

To add new changes, you can use the following command:

```bash
./sqitch add <change_name> -n <change_description>
```

This will create a new change within `sqitch.plan` with the specified name and description. After running this command, you will need to edit the deploy, revert, and verify scripts to add the necessary SQL commands for the change.

You can also specify dependencies for the change using the `--require` option:

```bash
./sqitch add <change_name> -n <change_description> --require <dependency_name>
```

This will create a new change with the specified name and description, and add the specified dependency to the change, ensuring that dependent changes are made before the new one.

Further documentation is available at [Sqitch Add](https://sqitch.org/docs/manual/sqitch-add/).

### Editing Existing Changes

**DO NOT EDIT EXISTING SQL CHANGES AS SQITCH WILL NOT RECOGNISE THEM**

If you want to edit an existing change, you need to make a new Sqitch change which applies the appropriate update.

For example, if adding a column to a database table, you would create a new change which adds the column to the table, and then create a revert change which removes the column from the table.

````bash
./sqitch add new_column --require create_table -n "Add new column to table"
````

**deploy.sql**

```sql
ALTER TABLE table_name ADD COLUMN new_column_name data_type;
```
**revert.sql**

```sql
ALTER TABLE table_name DROP COLUMN new_column_name;
```

**verify.sql**

```sql
SELECT new_column_name FROM table_name WHERE FALSE;
```

You can also use `./sqitch rework` to edit existing changes. This is only recommended for idempotent changes, such as `CREATE OR REPLACE FUNCTION`.
For more information on `rework`, see the [Sqitch Rework](https://sqitch.org/docs/manual/sqitch-rework/) documentation.

The safest bet is to create a new change which applies the appropriate update via SQL.

### Tagging and Distrubution

#### Tag

When changes are made to the database, it is recommended to tag the changes before releasing them. This can be done using the following command:

```bash
./sqitch tag <tag_name> -n "<tag_description>"
```

When naming tags, it is recommended to use [Semantic Versioning](https://semver.org/) which uses the following format:

vMAJOR.MINOR.PATCH

Where:
- MAJOR: Major version number, incremented for incompatible changes.
- MINOR: Minor version number, incremented for new features that are backwards compatible.
- PATCH: Patch version number, incremented for backwards compatible bug fixes.

#### Bundle

To bundle up a sqitch project for distribution, you can use the following command:

```bash
./sqitch bundle
```

This will create a `bundle` directory containing the necessary files for distribution. The bundle will contain:
- The `sqitch.plan` file.
- The `sqitch.conf` file.
- And all the necessary SQL files for the changes.

The directory can then be packaged for distribution (i.e. zipped).

**Please Note:** The deployment process of the database is currently undefined. This will be changed in the future as `./sqitch bundle` may not be used by users.