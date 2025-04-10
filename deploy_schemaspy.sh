# Create gh-pages branch if it does not exist and change to it
git branch gh-pages
git checkout gh-pages

# Remove all files in the current directory
# This will ensure that only the SchemaSpy documentation is present in the gh-pages branch
rm -rf *

# Build the SchemaSpy documentation
docker run --rm -it -v "$(pwd)/":/output  --network host schemaspy/schemaspy:latest -t pgsql -db prt_db -host localhost -u postgres -p postgres -schemas tat,dl,gh,gcp,gpd,dbo

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