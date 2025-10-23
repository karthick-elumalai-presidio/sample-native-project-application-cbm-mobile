#!/bin/bash

# Post-prebuild script to restore Fastlane files
# This script runs after expo prebuild to restore Fastlane files from native/ directories

set -e

echo "🔄 Post-prebuild: Restoring Fastlane files..."

# Function to copy files if source exists
copy_if_exists() {
    local src="$1"
    local dest="$2"
    if [ -d "$src" ] || [ -f "$src" ]; then
        echo "📁 Copying $src to $dest"
        cp -r "$src" "$dest"
    else
        echo "⚠️  Source not found: $src"
    fi
}

# Restore Android Fastlane files
if [ -d "native/android" ]; then
    echo "🤖 Restoring Android Fastlane files..."
    copy_if_exists "native/android/fastlane" "android/"
    copy_if_exists "native/android/Gemfile" "android/"
    copy_if_exists "native/android/Gemfile.lock" "android/"
    copy_if_exists "native/android/debug-gemfile.sh" "android/"
else
    echo "⚠️  native/android directory not found"
fi

# Restore iOS Fastlane files
if [ -d "native/ios" ]; then
    echo "🍎 Restoring iOS Fastlane files..."
    copy_if_exists "native/ios/fastlane" "ios/"
    copy_if_exists "native/ios/Gemfile" "ios/"
    copy_if_exists "native/ios/Gemfile.lock" "ios/"
else
    echo "⚠️  native/ios directory not found"
fi

echo "✅ Post-prebuild: Fastlane files restored successfully!"
