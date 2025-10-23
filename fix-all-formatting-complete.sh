#!/bin/bash

# Complete formatting fix for all files
echo "🔧 Fixing ALL formatting issues..."

# Function to fix a file
fix_file() {
    local file="$1"
    if [ -f "$file" ]; then
        echo "Fixing $file..."
        
        # Use sed to replace single quotes with double quotes
        # This is a comprehensive replacement for all common patterns
        sed -i.bak \
            -e "s/'react'/\&quot;react\&quot;/g" \
            -e "s/'react-native'/\&quot;react-native\&quot;/g" \
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
            -e "s/'@react-native-async-storage\/async-storage'/\&quot;@react-native-async-storage\/async-storage\&quot;/g" \
            -e "s/'expo\/metro-config'/\&quot;expo\/metro-config\&quot;/g" \
            -e "s/'nativewind\/metro'/\&quot;nativewind\/metro\&quot;/g" \
            -e "s/'nativewind\/theme'/\&quot;nativewind\/theme\&quot;/g" \
            -e "s/'nativewind\/preset'/\&quot;nativewind\/preset\&quot;/g" \
            -e "s/'tailwindcss-animate'/\&quot;tailwindcss-animate\&quot;/g" \
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
            -e "s/'en'/\&quot;en\&quot;/g" \
            -e "s/'class'/\&quot;class\&quot;/g" \
            -e "s/'var(--[^']*)'/\&quot;var(--\1)\&quot;/g" \
            -e "s/'calc(var(--[^']*))'/\&quot;calc(\1)\&quot;/g" \
            -e "s/'accordion-down'/\&quot;accordion-down\&quot;/g" \
            -e "s/'accordion-up'/\&quot;accordion-up\&quot;/g" \
            -e "s/'0'/\&quot;0\&quot;/g" \
            -e "s/'1'/\&quot;1\&quot;/g" \
            -e "s/'2'/\&quot;2\&quot;/g" \
            -e "s/'3'/\&quot;3\&quot;/g" \
            -e "s/'4'/\&quot;4\&quot;/g" \
            -e "s/'heading'/\&quot;heading\&quot;/g" \
            -e "s/'blockquote'/\&quot;blockquote\&quot;/g" \
            -e "s/'code'/\&quot;code\&quot;/g" \
            -e "s/'variant'/\&quot;variant\&quot;/g" \
            -e "s/'opacity-50'/\&quot;opacity-50\&quot;/g" \
            -e "s/'placeholder:text-muted-foreground\/50'/\&quot;placeholder:text-muted-foreground\/50\&quot;/g" \
            -e "s/'px-6'/\&quot;px-6\&quot;/g" \
            -e "s/'app-theme', systemTheme \?\? 'dark'/\&quot;app-theme\&quot;, systemTheme \?\? \&quot;dark\&quot;/g" \
            -e "s/'light' \? 'dark' : 'light'/\&quot;light\&quot; \? \&quot;dark\&quot; : \&quot;light\&quot;/g" \
            -e "s/'disabled:pointer-events-none disabled:cursor-not-allowed'/\&quot;disabled:pointer-events-none disabled:cursor-not-allowed\&quot;/g" \
            -e "s/'outline-none transition-\[color,box-shadow\] selection:bg-primary selection:text-primary-foreground placeholder:text-muted-foreground md:text-sm'/\&quot;outline-none transition-\[color,box-shadow\] selection:bg-primary selection:text-primary-foreground placeholder:text-muted-foreground md:text-sm\&quot;/g" \
            -e "s/'focus-visible:ring-ring\/50 focus-visible:border-ring focus-visible:ring-\[3px\]'/\&quot;focus-visible:ring-ring\/50 focus-visible:border-ring focus-visible:ring-\[3px\]\&quot;/g" \
            -e "s/'aria-invalid:ring-destructive\/20 dark:aria-invalid:ring-destructive\/40 aria-invalid:border-destructive'/\&quot;aria-invalid:ring-destructive\/20 dark:aria-invalid:ring-destructive\/40 aria-invalid:border-destructive\&quot;/g" \
            -e "s/'web: 'disabled:pointer-events-none disabled:cursor-not-allowed'/\&quot;web: \&quot;disabled:pointer-events-none disabled:cursor-not-allowed\&quot;/g" \
            -e "s/'dark:bg-input\/30 flex h-10 w-full min-w-0 flex-row items-center rounded-md border border-input px-3 py-1 text-base leading-5 text-foreground shadow-sm shadow-black\/5 sm:h-9'/\&quot;dark:bg-input\/30 flex h-10 w-full min-w-0 flex-row items-center rounded-md border border-input px-3 py-1 text-base leading-5 text-foreground shadow-sm shadow-black\/5 sm:h-9\&quot;/g" \
            -e "s/'text-foreground text-base'/\&quot;text-foreground text-base\&quot;/g" \
            -e "s/'select-text'/\&quot;select-text\&quot;/g" \
            -e "s/'text-center text-4xl font-extrabold tracking-tight'/\&quot;text-center text-4xl font-extrabold tracking-tight\&quot;/g" \
            -e "s/'scroll-m-20 text-balance'/\&quot;scroll-m-20 text-balance\&quot;/g" \
            -e "s/'border-border border-b pb-2 text-3xl font-semibold tracking-tight'/\&quot;border-border border-b pb-2 text-3xl font-semibold tracking-tight\&quot;/g" \
            -e "s/'scroll-m-20 first:mt-0'/\&quot;scroll-m-20 first:mt-0\&quot;/g" \
            -e "s/'text-2xl font-semibold tracking-tight', Platform.select({ web: 'scroll-m-20' })/\&quot;text-2xl font-semibold tracking-tight\&quot;, Platform.select({ web: \&quot;scroll-m-20\&quot; })/g" \
            -e "s/'text-xl font-semibold tracking-tight', Platform.select({ web: 'scroll-m-20' })/\&quot;text-xl font-semibold tracking-tight\&quot;, Platform.select({ web: \&quot;scroll-m-20\&quot; })/g" \
            -e "s/'mt-3 leading-7 sm:mt-6'/\&quot;mt-3 leading-7 sm:mt-6\&quot;/g" \
            -e "s/'mt-4 border-l-2 pl-3 italic sm:mt-6 sm:pl-6'/\&quot;mt-4 border-l-2 pl-3 italic sm:mt-6 sm:pl-6\&quot;/g" \
            -e "s/'bg-muted relative rounded px-\[0\.3rem\] py-\[0\.2rem\] font-mono text-sm font-semibold'/\&quot;bg-muted relative rounded px-\[0\.3rem\] py-\[0\.2rem\] font-mono text-sm font-semibold\&quot;/g" \
            -e "s/'text-muted-foreground text-xl'/\&quot;text-muted-foreground text-xl\&quot;/g" \
            -e "s/'text-lg font-semibold'/\&quot;text-lg font-semibold\&quot;/g" \
            -e "s/'text-sm font-medium leading-none'/\&quot;text-sm font-medium leading-none\&quot;/g" \
            -e "s/'text-muted-foreground text-sm'/\&quot;text-muted-foreground text-sm\&quot;/g" \
            -e "s/'font-semibold leading-none'/\&quot;font-semibold leading-none\&quot;/g" \
            -e "s/'flex flex-col gap-6 rounded-xl border border-border bg-card py-6 shadow-sm shadow-black\/5'/\&quot;flex flex-col gap-6 rounded-xl border border-border bg-card py-6 shadow-sm shadow-black\/5\&quot;/g" \
            -e "s/'flex flex-col gap-1\.5 px-6'/\&quot;flex flex-col gap-1\.5 px-6\&quot;/g" \
            -e "s/'text-sm text-muted-foreground'/\&quot;text-sm text-muted-foreground\&quot;/g" \
            -e "s/'flex flex-row items-center px-6'/\&quot;flex flex-row items-center px-6\&quot;/g" \
            -e "s/'accordion-down': 'accordion-down 0\.2s ease-out'/\&quot;accordion-down\&quot;: \&quot;accordion-down 0\.2s ease-out\&quot;/g" \
            -e "s/'accordion-up': 'accordion-up 0\.2s ease-out'/\&quot;accordion-up\&quot;: \&quot;accordion-up 0\.2s ease-out\&quot;/g" \
            -e "s/'\.\/locales\/en\/translation\.json'/\&quot;\.\/locales\/en\/translation\.json\&quot;/g" \
            -e "s/'\.\/locales\/ja\/translation\.json'/\&quot;\.\/locales\/ja\/translation\.json\&quot;/g" \
            -e "s/'\.\/locales\/zh\/translation\.json'/\&quot;\.\/locales\/zh\/translation\.json\&quot;/g" \
            -e "s/'\.\/global\.css'/\&quot;\.\/global\.css\&quot;/g" \
            -e "s/'input: '\.\/global\.css', inlineRem: 16'/\&quot;input: \&quot;\.\/global\.css\&quot;, inlineRem: 16/g" \
            -e "s/'\.\/app\/\*\*\/\*\.{js,ts,tsx}', '\.\/components\/\*\*\/\*\.{js,ts,tsx}', '\.\/providers\/\*\.{js,ts,tsx}'/\&quot;\.\/app\/\*\*\/\*\.{js,ts,tsx}\&quot;, \&quot;\.\/components\/\*\*\/\*\.{js,ts,tsx}\&quot;, \&quot;\.\/providers\/\*\.{js,ts,tsx}\&quot;/g" \
            "$file"
        
        # Remove backup file
        rm -f "$file.bak"
        echo "✅ Fixed $file"
    fi
}

# Fix all remaining files
echo "📁 Fixing component files..."
fix_file "components/common/ErrorBoundary.tsx"
fix_file "components/ui/card.tsx"
fix_file "components/ui/input.tsx"
fix_file "components/ui/text.tsx"

echo "📁 Fixing other files..."
fix_file "hooks/useAsyncStorage.ts"
fix_file "i18n/index.ts"
fix_file "lib/theme.ts"
fix_file "lib/utils.ts"
fix_file "providers/Providers.tsx"
fix_file "providers/ThemeProvider.tsx"
fix_file "services/api/apiConfig.ts"
fix_file "services/api/apiService.ts"
fix_file "utils/asyncStorage.ts"

echo "📁 Fixing config files..."
fix_file "metro.config.js"
fix_file "tailwind.config.js"

echo ""
echo "✅ All formatting issues have been fixed!"
echo ""
echo "🧪 Next steps:"
echo "1. Test the fixes: npm run lint"
echo "2. If you have formatting tools: npm run format"
echo "3. Commit your changes: git add . && git commit -m 'Fix all formatting issues'"
echo "4. Push to trigger GitHub Actions: git push"
