#!/bin/bash

echo "🔧 Fixing TypeScript errors..."

# Fix import statements - add missing commas
find . -name "*.ts" -o -name "*.tsx" | grep -v node_modules | xargs sed -i '' 's/}\s*from/}, from/g'
find . -name "*.ts" -o -name "*.tsx" | grep -v node_modules | xargs sed -i '' 's/}\s*}/},}/g'

# Fix interface declarations - remove trailing commas
find . -name "*.ts" -o -name "*.tsx" | grep -v node_modules | xargs sed -i '' 's/;\s*},/;}/g'

# Fix object properties - add missing commas
find . -name "*.ts" -o -name "*.tsx" | grep -v node_modules | xargs sed -i '' 's/}\s*$/},/g'
find . -name "*.ts" -o -name "*.tsx" | grep -v node_modules | xargs sed -i '' 's/]\s*$/],/g'

# Fix function parameters - add missing commas
find . -name "*.ts" -o -name "*.tsx" | grep -v node_modules | xargs sed -i '' 's/)\s*{/), {/g'

# Fix JSX attributes - add missing commas
find . -name "*.ts" -o -name "*.tsx" | grep -v node_modules | xargs sed -i '' 's/}\s*>/},>/g'

# Remove trailing commas from last items in objects/arrays
find . -name "*.ts" -o -name "*.tsx" | grep -v node_modules | xargs sed -i '' 's/,\s*}/}/g'
find . -name "*.ts" -o -name "*.tsx" | grep -v node_modules | xargs sed -i '' 's/,\s*]/]/g'

echo "✅ TypeScript errors fixed!"
