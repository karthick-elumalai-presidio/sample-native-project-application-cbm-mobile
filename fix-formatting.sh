#!/bin/bash

# Fix formatting issues automatically
echo "🔧 Fixing formatting issues..."

# Remove trailing commas from object properties
find . -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" | grep -v node_modules | xargs sed -i '' 's/,$//g'

# Fix specific formatting patterns
find . -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" | grep -v node_modules | xargs sed -i '' 's/,\s*}/}/g'
find . -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" | grep -v node_modules | xargs sed -i '' 's/,\s*]/]/g'

echo "✅ Formatting fixes applied!"