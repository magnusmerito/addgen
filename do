# Configure Git for commits
git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"

# Run the script FIRST before switching branches
chmod +x generate.sh
./generate.sh

# Ensure index.html was actually created
if [ ! -f index.html ]; then
  echo "Error: index.html was not generated!"
  exit 1
fi

# Move index.html to a temporary location before switching branches
mv index.html /tmp/index.html

# Fetch the gh-pages branch
git fetch origin gh-pages || echo "gh-pages branch does not exist yet."

# Switch to gh-pages (create it if missing)
if git ls-remote --exit-code --heads origin gh-pages; then
  git checkout gh-pages
else
  git checkout --orphan gh-pages
fi

# Restore index.html from temporary storage
mv /tmp/index.html .

# Remove only old index.html

