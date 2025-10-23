#!/bin/bash

# Test script to simulate CI environment and verify Fastlane setup
# This script tests the same steps that GitHub Actions will run

set -e

echo "🧪 Testing CI setup for Fastlane files..."

# Function to check if file exists
check_file() {
    local file="$1"
    if [ -f "$file" ]; then
        echo "✅ $file exists"
        return 0
    else
        echo "❌ $file missing"
        return 1
    fi
}

# Function to check if directory exists
check_dir() {
    local dir="$1"
    if [ -d "$dir" ]; then
        echo "✅ $dir exists"
        return 0
    else
        echo "❌ $dir missing"
        return 1
    fi
}

echo "🔍 Checking native directory structure..."
check_dir "native"
check_dir "native/android"
check_dir "native/ios"
check_dir "native/android/fastlane"
check_dir "native/ios/fastlane"
check_file "native/android/Gemfile"
check_file "native/ios/Gemfile"

echo "🔍 Checking scripts..."
check_file "scripts/post-prebuild.sh"
check_file "scripts/prebuild.sh"

echo "🧪 Testing post-prebuild script..."
./scripts/post-prebuild.sh

echo "🔍 Verifying files were copied to android/ and ios/..."
check_file "android/Gemfile"
check_file "android/fastlane/Fastfile"
check_file "ios/Gemfile"
check_file "ios/fastlane/Fastfile"

echo "🧪 Testing Fastlane file contents..."
echo "📄 Android Gemfile content:"
head -5 android/Gemfile

echo "📄 iOS Gemfile content:"
head -5 ios/Gemfile

echo "📄 Android Fastfile content:"
head -10 android/fastlane/Fastfile

echo "📄 iOS Fastfile content:"
head -10 ios/fastlane/Fastfile

echo "✅ All tests passed! CI setup is ready."
echo ""
echo "🚀 Your GitHub Actions workflow will now:"
echo "   1. Run 'bun run prebuild:android' or 'bun run prebuild:ios'"
echo "   2. Automatically restore Fastlane files from native/ directories"
echo "   3. Have access to Gemfile and Fastfile in android/ and ios/ directories"
echo "   4. Successfully run Fastlane commands in CI"
