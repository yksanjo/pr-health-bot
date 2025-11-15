# 🚀 Quick Start Guide

Get PR Health Bot running in your repository in under 5 minutes!

## Step 1: Copy the Workflow

Create `.github/workflows/pr-health.yml` in your repository root:

```yaml
name: PR Health Check

on:
  pull_request:
    types: [opened, synchronize, reopened]

jobs:
  pr-health:
    runs-on: ubuntu-latest
    permissions:
      issues: write
      pull-requests: read
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Build action
        run: npm run build
      
      - name: Run PR Health Bot
        uses: ./
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
```

## Step 2: Copy the Action Files

Copy the entire `pr-health-bot` directory to your repository, or:

1. Copy `src/index.ts` → `src/index.ts`
2. Copy `action.yml` → `action.yml`
3. Copy `package.json` → `package.json`
4. Copy `tsconfig.json` → `tsconfig.json`

## Step 3: Install Dependencies

```bash
npm install
```

## Step 4: Test It!

1. Create a test PR in your repository
2. The bot will automatically comment with a health check
3. Update the PR and watch the comment update automatically

## 🎉 That's It!

The bot will now automatically comment on every PR with:
- ✅ PR size analysis
- ✅ Description check
- ✅ Test file detection

## Troubleshooting

### Bot doesn't comment

- Check that the workflow file is in `.github/workflows/`
- Verify the workflow ran in the Actions tab
- Ensure `GITHUB_TOKEN` has `issues: write` permission

### Build errors

- Make sure Node.js 20+ is installed
- Run `npm install` to install dependencies
- Check that TypeScript is installed: `npm install -g typescript` (or use npx)

### Want to customize?

Edit `src/index.ts` to adjust:
- Size thresholds (currently 200/400 lines)
- Test file patterns
- Comment formatting

---

**Need help?** Open an issue or check the main [README.md](README.md)

