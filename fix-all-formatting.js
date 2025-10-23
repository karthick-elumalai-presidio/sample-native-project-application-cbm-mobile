#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

// Function to fix quotes in a file
function fixQuotesInFile(filePath) {
  try {
    let content = fs.readFileSync(filePath, 'utf8');
    
    // Fix single quotes to double quotes in imports and strings
    content = content.replace(/'([^']*)'/g, (match, p1) => {
      // Don't change quotes inside template literals or already escaped quotes
      if (match.includes('`') || match.includes('\\')) {
        return match;
      }
      return `"${p1}"`;
    });
    
    // Fix specific patterns that are common issues
    content = content.replace(/'expo-router'/g, '"expo-router"');
    content = content.replace(/'react-native'/g, '"react-native"');
    content = content.replace(/'react'/g, '"react"');
    content = content.replace(/'@\//g, '"@/');
    content = content.replace(/'expo-/g, '"expo-');
    content = content.replace(/'@react-/g, '"@react-');
    content = content.replace(/'@tanstack/g, '"@tanstack');
    content = content.replace(/'@rn-primitives/g, '"@rn-primitives');
    content = content.replace(/'class-variance-authority'/g, '"class-variance-authority"');
    content = content.replace(/'tailwind-merge'/g, '"tailwind-merge"');
    content = content.replace(/'clsx'/g, '"clsx"');
    content = content.replace(/'nativewind'/g, '"nativewind"');
    content = content.replace(/'i18next'/g, '"i18next"');
    content = content.replace(/'react-i18next'/g, '"react-i18next"');
    content = content.replace(/'expo-localization'/g, '"expo-localization"');
    content = content.replace(/'axios'/g, '"axios"');
    content = content.replace(/'react-native-safe-area-context'/g, '"react-native-safe-area-context"');
    content = content.replace(/'expo-linear-gradient'/g, '"expo-linear-gradient"');
    content = content.replace(/'react-native-worklets/g, '"react-native-worklets');
    content = content.replace(/'eslint-config-expo/g, '"eslint-config-expo');
    content = content.replace(/'@tanstack\/eslint-plugin-query'/g, '"@tanstack/eslint-plugin-query"');
    content = content.replace(/'eslint-plugin-prettier/g, '"eslint-plugin-prettier');
    content = content.replace(/'prettier-plugin-tailwindcss'/g, '"prettier-plugin-tailwindcss"');
    content = content.replace(/'tailwindcss-animate'/g, '"tailwindcss-animate"');
    
    // Fix specific string literals
    content = content.replace(/'Oops!'/g, '"Oops!"');
    content = content.replace(/'This screen doesn\'t exist\.'/g, '"This screen doesn\'t exist."');
    content = content.replace(/'Go to home screen!'/g, '"Go to home screen!"');
    content = content.replace(/'Error Boundary caught:'/g, '"Error Boundary caught:"');
    content = content.replace(/'Try Again'/g, '"Try Again"');
    content = content.replace(/'useTheme must be used within ThemeProvider'/g, '"useTheme must be used within ThemeProvider"');
    content = content.replace(/'API_BASE_URL is not defined in environment variables'/g, '"API_BASE_URL is not defined in environment variables"');
    content = content.replace(/'/account\/index\/login'/g, '"/account/index/login"');
    content = content.replace(/'Content-Type': 'application\/json'/g, '"Content-Type": "application/json"');
    content = content.replace(/'welcomeToApp'/g, '"welcomeToApp"');
    content = content.replace(/'Switch to Light Mode': 'Switch to Dark Mode'/g, '"Switch to Light Mode": "Switch to Dark Mode"');
    
    // Fix color values
    content = content.replace(/'#[A-Fa-f0-9]{6}'/g, (match) => `"${match.slice(1, -1)}"`);
    content = content.replace(/'#[A-Fa-f0-9]{3}'/g, (match) => `"${match.slice(1, -1)}"`);
    
    // Fix CSS class names and other string literals
    content = content.replace(/'flex flex-1 bg-white'/g, '"flex flex-1 bg-white"');
    content = content.replace(/'text-xl font-bold'/g, '"text-xl font-bold"');
    content = content.replace(/'mt-4 pt-4'/g, '"mt-4 pt-4"');
    content = content.replace(/'text-base text-\[#2e78b7\]'/g, '"text-base text-[#2e78b7]"');
    
    // Fix theme values
    content = content.replace(/'light' \| 'dark'/g, '"light" | "dark"');
    content = content.replace(/'light'/g, '"light"');
    content = content.replace(/'dark'/g, '"dark"');
    content = content.replace(/'default'/g, '"default"');
    
    // Fix specific patterns in different files
    content = content.replace(/'dist\/\*'/g, '"dist/*"');
    content = content.replace(/'react\/display-name': 'off'/g, '"react/display-name": "off"');
    content = content.replace(/'@tanstack\/query\/exhaustive-deps': 'error'/g, '"@tanstack/query/exhaustive-deps": "error"');
    content = content.replace(/'@tanstack\/query'/g, '"@tanstack/query"');
    
    fs.writeFileSync(filePath, content);
    console.log(`✅ Fixed quotes in ${filePath}`);
  } catch (error) {
    console.error(`❌ Error fixing ${filePath}:`, error.message);
  }
}

// Function to recursively find and fix files
function fixAllFiles(dir) {
  const files = fs.readdirSync(dir);
  
  files.forEach(file => {
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);
    
    if (stat.isDirectory() && !file.startsWith('.') && file !== 'node_modules') {
      fixAllFiles(filePath);
    } else if (file.match(/\.(js|jsx|ts|tsx)$/)) {
      fixQuotesInFile(filePath);
    }
  });
}

console.log('🔧 Fixing all formatting issues...');
console.log('================================');

// Fix all TypeScript/JavaScript files
fixAllFiles('.');

console.log('');
console.log('✅ All formatting issues have been fixed!');
console.log('');
console.log('🧪 Next steps:');
console.log('1. Run: npm run format (or bun run format)');
console.log('2. Run: npm run lint (or bun run lint)');
console.log('3. Commit your changes');
console.log('4. Push to trigger GitHub Actions');
