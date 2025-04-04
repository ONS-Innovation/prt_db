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
  - [Prerequisites](#prerequisites)
  - [Linting and Formatting](#linting-and-formatting)
    - [Prerequisites](#prerequisites-1)
    - [Setup](#setup)
    - [Usage](#usage)
    - [`.sqlfluff` Configuration](#sqlfluff-configuration)
    - [GitHub Actions](#github-actions)

## Prerequisites

- PostgreSQL 17
- Sqitch
- PgAdmin 4 or equivalent *(Optional)*

## Linting and Formatting

This repository uses [SQLFluff](https://docs.sqlfluff.com/en/stable/index.html) for SQL linting.

For more information on SQLFluff, please refer to their Getting Started guide: [Getting Started with SQLFluff](https://docs.sqlfluff.com/en/stable/gettingstarted.html#).

### Prerequisites

SQLFluff requires both Python and Pip to be installed.

### Setup

Install SQLFluff

```bash
    pip install sqlfluff
```

### Usage

Lint all SQL files:

```bash
    sqlfluff lint .
```

Fix all SQL files:

```bash
    sqlfluff fix .
```

### `.sqlfluff` Configuration

The `.sqlfluff` file in the root of the repository contains the configuration for SQLFluff. This file is used to set the rules and settings for linting and formatting SQL files.

A full list of SQLFluff configuration options can be found in the [SQLFluff documentation](https://docs.sqlfluff.com/en/stable/configuration.html#configuration-options).

### GitHub Actions

This repository uses GitHub Actions to run SQLFluff linting and formatting on every push and pull request. The workflow file is located in the `.github/workflows` directory.

The workflow will run SQLFluff linting and formatting on all SQL files in the repository. If any linting or formatting errors are found, the workflow will fail and provide a report of the errors.