echo "---"
echo "This script deploys the SchemaSpy documentation to the gh-pages branch of the repository."
echo "Make sure you have the postgres database running with the latest Sqitch changes deployed before running this script."
read -p "Are you sure you want to continue? (y/n): " confirm

if [[ $confirm != "y" ]]; 
then
    echo "Aborting deployment."
    exit 1
fi

# Create gh-pages branch if it does not exist and change to it
git branch gh-pages
git checkout gh-pages

# Pull the latest changes from the remote gh-pages branch
git pull origin gh-pages

# Remove all files in the current directory
# This will ensure that only the SchemaSpy documentation is present in the gh-pages branch
rm -rf *

# Build the SchemaSpy documentation
docker run --rm -it -v "$(pwd)/":/output  --network host schemaspy/schemaspy:latest -t pgsql -db prt_db -host localhost -u postgres -p postgres -schemas tech_audit,digital_landscape,github_scraper,github_copilot,github_policy,dbo

# Stage the changes, commit, and push to the gh-pages branch
git add .
git commit -m "update SchemaSpy Documentation"
git push origin gh-pages

# Switch back to the main branch and delete the local gh-pages branch
git checkout main
git branch -D gh-pages

# Reset to match the remote main branch
git fetch origin
git reset --hard origin/main