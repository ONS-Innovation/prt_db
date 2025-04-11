.PHONY: all
all: ## Show the available make targets.
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@fgrep "##" Makefile | fgrep -v fgrep

.PHONY: init
init: ## Initialise the project ready for development
	sh ./shell_scripts/init.sh

.PHONY: start_database
start_database: ## Start the database container.
	docker-compose up -d

.PHONY: stop_database
stop_database: ## Stop the database container without removing the container.
	docker stop postgres

.PHONY: remove_database
remove_database: ## Stop the database, removing the container.
	docker-compose down

.PHONY: install_sqitch
install_sqitch: ## Install sqitch.
	docker pull sqitch/sqitch;
	curl -L https://git.io/JJKCn -o sqitch && chmod +x sqitch;

.PHONY: configure_sqitch
configure_sqitch: ## Configure sqitch (Set name and email in sqitch.conf).
	@read -p "Enter your full name: " name;
	@read -p "Enter your email address (@ons.gov.uk): " email;
	@echo "[user]\nname = $$name\nemail = $$email" > ~/.sqitch/sqitch.conf;
	@echo "Sqitch configured with name: $$name and email: $$email in ~/.sqitch/sqitch.conf";
	@echo "You can check the configuration by running 'cat ~/.sqitch/sqitch.conf'.";

.PHONY: create_database
create_database: ## Create the database (prt_db).
	docker exec -it postgres psql -U postgres -c "CREATE DATABASE prt_db;";

.PHONY: reset_database
reset_database: ## Reset the database (prt_db).
	@echo "Stopping and removing the database container...";
	make remove_database;
	@echo "Creating a new database container...";
	make start_database;
	@echo "Waiting for the database to start...";
	sleep 5; # Wait for the database to start
	@echo "Creating the database (prt_db)...";
	make create_database;
	@echo "Database (prt_db) reset complete.";

.PHONY: install_pgadmin
install_pgadmin: ## Install pgAdmin for PostgreSQL GUI.
	@echo "Installing pgAdmin using Homebrew..."; 
	brew install --cask pgadmin4; 
	@echo "PgAdmin installed. You can find it in your Applications folder."; 
	@echo "Connection instructions for pgAdmin can be found in ./docs/pgadmin_connection_instructions.md."; 

.PHONY: generate_local_docs
generate_local_docs: ## Generate local documentation using SchemaSpy.
	sh ./shell_scripts/generate_schemaspy.sh

.PHONY: deploy_docs
deploy_docs: ## Deploy SchemaSpy documentation to GitHub Pages.
	sh ./shell_scripts/deploy_schemaspy.sh

.PHONY: install_linters
install_linters: ## Install the project's linters
	@echo "Installing SQLFluff...";
	pip install sqlfluff;
	@echo "Installing Markdownlint...";
	brew install markdownlint-cli;
	@echo "Please use 'make sql_lint' or 'make md_lint' to run the respective linters.";

.PHONY: lint
lint: ## Run all linters.
	@echo "Running SQLFluff...";
	make sql_lint;
	@echo "Running Markdownlint...";
	make md_lint;

.PHONY: fix
fix: ## Run all linters and fix issues if possible.
	@echo "Running SQLFluff fix...";
	make sql_fix;
	@echo "Running Markdownlint fix...";
	make md_fix;

.PHONY: sql_lint
sql_lint: ## Lint SQL files using SQLFluff.
	sqlfluff lint .
	@echo "SQLFluff can fix some issues automatically. To fix them, run 'make sql_fix'.";

.PHONY: sql_fix
sql_fix: ## Fix SQL files using SQLFluff.
	sqlfluff fix .

.PHONY: md_lint
md_lint: ## Lint Markdown files using Markdownlint.
	markdownlint .
	@echo "Markdownlint can fix some issues automatically. To fix them, run 'make md_fix'.";

.PHONY: md_fix
md_fix: ## Fix Markdown files using Markdownlint.
	markdownlint --fix .
