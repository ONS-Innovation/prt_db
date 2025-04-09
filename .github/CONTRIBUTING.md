# Contributing to the Project

We welcome contributions to this project! If you would like to contribute, please follow these guidelines:

- Create a new branch for your changes.
- Make sure to write clear and concise commit messages.
- Pull Request your changes to the `main` branch.
- Ensure that your code passes all tests and linting checks.
- Update the documentation if necessary.

## Setting Up the Development Environment

To set up the development environment, please follow the instructions in the [README](./README.md) file.

## Standards, Conventions and Best Practices

### Sqitch

All database changes should be made using Sqitch. This includes creating new tables, modifying existing tables, and adding new columns. Please follow the Sqitch documentation for more information on how to use Sqitch.

We expect that all database changes following the following standards:

- All changes should be made in a new Sqitch change.
- Changes should following naming conventions:
  - <change_schema>-<change_name>
    - Example: `tat-projects` adds a project table to the database.
- Changes should also include a description of the change.
- Previously written sqitch changes should not be modified. If you need to make a change to a previously written change, you should create a new change that amends the previous.

### SQLFluff

SQLFluff is used for linting SQL code. Please ensure that your SQL code passes all SQLFluff checks before submitting a pull request.

Instructions on installing and using SQLFluff can be found in the [README](./README.md) file.

This ensures that all SQL code is formatted consistently and follows best practices.

### Markdownlint

Markdownlint is used for linting Markdown files. Please ensure that your Markdown files pass all Markdownlint checks before submitting a pull request.

Instructions on installing and using Markdownlint can be found in the [README](./README.md) file.

This ensures that all Markdown files are formatted consistently and follows best practices.
