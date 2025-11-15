# 🚀 Push to GitHub Guide

This guide will help you push the PR Health Bot to your GitHub repository.

## Repository URL

**Repository**: https://github.com/yksanjo/pr-health-bot.git

## Quick Push Commands

### Initial Setup

```bash
cd pr-health-bot

# Initialize git (if not already done)
git init

# Add remote
git remote add origin https://github.com/yksanjo/pr-health-bot.git

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: PR Health Bot MVP"

# Push to main branch
git branch -M main
git push -u origin main
```

### Subsequent Updates

```bash
# After making changes
git add .
git commit -m "Your commit message"
git push
```

## Pre-Push Checklist

Before pushing, make sure:

- [ ] All files are in place
- [ ] `.gitignore` is configured (excludes `node_modules/`, `dist/`)
- [ ] `package.json` has correct repository URL
- [ ] README.md is up to date
- [ ] LICENSE file is included

## Building Before Push

If you want to include the built files:

```bash
# Install dependencies
npm install

# Build the action
npm run build

# Package for distribution
npm run package

# Then commit and push
git add .
git commit -m "Build and package action"
git push
```

## Testing After Push

1. Go to your repository: https://github.com/yksanjo/pr-health-bot
2. Create a test PR
3. The workflow should run automatically
4. Check the Actions tab to see if it runs successfully

## Creating a Release

To create a versioned release:

```bash
# Tag a version
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

Then users can reference it as:
```yaml
uses: yksanjo/pr-health-bot@v1.0.0
```

## GitHub Marketplace (Optional)

To publish to GitHub Marketplace:

1. Go to your repository Settings
2. Scroll to "Marketplace"
3. Click "Draft a new release"
4. Fill in the release details
5. Check "Publish this Action to the GitHub Marketplace"

---

**Ready to push?** Run the commands above! 🚀

