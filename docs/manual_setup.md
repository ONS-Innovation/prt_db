# Manual Setup

This document provides a step-by-step guide to setting up the project manually. This includes setting up the PostgreSQL database, Sqitch and any other dependencies.

It is recommended to use the `make init` command to set up the project automatically. This will guide you through the setup process and set up the project for you, rather than manually.

See [Project Setup](../README.md#project-setup) for more information.

## Contents

- [Manual Setup](#manual-setup)
  - [Contents](#contents)
  - [PostgreSQL](#postgresql)
    - [PostgreSQL Client (Optional)](#postgresql-client-optional)
      - [PgAdmin Connection Instructions](#pgadmin-connection-instructions)
  - [Sqitch](#sqitch)
  - [First Time Setup](#first-time-setup)
  - [Resetting the Database](#resetting-the-database)

## PostgreSQL

This project uses a containerised PostgreSQL database for local development. The database is managed using [Docker Compose](https://docs.docker.com/compose/).

Firstly, ensure the Docker daemon is running. If you are using Colima (Recommended), you can start the docker daemon with the following command:

```bash
colima start
```

To run the database locally, run the following command:

```bash
docker-compose up -d
```

This will start the PostgreSQL database in a Docker container. The database will be accessible at `localhost:5432` with the username `postgres` and password `postgres`.

To stop the database, you can use the following command:

```bash
docker-compose down
```

This will stop and remove the PostgreSQL container.

If you want the container to persist after stopping, you can use the following command:

```bash
docker stop postgres
```

### PostgreSQL Client (Optional)

To connect to the PostgreSQL database, you can use any PostgreSQL client. For example, you can use [pgAdmin](https://www.pgadmin.org/)(Recommended) or [DBeaver](https://dbeaver.io/).

To install pgAdmin, you can use the following command:

```bash
brew install --cask pgadmin4
```

#### PgAdmin Connection Instructions

Information about connecting to the PostgreSQL database using pgAdmin can be found in the [pgAdmin connection instructions](./docs/pgadmin_connection_instructions.md) file.

## Sqitch

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

## First Time Setup

When running the PostgreSQL database for the first time, you will need to create a new database for the project. This is done using the `docker exec` command to run a command inside the PostgreSQL container.

To do this, run the following command:

```bash
docker exec -it postgres psql -U postgres -c "CREATE DATABASE prt_db;"
```

This will create a new database called `prt_db` within the PostgreSQL container.
Once the database is created, you can use Sqitch to deploy the database model.

```bash
sqitch deploy prt_db
```

This will deploy the database model to the `prt_db` database. Sqitch will the necessary changes defined in the `deploy` directory in the order specified in `sqitch.plan`.

## Resetting the Database

In order to reset the database, you can use do the following:

```bash
docker-compose down
docker-compose up
```

This will stop and remove the PostgreSQL container and start a new one. The database will be reset to its initial state.

After resetting the database, you will need to follow the [First Time Setup](#first-time-setup) instructions to create the database and deploy the model again.
