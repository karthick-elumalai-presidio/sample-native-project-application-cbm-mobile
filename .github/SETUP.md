# GitHub Actions CI/CD Setup Guide

This guide will help you set up and configure the GitHub Actions workflows for your mobile app.

## 🚀 Quick Start

### 1. Required GitHub Secrets

Add these secrets to your GitHub repository (Settings → Secrets and variables → Actions):

#### Android Secrets
- `ANDROID_SERVICE_ACCOUNT_JSON`: Google Play Console service account JSON key

#### iOS Secrets  
- `APP_STORE_CONNECT_API_KEY_JSON`: App Store Connect API key JSON
- `APPLE_TEAM_ID`: Your Apple Developer Team ID
- `APPLE_ID`: Your Apple ID (optional, for fallback authentication)

### 2. Environment Setup

The workflows will automatically:
- ✅ Install Node.js 20 and Bun 1.1.34
- ✅ Install dependencies with `bun install`
- ✅ Run code quality checks (ESLint, Prettier, TypeScript)
- ✅ Build Android APK/AAB with Fastlane
- ✅ Build iOS IPA with Fastlane (on macOS runners)

### 3. Workflow Triggers

#### PR Validation (`pr-validation.yml`)
- **Triggers**: Pull requests to `develop`, `main`, `qa` branches
- **Runs on**: Ubuntu (Android only)
- **Checks**: Code quality, tests, Android build validation

#### CI/CD Pipeline (`mobile-ci-cd.yml`)
- **Triggers**: Push to `develop`/`main`, manual dispatch
- **Runs on**: Ubuntu (Android) + macOS (iOS)
- **Actions**: Full build, test, and deployment pipeline

## 🔧 Configuration

### Fastlane Setup

The project includes pre-configured Fastlane files:

#### Android (`android/fastlane/Fastfile`)
- `build_debug`: Build debug APK
- `build_release`: Build release AAB + APK
- `deploy_beta`: Upload to Google Play Internal Testing
- `deploy_production`: Upload to Google Play Production

#### iOS (`ios/fastlane/Fastfile`)
- `build_debug`: Build debug IPA
- `build_appstore_ipa`: Build App Store IPA
- `upload_testflight_ipa`: Upload to TestFlight
- `upload_appstore_ipa`: Upload to App Store

### Required Scripts

Make sure your `package.json` includes these scripts:
```json
{
  "scripts": {
    "lint": "eslint \"**/*.{js,jsx,ts,tsx,css}\"",
    "format:check": "prettier -c \"**/*.{js,jsx,ts,tsx,json,css}\"",
    "type-check": "tsc --noEmit",
    "test:coverage": "echo \"No tests configured yet\""
  }
}
```

## 🚨 Troubleshooting

### Common Issues

1. **Missing Native Projects**
   - Run `bun run prebuild --platform android --clean` for Android
   - Run `bun run prebuild --platform ios --clean` for iOS
   - Commit the generated `android/` and `ios/` folders

2. **Fastlane Build Failures**
   - Check that `Gemfile` exists in `android/` and `ios/` directories
   - Ensure Ruby dependencies are installed: `bundle install`

3. **Missing Secrets**
   - Verify all required secrets are set in GitHub repository settings
   - Check secret names match exactly (case-sensitive)

4. **iOS Build Issues**
   - iOS builds require macOS runners
   - Ensure Apple Developer credentials are properly configured
   - Check that Xcode project files are generated correctly

### Debug Steps

1. **Check Workflow Logs**
   - Go to Actions tab in GitHub
   - Click on failed workflow run
   - Review step-by-step logs

2. **Test Locally**
   ```bash
   # Test code quality
   bun run lint
   bun run format:check
   bun run type-check
   
   # Test Android build
   cd android
   bundle exec fastlane build_debug
   
   # Test iOS build (macOS only)
   cd ios
   bundle exec fastlane build_debug
   ```

3. **Verify Dependencies**
   ```bash
   # Install all dependencies
   bun install
   
   # Install Ruby dependencies
   cd android && bundle install
   cd ios && bundle install
   ```

## 📋 Next Steps

1. **Set up secrets** in GitHub repository settings
2. **Generate native projects** if not already done
3. **Test workflows** by creating a pull request
4. **Configure deployment** environments as needed

## 🆘 Support

If you encounter issues:
1. Check the workflow logs in GitHub Actions
2. Verify all secrets are properly configured
3. Ensure native projects are committed to git
4. Test Fastlane commands locally first

---

*This setup provides a complete CI/CD pipeline for React Native/Expo mobile apps with automated testing, building, and deployment capabilities.*
