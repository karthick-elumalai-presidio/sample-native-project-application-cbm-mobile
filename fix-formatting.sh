#!/bin/bash

# Fix Prettier formatting issues
# This script will fix all the quote and formatting issues

echo "🔧 Fixing Prettier formatting issues..."

# Check if we have the right tools
if command -v npx &> /dev/null; then
    echo "📦 Using npx to run prettier..."
    npx prettier --write "**/*.{js,jsx,ts,tsx,json,css}" --config utils/prettier.config.js
elif command -v npm &> /dev/null; then
    echo "📦 Using npm to run prettier..."
    npm run format
else
    echo "❌ Neither npx nor npm found. Please install Node.js first."
    exit 1
fi

echo "✅ Formatting fixes applied!"
echo ""
echo "🧪 Testing the fixes..."
echo "Running lint check..."

if command -v npx &> /dev/null; then
    npx eslint "**/*.{js,jsx,ts,tsx,css}" --fix
elif command -v npm &> /dev/null; then
    npm run lint
fi

echo "✅ All formatting issues should now be resolved!"
