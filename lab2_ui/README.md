# Lab 2 UI - Web Application Testing Suite

## Overview

This is a comprehensive Robot Framework test suite for web application UI testing using Selenium WebDriver. The project implements automated testing for a web application with focus on login functionality, customer management, and home page verification using the Page Object Model pattern.

## Project Structure

```text
lab2_ui/
├── README.md                     # This documentation
├── log.html                      # Test execution log (generated)
├── output.xml                    # Test results XML (generated)
├── report.html                   # Test execution report (generated)
├── pageobject/                   # Page Object Model implementation
│   ├── locators.py              # UI element locators
│   ├── test_data.py             # Test data and constants
│   ├── variables.py             # Configuration variables
│   └── __pycache__/             # Python cache files
├── resources/                    # Test resources
│   └── testCas.robot            # Common test keywords and resources
├── results/                     # Test execution artifacts
│   ├── log.html                 # Detailed execution log
│   ├── output.xml               # Machine-readable results
│   ├── report.html              # Summary report
│   └── selenium-screenshot-*.png # Test execution screenshots
└── testcases/                   # Test case definitions
    ├── add_customer_test.robot  # Customer addition test cases
    ├── login_test.robot         # Authentication test cases
    └── testCas.robot            # Home page verification tests
```

## Prerequisites

### Software Requirements

- **Python 3.8+** with pip
- **Robot Framework 6.1.1+**
- **Selenium WebDriver**
- **Web Browser** (Chrome, Firefox, etc.)
- **Browser Driver** (ChromeDriver, GeckoDriver, etc.)

### Python Dependencies

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
pip install selenium
```

### Browser Driver Setup

```bash
# For Chrome (using webdriver-manager)
pip install webdriver-manager

# Or download ChromeDriver manually and add to PATH
# https://chromedriver.chromium.org/
```

## Configuration

### Page Object Model Structure

The test suite implements the Page Object Model pattern with the following components:

#### Locators (`pageobject/locators.py`)

Contains all UI element selectors organized by page:

```python
# Login Page Locators
LOGIN_USERNAME = "id=email-id"
LOGIN_PASSWORD = "id=password"
LOGIN_BUTTON = "id=SignIn"

# Customer Page Locators
CUSTOMER_NAME_INPUT = "id=customer-name"
CUSTOMER_EMAIL_INPUT = "id=customer-email"
ADD_CUSTOMER_BUTTON = "id=add-customer"

# Navigation Elements
HOME_LINK = "xpath=//a[contains(text(),'Home')]"
LOGOUT_BUTTON = "id=logout"
```

#### Test Data (`pageobject/test_data.py`)

Defines test data and constants:

```python
# User Credentials
VALID_USERNAME = "test@example.com"
VALID_PASSWORD = "password123"

# Customer Data
CUSTOMER_NAME = "John Doe"
CUSTOMER_EMAIL = "john.doe@example.com"

# Test Constants
DEFAULT_TIMEOUT = 10
```

#### Variables (`pageobject/variables.py`)

Contains configuration variables and settings:

```python
# Browser Configuration
BROWSER = "Chrome"
HEADLESS = False
IMPLICIT_WAIT = 10

# Application URLs
BASE_URL = "https://example-app.com"
LOGIN_URL = "${BASE_URL}/login"
```

## Test Cases

### Login Tests (`testcases/login_test.robot`)

| Test Case | Description | Tags | Expected Result |
|-----------|-------------|------|----------------|
| **Test Login** | Tests successful login with valid credentials | `login`, `smoke` | User successfully logged in |

**Test Coverage:**

- Valid credential authentication
- Login page element verification
- Post-login navigation validation

### Customer Tests (`testcases/add_customer_test.robot`)

| Test Case | Description | Tags | Expected Result |
|-----------|-------------|------|----------------|
| **Test Add Customer** | Tests customer creation functionality | `customer`, `smoke` | Customer successfully added |

**Test Coverage:**

- Customer form field validation
- Customer data submission
- Success message verification
- Customer list update confirmation

### Home Page Tests (`testcases/testCas.robot`)

| Test Case | Description | Tags | Expected Result |
|-----------|-------------|------|----------------|
| **Vérification de la page d'accueil** | Verifies home page elements and functionality | `home`, `smoke` | Home page displays correctly |

**Test Coverage:**

- Home page element presence
- Navigation menu functionality
- Page content verification

## Running Tests

### Basic Execution

```bash
# Navigate to project directory
cd /Users/mac/qa_test_looma_app/lab2_ui

# Run all tests
robot testcases/

# Run specific test suite
robot testcases/login_test.robot
robot testcases/add_customer_test.robot
robot testcases/testCas.robot
```

### Advanced Execution Options

```bash
# Run tests with specific tags
robot --include smoke testcases/
robot --include login testcases/
robot --include customer testcases/

# Run tests with custom browser
robot --variable BROWSER:Firefox testcases/

# Run tests in headless mode
robot --variable HEADLESS:True testcases/

# Generate reports in custom directory
robot --outputdir results testcases/

# Run with specific log level
robot --loglevel DEBUG testcases/

# Run tests with custom timeout
robot --variable DEFAULT_TIMEOUT:15 testcases/
```

### Parallel Execution

```bash
# Run tests in parallel (requires pabot)
pip install robotframework-pabot
pabot --processes 2 testcases/
```

## Test Reports

The test suite generates comprehensive reports after execution:

### Generated Files

- **[`report.html`](report.html)**: Executive summary with pass/fail statistics
- **[`log.html`](log.html)**: Detailed step-by-step execution log with screenshots
- **[`output.xml`](output.xml)**: Machine-readable test results for CI/CD integration

### Test Statistics

Based on the current test execution:

- **Total Tests**: 3
- **Passed**: 3 (100%)
- **Failed**: 0 (0%)
- **Skipped**: 0 (0%)
- **Total Execution Time**: 00:00:06

### Test Suite Breakdown

- **Add Customer Test**: 1 test, 0:00:18 elapsed
- **Login Test**: 1 test, 0:00:05 elapsed  
- **Home Page Test**: 1 test, 0:00:01 elapsed

### Tag Statistics

- **customer**: 1 test (0:00:05)
- **home**: 1 test (0:00:00)
- **login**: 1 test (0:00:01)
- **smoke**: 3 tests (0:00:06)

## Common Keywords (`resources/testCas.robot`)

The test suite includes reusable keywords for common operations:

### Browser Management

- **Open Browser To Login Page**: Opens browser and navigates to login
- **Close Browser**: Properly closes browser session

### Element Interactions

- **Wait Until Element Is Visible**: Robust element waiting
- **Click Element With Wait**: Safe clicking with visibility check
- **Input Text With Wait**: Safe text input with validation

### Verification Keywords

- **Verify Page Contains Text**: Text presence validation
- **Verify Element Attribute**: Element attribute verification
- **Take Screenshot On Failure**: Automatic screenshot capture on test failure

## Troubleshooting

### Common Issues and Solutions

#### 1. Browser Driver Issues

```text
WebDriverException: 'chromedriver' executable needs to be in PATH
```

**Solutions**:

- Install webdriver-manager: `pip install webdriver-manager`
- Download ChromeDriver manually and add to system PATH
- Use WebDriverManager in your test setup

#### 2. Element Not Found

```text
ElementNotVisibleException: Element is not currently visible
```

**Solutions**:

- Increase implicit wait time in variables
- Use explicit waits for dynamic elements
- Verify element locators with browser developer tools
- Check for page load completion

#### 3. Browser Launch Issues

```text
WebDriverException: unknown error: Chrome failed to start
```

**Solutions**:

- Ensure Chrome browser is installed
- Try running in headless mode
- Check Chrome version compatibility with ChromeDriver
- Verify system permissions

#### 4. Test Data Issues

```text
Variable '${VALID_USERNAME}' not found
```

**Solutions**:

- Verify test_data.py contains required variables
- Check import statements in robot files
- Ensure proper Python path configuration

### Debug Mode

```bash
# Run with maximum logging
robot --loglevel TRACE --outputdir debug_results testcases/

# Run single test with debug info
robot --loglevel DEBUG --test "Test Login" testcases/login_test.robot

# Capture screenshots on failure
robot --variable CAPTURE_SCREENSHOTS:True testcases/
```

## Best Practices Implemented

### Test Design

- **Page Object Model**: Clean separation of test logic and UI elements
- **Data-Driven Testing**: External test data management
- **Modular Keywords**: Reusable test components
- **Clear Test Structure**: Readable and maintainable test cases

### Automation Framework

- **Explicit Waits**: Robust element synchronization
- **Screenshot Capture**: Visual debugging on failures
- **Comprehensive Logging**: Detailed execution tracking
- **Cross-Browser Support**: Multi-browser compatibility

### Maintenance

- **Centralized Locators**: Easy UI change management
- **Configuration Management**: Environment-specific settings
- **Version Control**: Clean repository structure
- **Documentation**: Comprehensive setup and usage guides

## Contributing

### Adding New Tests

1. Create test cases in appropriate `.robot` files under `testcases/`
2. Add new locators to `pageobject/locators.py`
3. Update test data in `pageobject/test_data.py` if needed
4. Add reusable keywords to `resources/testCas.robot`
5. Update this README with new test documentation

### Locator Maintenance

- Use browser developer tools to verify element selectors
- Prefer stable locators (id, name) over fragile ones (xpath with indices)
- Group locators by page/functionality in locators.py
- Document any complex locator strategies

### Test Data Management

- Keep sensitive data in environment variables
- Use meaningful test data that reflects real scenarios
- Organize test data by feature/functionality
- Consider data cleanup after test execution

## Support

For issues and questions:

1. Check troubleshooting section above
2. Review Robot Framework SeleniumLibrary documentation
3. Verify browser and driver compatibility
4. Check test execution logs for detailed error information

## License

This test suite is part of the QA testing laboratory exercises and is intended for educational purposes.
