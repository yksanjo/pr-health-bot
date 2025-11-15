#!/bin/bash

# PR Health Bot - Push to GitHub Script

set -e

echo "🚀 PR Health Bot - Push to GitHub"
echo "=================================="
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "📦 Initializing git repository..."
    git init
fi

# Check if remote exists
if ! git remote | grep -q origin; then
    echo "🔗 Adding remote origin..."
    git remote add origin https://github.com/yksanjo/pr-health-bot.git
else
    echo "✅ Remote origin already exists"
fi

# Check if we're on main branch
CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "")
if [ -z "$CURRENT_BRANCH" ]; then
    echo "🌿 Creating main branch..."
    git checkout -b main
elif [ "$CURRENT_BRANCH" != "main" ]; then
    echo "⚠️  Currently on branch: $CURRENT_BRANCH"
    read -p "Switch to main branch? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git checkout -b main 2>/dev/null || git checkout main
    fi
fi

# Show status
echo ""
echo "📊 Current status:"
git status --short

echo ""
read -p "Continue with commit and push? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Cancelled"
    exit 1
fi

# Add all files
echo ""
echo "📝 Adding files..."
git add .

# Commit
COMMIT_MSG="${1:-Update PR Health Bot}"
echo "💾 Committing: $COMMIT_MSG"
git commit -m "$COMMIT_MSG" || {
    echo "⚠️  No changes to commit"
    exit 0
}

# Push
echo ""
echo "🚀 Pushing to GitHub..."
git push -u origin main

echo ""
echo "✅ Successfully pushed to GitHub!"
echo "🔗 Repository: https://github.com/yksanjo/pr-health-bot"
echo ""
echo "Next steps:"
echo "  1. Visit your repository on GitHub"
echo "  2. Create a test PR to verify the action works"
echo "  3. Check the Actions tab for workflow runs"

