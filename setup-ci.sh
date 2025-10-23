#!/bin/bash

# GitHub Actions CI/CD Setup Script
# This script prepares the project for GitHub Actions workflows

set -e

echo "🚀 Setting up GitHub Actions CI/CD for CbM Mobile App"
echo "=================================================="

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found. Please run this script from the project root."
    exit 1
fi

echo "📦 Installing dependencies..."
if command -v bun &> /dev/null; then
    bun install
else
    echo "⚠️ Bun not found. Please install Bun first:"
    echo "   curl -fsSL https://bun.sh/install | bash"
    echo "   Or use npm: npm install"
    exit 1
fi

echo "🔧 Setting up Android native project..."
if [ ! -f "android/gradlew" ]; then
    echo "📱 Generating Android native project..."
    bun run prebuild --platform android --clean
    echo "✅ Android native project generated"
else
    echo "✅ Android native project already exists"
fi

echo "🍎 Setting up iOS native project..."
if [ ! -d "ios/CbMmobileapp.xcodeproj" ]; then
    echo "📱 Generating iOS native project..."
    bun run prebuild --platform ios --clean
    echo "✅ iOS native project generated"
else
    echo "✅ iOS native project already exists"
fi

echo "📦 Installing Ruby dependencies for Fastlane..."
cd android
if [ -f "Gemfile" ]; then
    bundle install
    echo "✅ Android Fastlane dependencies installed"
else
    echo "⚠️ Android Gemfile not found"
fi
cd ..

cd ios
if [ -f "Gemfile" ]; then
    bundle install
    echo "✅ iOS Fastlane dependencies installed"
else
    echo "⚠️ iOS Gemfile not found"
fi
cd ..

echo "🧪 Running code quality checks..."
echo "Running ESLint..."
bun run lint

echo "Running Prettier format check..."
bun run format:check

echo "Running TypeScript check..."
bun run type-check

echo ""
echo "🎉 Setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Commit all changes to git:"
echo "   git add ."
echo "   git commit -m 'Add GitHub Actions CI/CD setup'"
echo ""
echo "2. Push to GitHub:"
echo "   git push origin main"
echo ""
echo "3. Configure GitHub Secrets in your repository:"
echo "   - Go to Settings → Secrets and variables → Actions"
echo "   - Add the required secrets (see .github/SETUP.md)"
echo ""
echo "4. Test the workflows by creating a pull request"
echo ""
echo "📖 For detailed setup instructions, see .github/SETUP.md"
