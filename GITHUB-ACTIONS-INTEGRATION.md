# GitHub Actions Integration Guide

This document explains how the Fastlane preservation solution integrates with your GitHub Actions CI/CD pipeline.

## 🚀 What's Been Updated

### 1. **Updated GitHub Actions Workflow**
The `.github/workflows/mobile-ci-cd.yml` file has been updated to use our new prebuild scripts:

#### Before (Failing):
```yaml
- name: Expo Prebuild (Android)
  run: |
    if [ ! -f "android/gradlew" ]; then
      bun run prebuild --platform android --clean
    fi
```

#### After (Working):
```yaml
- name: Expo Prebuild (Android)
  run: |
    if [ ! -f "android/gradlew" ]; then
      bun run prebuild:android
    else
      echo "Android directory exists, running post-prebuild to ensure Fastlane files are present"
      ./scripts/post-prebuild.sh
    fi
```

### 2. **New Package.json Scripts**
Added new npm/bun scripts for CI:
- `bun run prebuild:android` - Android prebuild with Fastlane restoration
- `bun run prebuild:ios` - iOS prebuild with Fastlane restoration

### 3. **Deployment Steps Updated**
All deployment steps now include Fastlane file restoration:
```yaml
- name: Restore Fastlane files for deployment
  run: ./scripts/post-prebuild.sh
```

## 🔧 How It Works in CI

### Build Phase
1. **Install dependencies**: `bun install`
2. **Prebuild with Fastlane**: `bun run prebuild:android` or `bun run prebuild:ios`
3. **Fastlane files automatically restored** from `native/` directories
4. **Install Fastlane dependencies**: `bundle install` (now finds Gemfile!)
5. **Build artifacts**: Fastlane commands work successfully

### Deployment Phase
1. **Download artifacts** from build phase
2. **Restore Fastlane files**: `./scripts/post-prebuild.sh`
3. **Deploy**: Fastlane commands work for Google Play/App Store uploads

## 📋 Key Changes Made

### 1. **Android Build Job**
```yaml
# OLD (was failing)
bun run prebuild --platform android --clean

# NEW (works perfectly)
bun run prebuild:android
```

### 2. **iOS Build Job**
```yaml
# OLD (was failing)
bun run prebuild --platform ios --clean

# NEW (works perfectly)
bun run prebuild:ios
```

### 3. **All Deployment Jobs**
Added Fastlane restoration step:
```yaml
- name: Restore Fastlane files for deployment
  run: ./scripts/post-prebuild.sh
```

## 🧪 Testing the Setup

Run the test script to verify everything works:
```bash
./scripts/test-ci-setup.sh
```

This script verifies:
- ✅ Native directory structure exists
- ✅ Scripts are executable
- ✅ Post-prebuild script works
- ✅ Files are copied correctly
- ✅ Fastlane files have correct content

## 🚨 What This Fixes

### Before (CI Failures):
```
❌ cat: android/Gemfile: No such file or directory
❌ Debug: Gemfile exists: NO
❌ Error: Process completed with exit code 1
```

### After (CI Success):
```
✅ Debug: Gemfile exists: YES
✅ Installing Fastlane dependencies...
✅ Bundle install successful
✅ Fastlane commands work
```

## 🔄 Workflow Steps

### 1. **Validate Job**
- Lint and typecheck (unchanged)
- ✅ Still works

### 2. **Build Android Job**
- Install dependencies
- **NEW**: `bun run prebuild:android` (includes Fastlane restoration)
- Setup Java & Ruby
- **NEW**: Fastlane files are now available
- Install Fastlane dependencies ✅
- Build release artifacts ✅
- Upload artifacts

### 3. **Build iOS Job**
- Install dependencies
- **NEW**: `bun run prebuild:ios` (includes Fastlane restoration)
- Setup Ruby
- **NEW**: Fastlane files are now available
- Install Fastlane dependencies ✅
- Build iOS IPA ✅
- Upload artifacts

### 4. **Deployment Jobs**
- Download artifacts
- **NEW**: Restore Fastlane files
- Deploy to Google Play/App Store ✅

## 🎯 Benefits

1. **No More CI Failures** - Fastlane files are always available
2. **Version Controlled** - All Fastlane files in git
3. **Platform Specific** - Separate Android/iOS configurations
4. **Automatic Restoration** - No manual intervention needed
5. **Backward Compatible** - Existing workflows still work

## 🔍 Troubleshooting

### If CI still fails with "Gemfile not found":
1. Check that `native/android/Gemfile` and `native/ios/Gemfile` exist
2. Verify the scripts have execute permissions
3. Check the workflow logs for script execution

### If Fastlane commands fail:
1. Ensure the post-prebuild script ran successfully
2. Check that files were copied to `android/` and `ios/` directories
3. Verify bundle install completed successfully

## 📊 Expected Results

After these changes, your GitHub Actions workflow should:
- ✅ Build Android artifacts successfully
- ✅ Build iOS artifacts successfully  
- ✅ Deploy to Google Play Internal Testing
- ✅ Deploy to TestFlight
- ✅ Deploy to Production (when configured)

The "Build Android Artifact" and "Build iOS Artifact" jobs will no longer fail with "Gemfile not found" errors.
