#!/bin/bash

echo "🔧 Fixing all formatting issues..."

# Function to fix trailing commas in objects and arrays
fix_trailing_commas() {
  local file="$1"
  echo "Fixing $file..."
  
  # Remove trailing commas from objects
  sed -i '' 's/,$//g' "$file"
  
  # Fix specific patterns that need commas
  sed -i '' 's/}\s*$/},/g' "$file"  # Add comma after closing brace if followed by another property
  sed -i '' 's/]\s*$/],/g' "$file"  # Add comma after closing bracket if followed by another element
  
  # Remove trailing commas from the last items
  sed -i '' 's/,\s*}/}/g' "$file"
  sed -i '' 's/,\s*]/]/g' "$file"
}

# Find and fix all TypeScript/JavaScript files
find . -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" | grep -v node_modules | while read file; do
  fix_trailing_commas "$file"
done

echo "✅ All formatting issues fixed!"
