# QA Test Laboratory - Comprehensive Testing Suite

## Authors

**Bassine DIALLO**  
**Mohamed SENGHOR**

## Overview

This repository contains a comprehensive collection of automated testing laboratories covering the full spectrum of Quality Assurance practices. The project demonstrates professional testing methodologies across different application types and technologies, implementing industry best practices with Robot Framework.

## Repository Structure

```text
qa_test_looma_app/
├── README.md                     # This documentation
├── .gitignore                    # Version control exclusions
├── lab1_mongodb/                 # Database Testing Laboratory
│   ├── pageobjects/             # MongoDB connection & data objects
│   ├── resources/               # Database test resources
│   └── testcases/               # Database operation test cases
├── lab2_ui/                     # Web UI Testing Laboratory
│   ├── pageobject/              # Page Object Model implementation
│   ├── resources/               # UI test keywords and utilities
│   ├── testcases/               # Web application test cases
│   └── results/                 # Test execution reports
├── lab3_api/                    # API Testing Laboratory
│   ├── README.md                # API testing documentation
│   ├── fr/README.md             # French documentation
│   ├── pageobjects/             # API endpoints and configuration
│   ├── resources/               # API test keywords
│   └── testcases/               # REST API test cases
└── lab4_mobile/                 # Mobile Testing Laboratory
    ├── README.md                # Mobile testing documentation
    ├── fr/README.md             # French documentation
    ├── .env                     # Environment configuration
    ├── app-looma.apk            # Android test application
    ├── resources/               # Mobile test utilities
    └── tests/                   # Mobile application test cases
```

## Testing Laboratories

### Lab 1: Database Testing (lab1_mongodb)

**Objective**: Automated testing of MongoDB database operations

**Technologies**:

- MongoDB Database
- PyMongo Driver
- Robot Framework with custom Python libraries

**Test Coverage**:

- Database connection and authentication
- CRUD operations validation
- Data integrity verification
- Performance testing scenarios

### Lab 2: Web UI Testing (lab2_ui)

**Objective**: Automated web application user interface testing

**Technologies**:

- Selenium WebDriver
- Robot Framework SeleniumLibrary
- Page Object Model pattern
- Cross-browser compatibility

**Test Coverage**:

- User authentication flows
- Customer management functionality
- Home page verification
- Form validation and error handling

### Lab 3: API Testing (lab3_api)

**Objective**: Comprehensive REST API testing using eBay sandbox environment

**Technologies**:

- eBay Fulfillment & Finance APIs
- OAuth 2.0 authentication
- Robot Framework RequestsLibrary
- HTTP/REST protocols

**Test Coverage**:

- Authentication and authorization
- Order management operations
- Financial transaction processing
- Error handling and validation

**Documentation**: Available in [English](lab3_api/README.md) and [French](lab3_api/fr/README.md)

### Lab 4: Mobile Testing (lab4_mobile)

**Objective**: Native Android application testing with Appium

**Technologies**:

- Appium WebDriver
- Android SDK
- Robot Framework AppiumLibrary
- Mobile device automation

**Test Coverage**:

- Mobile application installation and launch
- User authentication on mobile devices
- Product management workflows
- Mobile UI element interactions

**Documentation**: Available in [English](lab4_mobile/README.md) and [French](lab4_mobile/fr/README.md)

## Prerequisites

### System Requirements

- **Python 3.8+** with pip package manager
- **Robot Framework 6.1.1+**
- **Git** for version control
- **Java JDK 8+** (for mobile testing)
- **Node.js 14+** (for Appium)

### Development Tools

- **Git** (Version control)
- **Visual Studio Code** (IDE)
- **Appium Inspector** (Mobile element inspection)
- **MongoDB Compass** (Database management)
- **IDE**: Visual Studio Code (recommended) or PyCharm
- **Browser Drivers**: ChromeDriver, GeckoDriver (for web testing)
- **Mobile Tools**: Android SDK, Appium Inspector
- **Database Tools**: MongoDB Compass (optional)

## Quick Start

### 1. Repository Setup

```bash
# Clone the repository
git clone <repository-url>
cd qa_test_looma_app

# Install Python dependencies (create requirements.txt as needed)
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-requests
pip install robotframework-appiumlibrary
pip install pymongo
pip install python-dotenv
```

### 2. Environment Configuration

```bash
# Copy environment template (for mobile testing)
cp lab4_mobile/.env.example lab4_mobile/.env

# Edit configuration files as needed
# Update API tokens, database connections, device settings
```

### 3. Run Individual Labs

```bash
# Database Testing
cd lab1_mongodb && robot testcases/

# Web UI Testing  
cd lab2_ui && robot testcases/

# API Testing
cd lab3_api && robot testcases/

# Mobile Testing (requires Appium server)
cd lab4_mobile && robot tests/
```

## Testing Methodologies Implemented

### Test Design Patterns

- **Page Object Model**: Clean separation of UI elements and test logic
- **Data-Driven Testing**: External test data management and parameterization
- **Keyword-Driven Testing**: Reusable test components and business logic
- **Behavior-Driven Development**: Clear, readable test scenarios

### Automation Framework Features

- **Cross-Platform Compatibility**: Web, mobile, and API testing
- **Parallel Execution**: Concurrent test execution capabilities
- **Comprehensive Reporting**: Detailed HTML reports with screenshots
- **Error Handling**: Robust exception management and recovery
- **Environment Management**: Flexible configuration for different environments

### Quality Assurance Practices

- **Test Coverage Analysis**: Comprehensive functionality coverage
- **Regression Testing**: Automated validation of existing features
- **Integration Testing**: End-to-end workflow validation
- **Performance Monitoring**: Response time and load testing
- **Security Testing**: Authentication and authorization validation

## Test Execution

- Review environment configuration files (`.env`, variables)
- Check application availability and versions
- Verify test data prerequisites and dependencies
- Monitor system resources during parallel execution

### Individual Laboratory Execution

```bash
# Run specific test laboratory
robot lab1_mongodb/testcases/           # Database tests
robot lab2_ui/testcases/                # Web UI tests  
robot lab3_api/testcases/               # API tests
robot lab4_mobile/tests/                # Mobile tests
```

### Advanced Execution Options

```bash
# Detailed logging with custom output directory
robot --loglevel DEBUG --outputdir results lab2_ui/testcases/

# Tag-based execution
robot --include smoke lab3_api/testcases/
robot --exclude slow lab4_mobile/tests/

# Variable override
robot --variable BROWSER:Firefox lab2_ui/testcases/
robot --variable DEVICE_NAME:"Custom Device" lab4_mobile/tests/

# Parallel execution (requires pabot)
pabot --processes 4 lab*/testcases/
```

## Test Reports and Analysis

### Generated Artifacts

- **`report.html`**: Executive test execution summary
- **`log.html`**: Detailed step-by-step execution logs
- **`output.xml`**: Machine-readable results
- **Screenshots**: Automatic capture on failures (UI/Mobile tests)

### Report Analysis

```bash
# Open comprehensive reports
open report.html      # Cross-platform summary
open log.html         # Detailed execution traces

# Laboratory-specific reports
open lab2_ui/results/report.html
open lab4_mobile/results/report.html
```

## Best Practices Demonstrated

### Architecture & Design

- **Modular Framework Structure**: Reusable components across laboratories
- **Configuration Management**: Environment-specific settings and credentials
- **Version Control Integration**: Clean repository structure with appropriate `.gitignore`
- **Documentation Standards**: Comprehensive README files in multiple languages

### Security & Compliance

- **Credential Management**: Secure handling of API tokens and passwords
- **Environment Isolation**: Separate sandbox/production configurations
- **Access Control**: Proper authentication and authorization testing
- **Data Privacy**: Sensitive information exclusion from version control

### Maintenance & Scalability

- **Centralized Locators**: Easy maintenance of UI element selectors
- **Reusable Keywords**: Common functionality abstraction
- **Error Recovery**: Graceful handling of test failures and timeouts
- **Cross-Browser/Device Support**: Multi-platform test execution

### Best Practices for Contributors

- Follow Robot Framework naming conventions
- Implement proper error handling and logging
- Add comprehensive test documentation
- Use meaningful test data and assertions
- Consider cross-platform compatibility

## Troubleshooting

### Common Issues

#### Environment Setup

- Verify Python and Robot Framework installation
- Check browser driver compatibility and PATH configuration
- Ensure mobile device/emulator connectivity for Lab 4
- Validate API credentials and network connectivity for Lab 3

#### Debug Mode

```bash
# Maximum logging for troubleshooting
robot --loglevel TRACE --outputdir debug_results testcases/

# Single test debugging
robot --test "Specific Test Name" --loglevel DEBUG testcases/
```

## Support and Resources

### Documentation Links

- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Selenium Documentation](https://selenium-python.readthedocs.io/)
- [Appium Documentation](http://appium.io/docs/en/about-appium/intro/)
- [MongoDB Testing Guide](https://docs.mongodb.com/manual/testing/)

### Laboratory-Specific Help

- **Lab 1**: Database connection and PyMongo integration
- **Lab 2**: Web element location and browser compatibility
- **Lab 3**: API authentication and endpoint testing
- **Lab 4**: Mobile device setup and Appium configuration

## License

This comprehensive testing suite is developed for educational and professional development purposes, demonstrating industry-standard QA automation practices and methodologies.

## Technologies & Frameworks

### Core Framework

- **Robot Framework** 6.1.1+ (Test automation framework)
- **Python** 3.8+ (Programming language)

### Testing Libraries

- **SeleniumLibrary** (Web UI automation)
- **RequestsLibrary** (HTTP API testing)  
- **AppiumLibrary** (Mobile automation)
- **PyMongo** (MongoDB integration)
