# Lab 2 UI - Web Application CRM Testing Suite

## Authors

**Bassine DIALLO**  
**Mohamed SENGHOR**

## Overview

This is a comprehensive Robot Framework test suite for automated web UI testing of a Customer Relationship Management (CRM) application. The project focuses on testing user authentication, customer management functionality, and home page verification using Selenium WebDriver and the Page Object Model pattern.

## Project Structure

```text
lab2_ui/
├── README.md                     # This documentation
├── fr/                          # French documentation
│   └── README.md                # French version of documentation
├── pageobject/                  # Page Object Model implementation
│   ├── locators.py              # UI element locators (empty - integrated in test files)
│   ├── test_data.py             # Test data definitions (empty - using variables.py)
│   ├── variables.py             # Configuration variables and test data
│   └── __pycache__/             # Python cache files
├── resources/                   # Test resources and keywords
│   └── testCas.robot            # Common test keywords and utilities
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
- **Chrome Browser** (primary test browser)
- **ChromeDriver** (automatically managed by Selenium)

### Python Dependencies

#### requirements.txt

```text
robotframework==6.1.1
robotframework-seleniumlibrary==6.2.0
selenium==4.15.0
```

```bash
pip install -r requirements.txt
```

### Browser Setup

The test suite is configured to use Chrome browser by default. Ensure Chrome is installed and accessible.

## Configuration

### Application Configuration (`pageobject/variables.py`)

```python
# Application URL
URL = "https://automationplayground.com/crm/"
BROWSER = "chrome"

# Authentication Credentials
USERNAME_AUTOMATION = "admin@robotframeworktutorial.com"
PASSWORD_AUTOMATION = "pwd"

# Test Customer Data
TEST_CUSTOMER_EMAIL = "bassinediallo@gmail.com"
TEST_CUSTOMER_FIRST_NAME = "Bassine"
TEST_CUSTOMER_LAST_NAME = "Diallo"
TEST_CUSTOMER_CITY = "New York"
TEST_CUSTOMER_STATE = "NY"
TEST_CUSTOMER_GENDER = "Female"
TEST_CUSTOMER_PROMOTION = "Yes"
```

### Common Keywords (`resources/testCas.robot`)

Provides reusable keywords for browser management and page interactions:

```robot
*** Keywords ***
Ouvrir le navigateur
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    1

Aller à l'adresse de la page d'accueil
    Go To    ${URL}
    Wait Until Page Contains     Customers Are Priority One!

Vérifier le contenu de la page d'accueil
    Page Should Contain Element    //*[@id="feature"]/div/div/div[1]/h2

Fermer le navigateur
    Close Browser
```

## Test Components

### Common Keywords (`resources/testCas.robot`)

The test suite provides reusable keywords for web application interactions:

#### Browser Management

- **`Ouvrir le navigateur`**: Opens Chrome browser and navigates to application URL
- **`Fermer le navigateur`**: Properly closes browser session
- **Browser Configuration**: Maximizes window and sets initial wait time

#### Page Navigation

- **`Aller à l'adresse de la page d'accueil`**: Navigates to home page with validation
- **`Vérifier le contenu de la page d'accueil`**: Validates home page content elements

#### Element Interactions

- Uses explicit waits for element visibility
- Implements XPath and CSS selectors for element location
- Provides form input and validation capabilities

## Running Tests

### 1. Environment Setup

```bash
# Navigate to project directory
cd /Users/mac/qa_test_looma_app/lab2_ui

# Install Python dependencies
pip install -r requirements.txt

# Verify Selenium installation
python -c "from selenium import webdriver; print('Selenium installed successfully')"
```

### 2. Execute Test Suites

```bash
# Run all tests
robot testcases/

# Run specific test file
robot testcases/login_test.robot
robot testcases/add_customer_test.robot
robot testcases/testCas.robot

# Run tests with detailed logging
robot --loglevel DEBUG testcases/

# Generate reports in custom directory
robot --outputdir results testcases/
```

### 3. Test Execution Examples

```bash
# Basic execution
robot testcases/

# Detailed execution with logs
robot --loglevel DEBUG --outputdir results testcases/

# Run specific test case
robot --test "Test Login" testcases/login_test.robot

# Run tests with tags
robot --include smoke testcases/
robot --include customer testcases/

# Run with custom browser (if configured)
robot --variable BROWSER:firefox testcases/
```

## Test Cases

### Home Page Tests (`testcases/testCas.robot`)

| Test Case | Description | Tags | Expected Result |
|-----------|-------------|------|----------------|
| **Vérification de la page d'accueil** | Verifies home page elements and content | `smoke`, `home` | Home page displays correctly with expected content |

**Test Coverage**:

- Home page accessibility
- Main content element presence
- Page title and header validation

### Authentication Tests (`testcases/login_test.robot`)

| Test Case | Description | Tags | Expected Result |
|-----------|-------------|------|----------------|
| **Test Login** | Tests successful login with valid credentials | `smoke`, `login` | User successfully authenticated and redirected |

**Test Coverage**:

- Login form accessibility
- Valid credential authentication
- Post-login page navigation

**Test Steps**:

1. Click Sign In button
2. Wait for login page to load
3. Enter valid username and password
4. Submit login form

### Customer Management Tests (`testcases/add_customer_test.robot`)

| Test Case | Description | Tags | Expected Result |
|-----------|-------------|------|----------------|
| **Test Add Customer** | Tests complete customer creation workflow | `smoke`, `customer` | Customer successfully added with success message |

**Test Coverage**:

- End-to-end customer creation process
- Form field validation and input
- Success message confirmation

**Test Steps**:

1. **Authentication**: Login with valid credentials
2. **Navigation**: Click "New Customer" button
3. **Form Completion**: Fill customer details
   - Email address
   - First and last name
   - City and state selection
   - Gender selection
4. **Submission**: Submit customer form
5. **Verification**: Confirm success message

## Element Locators

The test suite uses various locator strategies:

### Authentication Elements

```robot
Click Element    //*[@id="SignIn"]              # Sign in button
Input Text       //input[@id='email-id']       # Username field
Input Text       //input[@id='password']       # Password field
Click Element    //*[@id="submit-id"]          # Submit button
```

### Customer Form Elements

```robot
Click Element    id=new-customer               # New customer button
Input Text       id=EmailAddress               # Email field
Input Text       id=FirstName                  # First name field
Input Text       id=LastName                   # Last name field
Input Text       id=City                       # City field
Select From List By Value    id=StateOrRegion  # State dropdown
Click Element    xpath=//input[@name='gender'][@value='male']  # Gender radio
Click Button     css=button.btn.btn-primary    # Submit button
```

## Test Reports

Robot Framework generates comprehensive reports after execution:

- **`report.html`**: High-level test execution summary with statistics
- **`log.html`**: Detailed step-by-step execution log with screenshots
- **`output.xml`**: Machine-readable test results for CI/CD integration

### Viewing Reports

```bash
# Open reports in browser
open report.html
open log.html

# Or specify custom output directory
robot --outputdir results testcases/
open results/report.html
```

## Troubleshooting

### Common Issues and Solutions

#### 1. Browser Driver Issues

```text
WebDriverException: 'chromedriver' executable needs to be in PATH
```

**Solutions**:

- Selenium 4.x automatically manages ChromeDriver
- Ensure Chrome browser is installed and up-to-date
- For manual driver management, download ChromeDriver and add to PATH

#### 2. Element Not Found

```text
ElementNotVisibleException: Element is not currently visible
```

**Solutions**:

- Increase wait timeouts in test keywords
- Use explicit waits: `Wait Until Element Is Visible`
- Verify element locators with browser developer tools
- Check for dynamic content loading

#### 3. Login Issues

```text
Page should have contained text 'expected_text' but did not
```

**Solutions**:

- Verify application URL accessibility
- Check login credentials in [`pageobject/variables.py`](pageobject/variables.py)
- Ensure application is available and responsive
- Validate network connectivity

#### 4. Form Submission Issues

```text
Element with locator 'id=new-customer' not found
```

**Solutions**:

- Ensure successful login before customer operations
- Add explicit waits after login: `Wait Until Element Is Visible`
- Verify user permissions for customer creation
- Check application UI for changes

### Debug Mode

```bash
# Run with maximum logging
robot --loglevel TRACE --outputdir debug_results testcases/

# Run single test with debug info
robot --loglevel DEBUG --test "Test Add Customer" testcases/add_customer_test.robot

# Capture screenshots on failure
robot --variable CAPTURE_SCREENSHOTS:True testcases/
```

## Test Data Management

### Customer Test Data

The test suite uses predefined customer data from [`pageobject/variables.py`](pageobject/variables.py):

```python
TEST_CUSTOMER_EMAIL = "bassinediallo@gmail.com"
TEST_CUSTOMER_FIRST_NAME = "Bassine"
TEST_CUSTOMER_LAST_NAME = "Diallo"
TEST_CUSTOMER_CITY = "New York"
TEST_CUSTOMER_STATE = "NY"
TEST_CUSTOMER_GENDER = "Female"
TEST_CUSTOMER_PROMOTION = "Yes"
```

### Authentication Credentials

```python
USERNAME_AUTOMATION = "admin@robotframeworktutorial.com"
PASSWORD_AUTOMATION = "pwd"
```

**Note**: These are test credentials for the automation playground environment.

## Best Practices Implemented

### Test Design

- **Page Object Pattern**: Separation of test data and locators
- **Reusable Keywords**: Common browser operations abstracted
- **Explicit Waits**: Robust element synchronization
- **Tag-Based Organization**: Smoke and functional test categorization

### Automation Framework

- **Browser Management**: Proper setup and teardown procedures
- **Error Handling**: Graceful handling of element location failures
- **Screenshot Capture**: Automatic visual debugging on failures
- **Detailed Logging**: Comprehensive execution tracking

### Maintenance

- **Centralized Configuration**: Variables managed in single location
- **Modular Structure**: Clear separation between resources and test cases
- **French Localization**: Multi-language documentation support
- **Version Control**: Appropriate `.gitignore` for generated files

## Contributing

### Adding New Test Cases

1. Create test cases in appropriate `.robot` files under [`testcases/`](testcases/)
2. Add new test data to [`pageobject/variables.py`](pageobject/variables.py)
3. Update common keywords in [`resources/testCas.robot`](resources/testCas.robot) if needed
4. Add element locators directly in test files or create centralized locator file
5. Update this README with new test documentation

### Locator Management

- Use stable locators (id, name) when available
- Prefer CSS selectors over complex XPath expressions
- Document complex locator strategies
- Test locators across different browser versions

### Test Data Best Practices

- Use meaningful test data that reflects real scenarios
- Consider data cleanup after test execution
- Implement data-driven testing for multiple scenarios
- Keep sensitive data in environment variables

## License

This test suite is part of the QA testing laboratory exercises and is intended for educational purposes.

## Technologies & Frameworks

- **Robot Framework** 6.1.1+
- **Python** 3.8+
- **Selenium WebDriver** 4.15.0+ for web automation
- **SeleniumLibrary** 6.2.0+ for Robot Framework integration
- **Chrome Browser** with automatic driver management
