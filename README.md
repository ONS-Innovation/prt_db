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
  - [Local Development](#local-development)
    - [Prerequisites](#prerequisites)
    - [PostgreSQL](#postgresql)
    - [Sqitch](#sqitch)
    - [Setup](#setup)
  - [Linting and Formatting](#linting-and-formatting)
    - [Prerequisites](#prerequisites-1)
    - [Setup](#setup-1)
    - [Usage](#usage)
    - [`.sqlfluff` Configuration](#sqlfluff-configuration)
    - [GitHub Actions](#github-actions)

## Project Structure

This project uses Sqitch for database version control. Sqitch organises database changes (`.sql` files) into changesets. Each set has a deploy, revert and verify script. The changesets are stored in the `./deploy`, `./revert` and `./verify` directories respectively.

## Local Development

### Prerequisites

- [Colima](https://github.com/abiosoft/colima) (Docker daemon)

### PostgreSQL

This project uses a containerised PostgreSQL database for local development. The database is managed using [Docker Compose](https://docs.docker.com/compose/).

Firstly, ensure the Docker daemon is running. If you are using Colima (Recommended), you can start the docker daemon with the following command:

```bash
    colima start
```

To run the database locally, run the following command:

```bash
    docker-compose up
```

This will start the PostgreSQL database in a Docker container. The database will be accessible at `localhost:5432` with the username `postgres` and password `postgres`.

To connect to the PostgreSQL database, you can use any PostgreSQL client. For example, you can use [pgAdmin](https://www.pgadmin.org/) or [DBeaver](https://dbeaver.io/).

To install pgAdmin, you can use the following command:

```bash
    brew install --cask pgadmin4
```

Once pgAdmin is installed, you can open it and create a new connection to the PostgreSQL database. Use the following settings:
- Host: `localhost`
- Port: `5432`
- Username: `postgres`
- Password: `postgres`
Once you have connected to the database, you can run SQL queries and manage the database using pgAdmin.

To stop the database, you can use the following command:

```bash
    docker-compose down
```

or control + c in the terminal where the database is running.

### Sqitch

This project uses [Sqitch](https://sqitch.org/) for database version control. Sqitch is a database change management application that allows you to manage your database schema changes in a version-controlled manner.

To install Sqitch, you can use the following command:

```bash
    brew install sqitch
```

or use a containerised version of Sqitch (Recommended):

```bash
    docker pull sqitch/sqitch
    curl -L https://git.io/JJKCn -o sqitch && chmod +x sqitch
```
*^ This pulls the containerised version of Sqitch and its shell script wrapper.*

and use its shell script wrapper (Included in the repository):

```bash
    ./sqitch help
```

Before using Sqitch, you will need to do some local configuration.

Create the following file, `~/.sqitch/sqitch.conf`, and add the following:

```conf
    [user]
    name = <Full Name>
    email = <ONS Email Address>
```

Filling in the `<Full Name>` and `<ONS Email Address>` with your own details.

### Setup

Before using Sqitch to deploy our database model, we need to create the database within the PostgreSQL container.

To do this, run the following command:

```bash
    docker exec -it postgres psql -U postgres -c "CREATE DATABASE prt_db;"
```
This will create a new database called `prt_db` within the PostgreSQL container.
Once the database is created, you can use Sqitch to deploy the database model.

```bash
    sqitch deploy prt_db
```

This will deploy the database model to the `prt_db` database. Sqitch will create the necessary tables, views, and other database objects as defined in the `deploy` directory.

Once deployed, you can make changes to the model using Sqitch.


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