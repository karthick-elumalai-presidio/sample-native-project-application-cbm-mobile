# Mobile CI/CD Deployment Setup

## Overview
This document outlines the complete mobile CI/CD pipeline setup for the CbM mobile application, including Android and iOS build and deployment workflows.

## Workflow Files

### 1. PR Validation Workflow (`.github/workflows/pr-validation.yml`)
- **Purpose**: Validates code quality on pull requests
- **Triggers**: PR opened/updated to develop, main, or qa branches
- **Checks**: ESLint, Prettier formatting, TypeScript, unit tests, Android build validation

### 2. Mobile CI/CD Workflow (`.github/workflows/mobile-ci-cd.yml`)
- **Purpose**: Full build and deployment pipeline
- **Triggers**: Push to develop/main branches or manual workflow dispatch
- **Environments**: development, qa, production

## Workflow Stages

### 1. Validation Stage
- Code linting (ESLint)
- Code formatting (Prettier)
- TypeScript type checking
- Unit tests with coverage

### 2. Build Stage
- **Android**: Builds AAB and APK artifacts using Gradle
- **iOS**: Builds IPA artifacts using Xcode (macOS runners)

### 3. Approval Stage
- Manual approval required for each environment
- Environment-specific approval gates

### 4. Deployment Stage
- **Development**: Deploy to Google Play Internal Testing + TestFlight
- **QA**: Deploy to Google Play Internal Testing + TestFlight
- **Production**: Deploy to Google Play Production + App Store

## Required Secrets

### Android Deployment
- `ANDROID_SERVICE_ACCOUNT_JSON`: Google Play Console service account key

### iOS Deployment
- `APP_STORE_CONNECT_API_KEY_JSON`: App Store Connect API key
- `APPLE_TEAM_ID`: Apple Developer Team ID
- `APPLE_ID`: Apple Developer Account ID

## Fastlane Configuration

### Android Fastlane (`android/fastlane/Fastfile`)
- `build_debug`: Build debug APK
- `build_release`: Build release AAB and APK
- `deploy_beta`: Upload to Google Play Internal Testing
- `deploy_production`: Upload to Google Play Production

### iOS Fastlane (`ios/fastlane/Fastfile`)
- `build_debug`: Build debug IPA
- `build_appstore_ipa`: Build release IPA for App Store
- `upload_testflight_ipa`: Upload to TestFlight
- `upload_appstore_ipa`: Upload to App Store

## Scripts

### Prebuild Script (`scripts/prebuild.sh`)
- Runs `expo prebuild --clean`
- Restores Fastlane files from `native/` directories
- Ensures proper project structure

### Post-prebuild Script (`scripts/post-prebuild.sh`)
- Restores Fastlane files after prebuild
- Copies configuration files to appropriate directories
- Ensures deployment files are available

## Usage

### Automatic Deployment
- Push to `develop` or `main` branches triggers validation and build
- Manual approval required for deployment

### Manual Deployment
1. Go to GitHub Actions tab
2. Select "Mobile App CI/CD" workflow
3. Click "Run workflow"
4. Choose target environment (development/qa/production)
5. Approve deployment when prompted

## Environment Configuration

### Development
- Android: Google Play Internal Testing
- iOS: TestFlight (Development)

### QA
- Android: Google Play Internal Testing
- iOS: TestFlight (QA)

### Production
- Android: Google Play Production
- iOS: App Store

## Troubleshooting

### Common Issues
1. **Missing Secrets**: Ensure all required secrets are configured in GitHub repository settings
2. **Build Failures**: Check logs for specific error messages
3. **Deployment Failures**: Verify API keys and permissions

### Debug Steps
1. Check GitHub Actions logs
2. Verify secret configuration
3. Test Fastlane commands locally
4. Check Apple Developer/Google Play Console permissions

## Recent Fixes Applied

1. **Fixed tsconfig.json formatting** to pass Prettier checks
2. **Fixed GitHub script error** in PR validation workflow
3. **Fixed iOS prebuild condition** to properly detect xcworkspace files
4. **Fixed artifact download paths** in deployment jobs
5. **Added format check** to validation job
6. **Made scripts executable** for proper execution

## Next Steps

1. Configure required secrets in GitHub repository settings
2. Set up environments in GitHub repository settings
3. Test the workflow with a sample deployment
4. Configure branch protection rules if needed
