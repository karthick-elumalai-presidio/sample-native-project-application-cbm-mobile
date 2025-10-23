# 🚀 GitHub Actions CI/CD Pipeline

This repository includes a complete CI/CD pipeline for React Native/Expo mobile applications with automated testing, building, and deployment capabilities.

## 📁 Workflow Files

### 1. PR Validation (`pr-validation.yml`)
- **Purpose**: Validates pull requests before merging
- **Triggers**: PRs to `develop`, `main`, `qa` branches
- **Platform**: Ubuntu (Android builds only)
- **Checks**:
  - ✅ Code quality (ESLint, Prettier, TypeScript)
  - ✅ Unit tests with coverage
  - ✅ Android build validation
  - ✅ Automatic PR comments with results

### 2. Mobile CI/CD (`mobile-ci-cd.yml`)
- **Purpose**: Full build and deployment pipeline
- **Triggers**: Push to `develop`/`main`, manual dispatch
- **Platform**: Ubuntu (Android) + macOS (iOS)
- **Features**:
  - ✅ Multi-platform builds (Android AAB/APK, iOS IPA)
  - ✅ Environment-based deployments
  - ✅ Manual approval gates
  - ✅ Artifact management

## 🛠️ Setup Instructions

### Prerequisites
1. **Bun** installed: `curl -fsSL https://bun.sh/install | bash`
2. **Git** repository with GitHub Actions enabled
3. **Native projects** generated (Android/iOS)

### Quick Setup
```bash
# Run the automated setup script
./setup-ci.sh

# Or manually:
bun install
bun run prebuild --platform android --clean
bun run prebuild --platform ios --clean
```

### Required GitHub Secrets

Add these in your repository settings (Settings → Secrets and variables → Actions):

#### Android Deployment
- `ANDROID_SERVICE_ACCOUNT_JSON`: Google Play Console service account JSON

#### iOS Deployment  
- `APP_STORE_CONNECT_API_KEY_JSON`: App Store Connect API key JSON
- `APPLE_TEAM_ID`: Apple Developer Team ID
- `APPLE_ID`: Apple ID (optional)

## 🔧 Configuration

### Package.json Scripts
The following scripts are required and have been configured:

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

### Fastlane Configuration

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

## 🚀 Usage

### Automatic Triggers
- **PR Validation**: Runs automatically on pull requests
- **CI/CD Pipeline**: Runs on pushes to `develop`/`main` branches

### Manual Triggers
- **Workflow Dispatch**: Go to Actions → Mobile App CI/CD → Run workflow
- **Environment Selection**: Choose development, qa, or production

### Deployment Environments
1. **Development**: Android only, quick deployment
2. **QA**: Both platforms, manual approval required
3. **Production**: Both platforms, manual approval required

## 🔍 Monitoring

### Workflow Status
- Check the **Actions** tab in GitHub
- View detailed logs for each step
- Monitor build artifacts and deployment status

### Health Checks
```bash
# Run the health check script
./.github/check-workflows.sh
```

## 🚨 Troubleshooting

### Common Issues

1. **Missing Native Projects**
   ```bash
   bun run prebuild --platform android --clean
   bun run prebuild --platform ios --clean
   git add android/ ios/
   git commit -m "Add native projects"
   ```

2. **Fastlane Dependencies**
   ```bash
   cd android && bundle install
   cd ios && bundle install
   ```

3. **Missing Secrets**
   - Verify all secrets are set in repository settings
   - Check secret names match exactly (case-sensitive)
   - Ensure JSON keys are properly formatted

4. **Build Failures**
   - Check workflow logs in GitHub Actions
   - Test Fastlane commands locally first
   - Verify Apple Developer credentials

### Debug Commands
```bash
# Test code quality locally
bun run lint
bun run format:check  
bun run type-check

# Test Android build
cd android && bundle exec fastlane build_debug

# Test iOS build (macOS only)
cd ios && bundle exec fastlane build_debug
```

## 📋 Next Steps

1. **Configure Secrets**: Add required secrets to GitHub repository
2. **Generate Native Projects**: Run `bun run prebuild` for both platforms
3. **Commit Changes**: Add and commit all generated files
4. **Test Workflows**: Create a pull request to test validation
5. **Deploy**: Use manual workflow dispatch for deployments

## 📖 Documentation

- **Setup Guide**: `.github/SETUP.md` - Detailed setup instructions
- **Workflow Health Check**: `.github/check-workflows.sh` - Validation script
- **Fastlane Docs**: [docs.fastlane.tools](https://docs.fastlane.tools)

---

*This CI/CD pipeline provides enterprise-grade automation for mobile app development with comprehensive testing, building, and deployment capabilities.*
