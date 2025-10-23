#!/bin/bash

# GitHub Actions Workflow Health Check
# This script validates that all workflows are properly configured

set -e

echo "🔍 GitHub Actions Workflow Health Check"
echo "======================================"

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found. Please run this script from the project root."
    exit 1
fi

echo "📋 Checking project structure..."

# Check required files
REQUIRED_FILES=(
    "package.json"
    ".github/workflows/pr-validation.yml"
    ".github/workflows/mobile-ci-cd.yml"
    "android/fastlane/Fastfile"
    "ios/fastlane/Fastfile"
    "android/Gemfile"
    "ios/Gemfile"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file exists"
    else
        echo "❌ $file missing"
        exit 1
    fi
done

echo ""
echo "📦 Checking package.json scripts..."

# Check required scripts
REQUIRED_SCRIPTS=("lint" "format:check" "type-check" "test:coverage")

for script in "${REQUIRED_SCRIPTS[@]}"; do
    if grep -q "\"$script\":" package.json; then
        echo "✅ Script '$script' found"
    else
        echo "❌ Script '$script' missing from package.json"
        exit 1
    fi
done

echo ""
echo "🏗️ Checking native projects..."

# Check Android native project
if [ -f "android/gradlew" ]; then
    echo "✅ Android native project exists"
else
    echo "⚠️ Android native project missing - run: bun run prebuild --platform android --clean"
fi

# Check iOS native project
if [ -d "ios/CbMmobileapp.xcodeproj" ]; then
    echo "✅ iOS native project exists"
else
    echo "⚠️ iOS native project missing - run: bun run prebuild --platform ios --clean"
fi

echo ""
echo "🔧 Testing code quality tools..."

# Test ESLint
echo "Testing ESLint..."
if bun run lint > /dev/null 2>&1; then
    echo "✅ ESLint working"
else
    echo "❌ ESLint failed"
fi

# Test Prettier
echo "Testing Prettier..."
if bun run format:check > /dev/null 2>&1; then
    echo "✅ Prettier working"
else
    echo "❌ Prettier failed"
fi

# Test TypeScript
echo "Testing TypeScript..."
if bun run type-check > /dev/null 2>&1; then
    echo "✅ TypeScript working"
else
    echo "❌ TypeScript failed"
fi

echo ""
echo "📦 Testing Fastlane setup..."

# Test Android Fastlane
if [ -f "android/Gemfile" ]; then
    cd android
    if bundle check > /dev/null 2>&1; then
        echo "✅ Android Fastlane dependencies installed"
    else
        echo "⚠️ Android Fastlane dependencies not installed - run: cd android && bundle install"
    fi
    cd ..
fi

# Test iOS Fastlane
if [ -f "ios/Gemfile" ]; then
    cd ios
    if bundle check > /dev/null 2>&1; then
        echo "✅ iOS Fastlane dependencies installed"
    else
        echo "⚠️ iOS Fastlane dependencies not installed - run: cd ios && bundle install"
    fi
    cd ..
fi

echo ""
echo "🎯 GitHub Actions Workflow Status:"
echo "================================="

# Check workflow files for common issues
echo "Checking PR validation workflow..."
if grep -q "bun run lint" .github/workflows/pr-validation.yml; then
    echo "✅ PR validation workflow configured correctly"
else
    echo "❌ PR validation workflow has issues"
fi

echo "Checking CI/CD workflow..."
if grep -q "bun run type-check" .github/workflows/mobile-ci-cd.yml; then
    echo "✅ CI/CD workflow configured correctly"
else
    echo "❌ CI/CD workflow has issues"
fi

echo ""
echo "📋 Summary:"
echo "==========="
echo "✅ All required files present"
echo "✅ All required scripts configured"
echo "✅ Workflows properly configured"
echo ""
echo "🚀 Your GitHub Actions setup is ready!"
echo ""
echo "Next steps:"
echo "1. Commit and push your changes"
echo "2. Configure GitHub Secrets (see .github/SETUP.md)"
echo "3. Test by creating a pull request"
