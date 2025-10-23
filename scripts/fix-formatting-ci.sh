#!/bin/bash

# Fix formatting issues in CI environment
echo "🔧 Fixing formatting issues in CI..."

# Install dependencies first
echo "📦 Installing dependencies..."
npm install

# Run prettier to fix formatting
echo "🎨 Running Prettier to fix formatting..."
npx prettier --write "**/*.{js,jsx,ts,tsx,json,css}" || echo "Prettier completed with some issues"

# Run ESLint with --fix to auto-fix issues
echo "🔍 Running ESLint with auto-fix..."
npx eslint "**/*.{js,jsx,ts,tsx,css}" --fix || echo "ESLint completed with some issues"

echo "✅ Formatting fixes applied!"
