echo "This command will setup the project for development."
echo "This includes:"
echo "1. Creating a PostgreSQL docker container for the database."
echo "2. Initialising and configuring Sqitch for database change management."
echo "3. Creating a database (prt_db) for the project."
echo "4. Deploying Sqitch changes to the database (Optional)."
echo "5. Installing pgAdmin for PostgreSQL GUI (Optional)."
echo "---"

read -p "Do you want to continue? (y/n): " CONTINUE

if [[ "$CONTINUE" != "y" ]]; then
    echo "Project setup cancelled..."
    exit 0
fi

echo "---"
echo "Creating PostgreSQL docker container..."
make start_database
echo "PostgreSQL docker container created and running."
echo "---"
echo "Initialising Sqitch..."
make install_sqitch
echo "Sqitch installed. Run ./sqitch to use it or ./sqitch help to see available commands."
echo "---"
read -p "Do you want to configure Sqitch? (y/n): " CONFIGURE_SQITCH
if [[ "$CONFIGURE_SQITCH" == "y" ]]; then
    echo "Configuring Sqitch..."
    make configure_sqitch
    echo "Sqitch configured."
else
    echo "Sqitch configuration skipped. You can configure it later by running 'make configure_sqitch'."
fi
echo "---"
echo "Creating database (prt_db)..."
make create_database
echo "Database (prt_db) created."
echo "---"
read -p "Do you want to deploy Sqitch changes to the database? (y/n): " DEPLOY_SQITCH
if [[ "$DEPLOY_SQITCH" == "y" ]]; then
    echo "Deploying Sqitch changes to the database..."
    ./sqitch deploy
    echo "Sqitch changes deployed."
else
    echo "Sqitch changes deployment skipped. You can deploy them later by running './sqitch deploy'."
fi
echo "---"
read -p "Do you want to install pgAdmin for PostgreSQL GUI? (y/n): " INSTALL_PGADMIN
if [[ "$INSTALL_PGADMIN" == "y" ]]; then
    make install_pgadmin
else
    echo "pgAdmin installation skipped. You can install it later by running 'make install_pgadmin'."
fi
echo "---"
echo "Cleaning up..."
echo "Stopping PostgreSQL docker container..."
make stop_database
echo "PostgreSQL docker container stopped."
echo "Project setup completed."
echo "You can start the database again by running 'make start_database'."