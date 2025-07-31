# Lab 4 Mobile - Looma App Testing Suite

## Overview

This is a comprehensive Robot Framework test suite for automated mobile testing of the Looma Android application using Appium. The project focuses on testing core functionalities including user authentication and product management features.

## Project Structure

```text
lab4_mobile/
├── README.md                     # This documentation
├── .env                          # Environment configuration
├── app-looma.apk                 # Android application under test
├── resources/                    # Test resources and utilities
│   ├── common_keywords.robot     # Reusable test keywords
│   ├── locators.py              # UI element locators (XPath)
│   └── variables.py             # Test variables and configuration
└── tests/                       # Test cases
    ├── login_tests.robot        # Authentication test cases
    └── product_tests.robot      # Product management test cases
```

## 🔧 Prerequisites

### Software Requirements

- **Python 3.8+** with pip
- **Node.js 14+** for Appium
- **Java JDK 8+** for Android tools
- **Android SDK** with platform tools
- **Android Emulator** or physical device

### Python Dependencies

#### requirements.txt

```text
robotframework==6.1.1
robotframework-seleniumlibrary==6.1.1
robotframework-mongodblibrary==0.3.4
robotframework-requests==0.9.0
robotframework-appiumlibrary==2.0.0
Appium-Python-Client==2.11.1
pymongo==4.6.1
requests==2.31.0
```

```bash
pip install -r requirements.txt
```

### Appium Setup

```bash
# Install Appium globally
npm install -g appium

# Install UiAutomator2 driver
appium driver install uiautomator2

# Install Appium Flutter driver
appium driver install --source=npm appium-flutter-driver

# Install Appium Inpector plugin
appium plugin install --source=npm appium-inspector-plugin

# Verify installation
appium doctor --android
```

## Configuration

### Environment Variables

The `.env` file contains configuration for the test environment specially credentials which are sensible information:

```env
# Appium Configuration
PLATFORM_NAME = "Android"
PLATFORM_VERSION = "16"
DEVICE_NAME = "Medium Phone API 36"
AUTOMATION_NAME = "UiAutomator2"
APP_PACKAGE = "sn.sonatel.dsi.moussa.wade.moussawade"
APP_ACTIVITY = ".MainActivity"
APK_PATH = "/Users/mac/qa_test_looma_app/lab4_mobile/app-looma.apk"
NO_RESET = False
APPIUM_SERVER_URL = "http://localhost:4723"

# Test Credentials
VALID_USERNAME = "johnd"
VALID_PASSWORD = "m38rmF$"
INVALID_USERNAME = "invalid_user_for_testing_purposes"
INVALID_PASSWORD = "wrong_pass_for_testing_purposes"
```

**NOTE**: Pay attention to the APK_PATH environment variable, it should be set to the right location of your apk. It's recommend to update device information accordingly.

### Device Setup

1. **Android Emulator**:
   - Create AVD with API level 36
   - Device name: "Medium Phone API 36"
   - Ensure emulator is running before tests

2. **Physical Device**:
   - Enable Developer Options and USB Debugging
   - Connect via USB or WiFi ADB
   - Update `DEVICE_NAME` in `.env` accordingly

## Test Components

### Common Keywords (`resources/common_keywords.robot`)

#### Application Management

- **`Open My Application`**: Initializes Appium session with configured capabilities
- **`Open And Login To Application`**: Complete application setup with  where it's needed
- **`Close My Application`**: Properly closes Appium session

#### Element Interactions

- **`Wait And Click`**: Safe click with element visibility wait
- **`Wait And Input Text`**: Safe text input with visibility wait
- **`Fill Input By XPath`**: Comprehensive input filling (wait, click, input)
- **`Verify Element Text`**: Text content validation

#### Authentication

- **`Login`**: Performs login with username/password credentials
- **`Verify Login Error Modal`**: Validates authentication error messages
- **`Verify Product Creation Page Displayed`**: Confirms successful login

#### Product Management

- **`Fill Product Details`**: Completes product creation form
- **`Verify Required Field Message`**: Validates form field requirements

### UI Locators (`resources/locators.py`)

XPath-based element locators organized by application screens:

#### Login Page

```python
LOGIN_TITLE = "//android.view.View[@content-desc=\"Connexion\"]"
USERNAME_INPUT = "//android.widget.FrameLayout[...]/android.widget.EditText[1]"
PASSWORD_INPUT = "//android.widget.FrameLayout[...]/android.widget.EditText[2]"
LOGIN_BUTTON = "//android.widget.Button[@content-desc=\"Se connecter\"]"
```

#### Error Modals

```python
ERROR_MODAL_TITLE = '//android.view.View[@content-desc="Erreur de connexion"]'
ERROR_MODAL_MESSAGE = "//android.view.View[@content-desc=\"Vérifiez vos identifiants.\"]"
ERROR_MODAL_OK_BUTTON = "//android.widget.Button[@content-desc=\"OK\"]"
```

#### Product Creation

```python
PRODUCT_CREATION_TITLE = '//android.view.View[@content-desc="Ajouter un produit"]'
PRODUCT_TITLE_INPUT = '//android.widget.FrameLayout[...]/android.widget.EditText[1]'
PRODUCT_PRICE_INPUT = '//android.widget.FrameLayout[...]/android.widget.EditText[2]'
# ... additional product form fields
```

### Variables (`resources/variables.py`)

Loads environment configuration and defines test data:

```python
# Environment-based configuration
APPIUM_SERVER_URL = os.getenv("APPIUM_SERVER_URL")
PLATFORM_NAME = os.getenv("PLATFORM_NAME", "Android")
VALID_USERNAME = os.getenv("VALID_USERNAME")
VALID_PASSWORD = os.getenv("VALID_PASSWORD")

# Test data
PRODUCT_TITLE = "DANVOUY Womens T Shirt Casual Cotton Short"
PRODUCT_PRICE = 12.99
PRODUCT_DESCRIPTION = "95%Cotton,5%Spandex, Features: Casual..."
PRODUCT_CATEGORY = "women's clothing"
PRODUCT_IMAGE_URL = "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg"
```

## Running Tests

### 1. Environment Setup

```bash
# Start Appium server
appium --port 4723

# Start Android emulator (if using emulator)
emulator -avd "Medium Phone API 36"

# Verify device connection
adb devices
```

### 2. Execute Test Suites

```bash
# Run all tests
robot tests/

# Run specific test suite
robot tests/login_tests.robot
robot tests/product_tests.robot

# Run tests with specific tags
robot --include ProductCreation tests/
robot --include Validation tests/

# Run with custom output directory
robot --outputdir results tests/

# Run with variable override
robot --variable DEVICE_NAME:"Your_Device_Name" tests/
```

### 3. Test Execution Examples

```bash
# Basic execution
cd /Users/mac/qa_test_looma_app/lab4_mobile
robot tests/

# Detailed execution with logs
robot --loglevel DEBUG --outputdir results tests/

# Run specific test case
robot --test "Should Login With Valid Credentials" tests/login_tests.robot

# Parallel execution (if multiple devices)
robot --variable DEVICE_NAME:emulator-5554 tests/ &
robot --variable DEVICE_NAME:emulator-5556 tests/ &
```

## Test Cases

### Login Tests (`tests/login_tests.robot`)

| Test Case | Description | Expected Result |
|-----------|-------------|----------------|
| **Should Display Login Page Correctly** | Verifies login page UI elements | Login form elements visible |
| **Should Not Login With Invalid Credentials** | Tests authentication with wrong credentials | Error modal displayed |
| **Should Login With Valid Credentials** | Tests successful login flow | Product creation page displayed |

### Product Tests (`tests/product_tests.robot`)

| Test Case | Description | Expected Result |
|-----------|-------------|----------------|
| **Should Be Able To Add A Product With All Details** | Complete product creation workflow | Product added to list |
| **Should Not Add Product With Missing Title** | Form validation for required title field | Error message displayed |
| **Should Not Add Product With Missing Price** | Form validation for required price field | Error message displayed |

## Test Reports

Robot Framework generates comprehensive reports after execution:

- **`report.html`**: High-level test execution summary
- **`log.html`**: Detailed step-by-step execution log with screenshots
- **`output.xml`**: Machine-readable test results for CI/CD integration

### Viewing Reports

```bash
# Open reports in browser
open report.html
open log.html

# Or specify custom output directory
robot --outputdir results tests/
open results/report.html
```

## Troubleshooting

### Common Issues and Solutions

#### 1. Variable Not Found Error

```text
Variable '${VALID_PASSWORD}' not found.
```

**Solution**: Ensure `.env` file exists and contains all required variables.

#### 2. Appium Connection Issues

```text
WebDriverException: Could not connect to the Appium server
```

**Solutions**:

- Verify Appium server is running: `appium --port 4723`
- Check device/emulator is connected: `adb devices`
- Ensure correct `APPIUM_SERVER_URL` in `.env`

#### 3. Element Not Found

```text
Element with locator 'xpath=...' not found
```

**Solutions**:

- Verify app UI hasn't changed
- Use Appium Inspector to validate XPath locators
- Check device resolution and app layout
- Increase wait timeouts in variables

#### 4. App Installation Issues

```text
An unknown server-side error occurred while processing the command
```

**Solutions**:

- Verify APK path is correct in `.env`
- Ensure device has sufficient storage
- Check app permissions and compatibility
- Try manual app installation: `adb install app-looma.apk`

#### 5. Timeout Issues

```text
Element did not appear within timeout
```

**Solutions**:

- Increase `DEFAULT_WAIT_TIME` in `variables.py`
- Check app performance on test device
- Verify network connectivity for image loading
- Use explicit waits for specific elements

### Debug Mode

```bash
# Run with maximum logging
robot --loglevel TRACE --outputdir debug_results tests/

# Run single test with debug info
robot --loglevel DEBUG --test "Should Login With Valid Credentials" tests/login_tests.robot
```

## 🎯 Best Practices Implemented

### Test Design

- **Page Object Pattern**: Locators separated from test logic
- **Data-Driven Testing**: External test data configuration
- **Modular Keywords**: Reusable test components
- **Clear Test Structure**: Readable and maintainable test cases

### Automation Framework

- **Explicit Waits**: Robust element synchronization
- **Environment Configuration**: Flexible deployment configuration
- **Error Handling**: Comprehensive error validation
- **Reporting**: Detailed execution logs and screenshots

### Maintenance

- **Centralized Locators**: Easy UI change management
- **Configuration Management**: Environment-specific settings
- **Version Control**: Clean repository structure
- **Documentation**: Comprehensive setup and usage guides

## Contributing

### Adding New Tests

1. Create test cases in appropriate `.robot` files
2. Add new locators to `locators.py`
3. Update variables in `variables.py` if needed
4. Add reusable keywords to `common_keywords.robot`
5. Update this README with new test documentation

### Locator Maintenance

- Use Appium Inspector to verify element locators
- Prefer content-desc attributes over complex XPath
- Group locators by application screen/functionality
- Document any complex locator logic

## License

This test suite is part of the QA testing laboratory exercises and is intended for educational purposes.
