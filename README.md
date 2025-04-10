# Projects, Repositories and Technologies Database (prt_db)

A PostgreSQL database used to store Projects, Repositories and Technologies within ONS. This database integrates with various KEH tools.

Integrated tools include:

- [Tech Audit Tool](https://github.com/ONS-Innovation/keh-tech-audit-tool)
- [Digital Landscape](https://github.com/ONS-Innovation/keh-digital-landscape)
- [GitHub Scraper](https://github.com/ONS-Innovation/keh-github-scraper-batch)
- [GitHub Copilot Dashboard](https://github.com/ONS-Innovation/github-copilot-usage-dashboard/tree/master)
- [GitHub Policy Dashboard](https://github.com/ONS-Innovation/github-policy-dashboard)

## Contents

- [Projects, Repositories and Technologies Database (prt\_db)](#projects-repositories-and-technologies-database-prt_db)
  - [Contents](#contents)
  - [Project Structure](#project-structure)
  - [Database Structure](#database-structure)
  - [Local Development](#local-development)
    - [Contributing](#contributing)
    - [Development Prerequisites](#development-prerequisites)
    - [Makefile](#makefile)
      - [Project Setup](#project-setup)
    - [Manual Project Setup](#manual-project-setup)
  - [Documentation](#documentation)
    - [`./docs`](#docs)
    - [SchemaSpy](#schemaspy)
      - [Deploy SchemaSpy Docuementation to GitHub Pages](#deploy-schemaspy-docuementation-to-github-pages)
        - [SchemaSpy Deployment Prerequisites](#schemaspy-deployment-prerequisites)
        - [SchemaSpy Deployment](#schemaspy-deployment)
        - [Updating the Documented Schemas](#updating-the-documented-schemas)
  - [Linting and Formatting](#linting-and-formatting)
    - [SQLFluff](#sqlfluff)
      - [SQLFluff Prerequisites](#sqlfluff-prerequisites)
      - [SQLFluff Setup](#sqlfluff-setup)
      - [SQLFluff Usage](#sqlfluff-usage)
      - [`.sqlfluff` Configuration](#sqlfluff-configuration)
      - [SQLFluff GitHub Action](#sqlfluff-github-action)
    - [Markdownlint-cli](#markdownlint-cli)
      - [Markdownlint Prerequisites](#markdownlint-prerequisites)
      - [Markdownlint Setup](#markdownlint-setup)
      - [Markdownlint Usage](#markdownlint-usage)
      - [`.markdownlint.json` Configuration](#markdownlintjson-configuration)
      - [Markdownlint GitHub Action](#markdownlint-github-action)
  - [License](#license)

## Project Structure

This project uses Sqitch for database version control. Sqitch organises database changes (`.sql` files) into changesets. Each set has a deploy, revert and verify script. The changesets are stored in the `./deploy`, `./revert` and `./verify` directories respectively.

## Database Structure

Documentation about the database structure can be found in the [database_structure.md](./docs/database_structure.md) file.

## Local Development

### Contributing

Contributions to this project are welcome. Please read the [CONTRIBUTING](./.github/CONTRIBUTING.md) file for more information on how to contribute and the standards we expect.

### Development Prerequisites

- [Colima](https://github.com/abiosoft/colima) (Docker daemon)
- [Docker](https://www.docker.com/) (Docker CLI)
- [Docker Compose](https://docs.docker.com/compose/) (Docker CLI)

### Makefile

This project uses a Makefile to run common commands easily. To see all available commands, run the following command:

```bash
make all
```

#### Project Setup

Before continuing please ensure that you have a docker daemon running. You can do this by running the following command:

```bash
colima start
```

To easily set up the project, use the following make command:

```bash
make init
```

This will guide you through the setup process and set up the project for you. This includes setting up the PostgreSQL database, Sqitch and any other dependencies.

Once complete, you can run the following command to start the PostgreSQL database:

```bash
make start_database
```

### Manual Project Setup

If you prefer to set up the project manually, you can follow the in [./docs/manual_setup.md](./docs/manual_setup.md) file. This file contains a step-by-step guide to setting up the project manually.

Using the automated setup is recommended, as it will save you time and ensure that everything is set up correctly. See [Project Setup](#project-setup).

## Documentation

### `./docs`

This directory contains any manual documentation for the project.

[`./docs`](./docs)

### SchemaSpy

This project uses SchemaSpy to create database documentation.

To generate the database documentation locally, you can use the following command:

```bash
make generate_local_docs
```

or,

```bash
docker run --rm -it -v "$(pwd)/schemaspy":/output  --network host schemaspy/schemaspy:latest -t pgsql -db prt_db -host localhost -u postgres -p postgres -all
```

**Please Note:** Sometimes this command will error with `Error response from daemon: error while creating mount source path '.../prt_db/schemaspy': chown .../prt_db/schemaspy: permission denied.` If this happens, rerun the command and it should work.

This command will run SchemaSpy in a Docker container and generate the database documentation for the `prt_db` database. The documentation will be saved in the `schemaspy` directory.

[./schemaspy](./schemaspy)

To view the documentation, open the `index.html` file in the `schemaspy` directory in your web browser.

The above will generate documentation for all schemas in the database (`-all`). To generate documentation for a specific list schema, replace `-all` with `-schemas <schema1>,<schema2>,...`.

For example, to generate documentation for the `tat` and `dl` schemas, you can use the following command:

```bash
docker run --rm -it -v "$(pwd)/schemaspy":/output  --network host schemaspy/schemaspy:latest -t pgsql -db prt_db -host localhost -u postgres -p postgres -schemas tat,dl
```

#### Deploy SchemaSpy Docuementation to GitHub Pages

##### SchemaSpy Deployment Prerequisites

- Ensure that you are on the `main` branch of the repository.
- Ensure that there are no uncommitted changes in the repository (The script will remove them).
- Ensure that the database is running and the Sqitch changes fully deployed (See [Local Development](#local-development)).

##### SchemaSpy Deployment

To deploy the SchemaSpy documentation to GitHub Pages, you can use the following command:

```bash
make deploy_docs
```

or, if you prefer to run the deployment script directly:

```bash
sh deploy_schemaspy.sh
```

This shell script will build the SchemaSpy documentation onto an empty branch called `gh-pages`. This branch is used to host the documentation on GitHub Pages.

Once the script pushes the branch to GitHub, GitHub Pages will automatically build the documentation from the `gh-pages` branch.

##### Updating the Documented Schemas

Currently, the script only creates documentation for the following database schemas:

- .tat
- .dl
- .gh
- .gcp
- .gpd
- .dbo

If more schemas are added to the database, the script will need to be updated to include them.

## Linting and Formatting

To install the project's linters and formatters, run the following command:

```bash
make install_linters
```

This will install all the linters and formatters used in the project. The linters and formatters used in this project are:

- [SQLFluff](https://docs.sqlfluff.com/en/stable/index.html) - SQL linter and formatter
- [Markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli) - Markdown linter and formatter

To run all linters and formatters, run the following command:

```bash
make lint
```

To apply autofixes, run the following command:

```bash
make fix
```

This will run all the linters and formatters and apply any autofixes that are available.

More information about each linter/formatter can be found in the sections below.

### SQLFluff

This repository uses [SQLFluff](https://docs.sqlfluff.com/en/stable/index.html) for SQL linting.

For more information on SQLFluff, please refer to their Getting Started guide: [Getting Started with SQLFluff](https://docs.sqlfluff.com/en/stable/gettingstarted.html#).

#### SQLFluff Prerequisites

SQLFluff requires both Python and Pip to be installed.

#### SQLFluff Setup

Install SQLFluff

```bash
pip install sqlfluff
```

#### SQLFluff Usage

Lint all SQL files:

```bash
make sql_lint
```

or

```bash
sqlfluff lint .
```

Fix all SQL files:

```bash
make sql_fix
```

or

```bash
sqlfluff fix .
```

#### `.sqlfluff` Configuration

The `.sqlfluff` file in the root of the repository contains the configuration for SQLFluff. This file is used to set the rules and settings for linting and formatting SQL files.

A full list of SQLFluff configuration options can be found in the [SQLFluff documentation](https://docs.sqlfluff.com/en/stable/configuration.html#configuration-options).

#### SQLFluff GitHub Action

This repository uses GitHub Actions to run SQLFluff linting and formatting on every push and pull request. The workflow file is located in the `.github/workflows` directory.

The workflow will run SQLFluff linting and formatting on all SQL files in the repository. If any linting or formatting errors are found, the workflow will fail and provide a report of the errors.

### Markdownlint-cli

This repository uses [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli) to lint markdown files.

Markdownlint-cli is a command line interface for [MarkdownLint](https://github.com/DavidAnson/markdownlint).

#### Markdownlint Prerequisites

Markdownlint-cli requires Homebrew to be installed.

#### Markdownlint Setup

Run Markdownlint-cli in a container:

```bash
docker run -v $PWD:/workdir ghcr.io/igorshubovych/markdownlint-cli:latest "*.md"
```

or install Markdownlint-cli locally:

```bash
brew install markdownlint-cli
```

#### Markdownlint Usage

Lint all markdown files:

```bash
make md_lint
```

or

```bash
markdownlint .
```

Fix all markdown files:

```bash
make md_fix
```

or

```bash
markdownlint --fix .
```

#### `.markdownlint.json` Configuration

The `.markdownlint.json` file in the root of the repository contains the configuration for markdownlint. This file is used to set the rules and settings for linting markdown files.

Currently, MD013 (line length) is disabled. This is because the default line length of 80 characters is too restrictive.

For a full list of rules, see [Markdownlint Rules / Aliases](https://github.com/DavidAnson/markdownlint?tab=readme-ov-file#rules--aliases)

#### Markdownlint GitHub Action

This repository uses GitHub Actions to run markdownlint on every push and pull request. The workflow file is located in the `.github/workflows` directory.

The workflow will run markdownlint on all markdown files in the repository. If any linting errors are found, the workflow will fail and provide a report of the errors.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
