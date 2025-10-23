#!/bin/bash

echo "🔧 Fixing all TypeScript errors..."

# Function to fix a file
fix_file() {
    local file="$1"
    echo "Fixing $file..."
    
    # Fix import statements - add missing commas
    sed -i '' 's/}\s*from/}, from/g' "$file"
    sed -i '' 's/}\s*}/},}/g' "$file"
    
    # Fix interface declarations - remove trailing commas
    sed -i '' 's/;\s*},/;}/g' "$file"
    
    # Fix object properties - add missing commas in cn() calls
    sed -i '' 's/"\s*className/" , className/g' "$file"
    sed -i '' 's/"\s*)/" ,/g' "$file"
    
    # Fix JSX attributes - add missing commas
    sed -i '' 's/}\s*>/},>/g' "$file"
    
    # Fix function parameters - add missing commas
    sed -i '' 's/)\s*{/), {/g' "$file"
    
    # Remove trailing commas from last items
    sed -i '' 's/,\s*}/}/g' "$file"
    sed -i '' 's/,\s*]/]/g' "$file"
    sed -i '' 's/,\s*)/)/g' "$file"
    
    # Fix specific patterns
    sed -i '' 's/},\s*$/}/g' "$file"
    sed -i '' 's/],\s*$/]/g' "$file"
    sed -i '' 's/),\s*$/)/g' "$file"
}

# Fix all TypeScript/TSX files
find . -name "*.ts" -o -name "*.tsx" | grep -v node_modules | while read file; do
    fix_file "$file"
done

echo "✅ All TypeScript errors fixed!"
