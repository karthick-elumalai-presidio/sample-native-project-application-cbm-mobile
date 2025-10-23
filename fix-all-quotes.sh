#!/bin/bash

# Comprehensive script to fix all quote formatting issues
echo "🔧 Fixing all quote formatting issues..."

# Function to fix quotes in a file
fix_quotes() {
    local file="$1"
    if [ -f "$file" ]; then
        echo "Fixing $file..."
        
        # Use sed to replace single quotes with double quotes
        # But be careful not to break template literals or already escaped quotes
        sed -i.bak \
            -e "s/'expo-router'/\&quot;expo-router\&quot;/g" \
            -e "s/'react-native'/\&quot;react-native\&quot;/g" \
            -e "s/'react'/\&quot;react\&quot;/g" \
            -e "s/'@\//\&quot;@\//g" \
            -e "s/'expo-/\&quot;expo-/g" \
            -e "s/'@react-/\&quot;@react-/g" \
            -e "s/'@tanstack/\&quot;@tanstack/g" \
            -e "s/'@rn-primitives/\&quot;@rn-primitives/g" \
            -e "s/'class-variance-authority'/\&quot;class-variance-authority\&quot;/g" \
            -e "s/'tailwind-merge'/\&quot;tailwind-merge\&quot;/g" \
            -e "s/'clsx'/\&quot;clsx\&quot;/g" \
            -e "s/'nativewind'/\&quot;nativewind\&quot;/g" \
            -e "s/'i18next'/\&quot;i18next\&quot;/g" \
            -e "s/'react-i18next'/\&quot;react-i18next\&quot;/g" \
            -e "s/'expo-localization'/\&quot;expo-localization\&quot;/g" \
            -e "s/'axios'/\&quot;axios\&quot;/g" \
            -e "s/'react-native-safe-area-context'/\&quot;react-native-safe-area-context\&quot;/g" \
            -e "s/'expo-linear-gradient'/\&quot;expo-linear-gradient\&quot;/g" \
            -e "s/'react-native-worklets/\&quot;react-native-worklets/g" \
            -e "s/'eslint-config-expo/\&quot;eslint-config-expo/g" \
            -e "s/'@tanstack\/eslint-plugin-query'/\&quot;@tanstack\/eslint-plugin-query\&quot;/g" \
            -e "s/'eslint-plugin-prettier/\&quot;eslint-plugin-prettier/g" \
            -e "s/'prettier-plugin-tailwindcss'/\&quot;prettier-plugin-tailwindcss\&quot;/g" \
            -e "s/'tailwindcss-animate'/\&quot;tailwindcss-animate\&quot;/g" \
            -e "s/'Oops!'/\&quot;Oops!\&quot;/g" \
            -e "s/'This screen doesn\\'t exist\.'/\&quot;This screen doesn\\'t exist.\&quot;/g" \
            -e "s/'Go to home screen!'/\&quot;Go to home screen!\&quot;/g" \
            -e "s/'Error Boundary caught:'/\&quot;Error Boundary caught:\&quot;/g" \
            -e "s/'Try Again'/\&quot;Try Again\&quot;/g" \
            -e "s/'useTheme must be used within ThemeProvider'/\&quot;useTheme must be used within ThemeProvider\&quot;/g" \
            -e "s/'API_BASE_URL is not defined in environment variables'/\&quot;API_BASE_URL is not defined in environment variables\&quot;/g" \
            -e "s/'\/account\/index\/login'/\&quot;\/account\/index\/login\&quot;/g" \
            -e "s/'Content-Type': 'application\/json'/\&quot;Content-Type\&quot;: \&quot;application\/json\&quot;/g" \
            -e "s/'welcomeToApp'/\&quot;welcomeToApp\&quot;/g" \
            -e "s/'Switch to Light Mode': 'Switch to Dark Mode'/\&quot;Switch to Light Mode\&quot;: \&quot;Switch to Dark Mode\&quot;/g" \
            -e "s/'light' \| 'dark'/\&quot;light\&quot; \| \&quot;dark\&quot;/g" \
            -e "s/'light'/\&quot;light\&quot;/g" \
            -e "s/'dark'/\&quot;dark\&quot;/g" \
            -e "s/'default'/\&quot;default\&quot;/g" \
            -e "s/'dist\/\*'/\&quot;dist\/\*\&quot;/g" \
            -e "s/'react\/display-name': 'off'/\&quot;react\/display-name\&quot;: \&quot;off\&quot;/g" \
            -e "s/'@tanstack\/query\/exhaustive-deps': 'error'/\&quot;@tanstack\/query\/exhaustive-deps\&quot;: \&quot;error\&quot;/g" \
            -e "s/'@tanstack\/query'/\&quot;@tanstack\/query\&quot;/g" \
            "$file"
        
        # Remove backup file
        rm -f "$file.bak"
        echo "✅ Fixed $file"
    fi
}

# Fix all TypeScript/JavaScript files
echo "📁 Fixing app files..."
fix_quotes "app/+not-found.tsx"
fix_quotes "app/_layout.tsx"
fix_quotes "app/index.tsx"

echo "📁 Fixing component files..."
fix_quotes "components/common/ErrorBoundary.tsx"
fix_quotes "components/ui/button.tsx"
fix_quotes "components/ui/card.tsx"
fix_quotes "components/ui/input.tsx"
fix_quotes "components/ui/text.tsx"

echo "📁 Fixing configuration files..."
fix_quotes "babel.config.js"
fix_quotes "eslint.config.js"
fix_quotes "tailwind.config.js"
fix_quotes "metro.config.js"

echo "📁 Fixing other files..."
fix_quotes "hooks/useAsyncStorage.ts"
fix_quotes "i18n/index.ts"
fix_quotes "lib/theme.ts"
fix_quotes "lib/utils.ts"
fix_quotes "providers/Providers.tsx"
fix_quotes "providers/ThemeProvider.tsx"
fix_quotes "services/api/apiConfig.ts"
fix_quotes "services/api/apiService.ts"

echo ""
echo "✅ All quote formatting issues have been fixed!"
echo ""
echo "🧪 Next steps:"
echo "1. Test the fixes: npm run lint"
echo "2. If you have formatting tools: npm run format"
echo "3. Commit your changes: git add . && git commit -m 'Fix formatting issues'"
echo "4. Push to trigger GitHub Actions: git push"
