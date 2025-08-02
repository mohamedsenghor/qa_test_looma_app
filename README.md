# QA Test Laboratory - Comprehensive Testing Suite

## Authors

**Bassine DIALLO**  
**Mohamed SENGHOR**

## Overview

This repository contains a comprehensive collection of automated testing laboratories covering the full spectrum of Quality Assurance practices. The project demonstrates professional testing methodologies across different application types and technologies, implementing industry best practices with Robot Framework. Each laboratory showcases expertise in a specific testing domain while maintaining consistent architectural patterns and documentation standards.

## Livrables attendus

- [Document PowerPoint de restitution des travaux](https://app.slidespeak.co/presentation/cmdtepfyf000abyrtmor1apmj/share)
- [Dépôt GitHub du projet](https://github.com/mohamedsenghor/qa_test_looma_app.git)

## Repository Structure

```text
qa_test_looma_app/
├── README.md                     # This documentation
├── .gitignore                    # Version control exclusions
├── fr/                          # French documentation
│   └── README.md                # Complete French documentation
├── lab1_mongodb/                 # Database Testing Laboratory
│   ├── README.md                # Lab 1 documentation
│   ├── fr/README.md             # French documentation
│   ├── pageobjects/             # MongoDB connection & data objects
│   │   ├── mongodb_lib.py       # MongoDB operations library
│   │   ├── variables.py         # Database configuration
│   │   └── locators.py          # Database field definitions
│   ├── resources/               # Database test resources
│   │   └── MongoDBKeywords.robot # Reusable database keywords
│   └── testcases/               # Database operation test cases
│       ├── TestProducts.robot   # Product CRUD test cases
│       └── TestOtherEntities.robot # User, Order, Category tests
├── lab2_ui/                     # Web UI Testing Laboratory
│   ├── README.md                # Lab 2 documentation
│   ├── fr/README.md             # French documentation
│   ├── pageobject/              # Page Object Model implementation
│   │   └── variables.py         # Configuration variables and test data
│   ├── resources/               # UI test keywords and utilities
│   │   └── testCas.robot        # Common test keywords and utilities
│   └── testcases/               # Web application test cases
│       ├── add_customer_test.robot # Customer management tests
│       ├── login_test.robot     # Authentication test cases
│       └── testCas.robot        # Home page verification tests
├── lab3_api/                    # API Testing Laboratory
│   ├── README.md                # Lab 3 documentation
│   ├── fr/README.md             # French documentation
│   ├── pageobjects/             # API endpoints and configuration
│   │   ├── locators.py          # API endpoint definitions
│   │   └── variables.py         # Test variables and configuration
│   ├── resources/               # API test keywords
│   │   ├── ebay_config.py       # eBay API configuration
│   │   └── ebay_keywords.robot  # Reusable API test keywords
│   └── testcases/               # REST API test cases
│       └── ebay_api_tests.robot # eBay API test cases with fallback
└── lab4_mobile/                 # Mobile Testing Laboratory
    ├── README.md                # Lab 4 documentation
    ├── fr/README.md             # French documentation
    ├── .env                     # Environment configuration
    ├── app-looma.apk            # Android test application
    ├── resources/               # Mobile test utilities
    │   ├── common_keywords.robot # Reusable test keywords
    │   ├── locators.py          # UI element locators (XPath)
    │   └── variables.py         # Test variables and configuration
    └── tests/                   # Mobile application test cases
        ├── login_tests.robot    # Authentication test cases
        └── product_tests.robot  # Product management test cases
```

## Testing Laboratories

### Lab 1: Database Testing (lab1_mongodb)

**Objective**: Automated testing of MongoDB database operations across multiple entities

**Technologies**:

- MongoDB Database (Atlas/Local)
- PyMongo Driver 4.6.0+
- Robot Framework with custom Python libraries
- BSON for document handling

**Test Coverage**:

- Database connection and authentication
- CRUD operations validation (Products, Users, Orders, Categories)
- Data integrity verification and field validation
- Multi-entity relationship testing
- ObjectId handling and error management

**Key Features**:

- **Multi-Entity Support**: Products, Users, Orders, Categories
- **Comprehensive Validation**: Email validation, price validation, unique constraints
- **Error Handling**: Graceful handling of invalid ObjectIds and missing fields
- **Data Isolation**: Each test creates its own test data

**Documentation**: Available in [English](lab1_mongodb/README.md) and [French](lab1_mongodb/fr/README.md)

### Lab 2: Web UI Testing (lab2_ui)

**Objective**: Automated web application user interface testing using CRM application

**Technologies**:

- Selenium WebDriver 4.15.0+
- Robot Framework SeleniumLibrary 6.2.0+
- Page Object Model pattern implementation
- Chrome Browser with automatic driver management

**Test Coverage**:

- User authentication flows and security validation
- Customer management functionality (CRUD operations)
- Home page verification and content validation
- Form validation and error handling
- Cross-browser compatibility testing

**Key Features**:

- **Automatic Driver Management**: Selenium 4.x handles ChromeDriver automatically
- **Explicit Waits**: Robust element synchronization
- **French Localization**: Test keywords in French language
- **Modular Design**: Clear separation between resources and test cases

**Documentation**: Available in [English](lab2_ui/README.md) and [French](lab2_ui/fr/README.md)

### Lab 3: API Testing (lab3_api)

**Objective**: Comprehensive REST API testing using eBay sandbox environment with fallback mechanism

**Technologies**:

- eBay Fulfillment & Finance APIs
- OAuth 2.0 authentication and token management
- Robot Framework RequestsLibrary
- HTTP/REST protocols with JSON data exchange
- Mock response system for fallback scenarios

**Test Coverage**:

- Authentication and authorization (OAuth 2.0)
- Order management operations (GET orders, order details)
- Financial transaction processing (refunds)
- Error handling and validation (401, 404, 400 responses)
- Fallback mechanism for sandbox unavailability

**Key Features**:

- **Automatic Fallback**: Mock responses when eBay sandbox is unavailable
- **Dual Configuration**: Separate config files for different purposes
- **Comprehensive Error Testing**: Invalid tokens, missing orders, network issues
- **CI/CD Friendly**: Tests never fail due to external service unavailability

**Documentation**: Available in [English](lab3_api/README.md) and [French](lab3_api/fr/README.md)

### Lab 4: Mobile Testing (lab4_mobile)

**Objective**: Native Android application testing using Appium automation framework

**Technologies**:

- Appium WebDriver with UiAutomator2 driver
- Android SDK and platform tools
- Robot Framework AppiumLibrary 2.0.0+
- Mobile device automation (emulator/physical device)
- XPath-based element location strategies

**Test Coverage**:

- Mobile application installation and launch
- User authentication on mobile devices
- Product management workflows and form validation
- Mobile UI element interactions and navigation
- Error handling and validation messages

**Key Features**:

- **Environment Configuration**: Flexible device and app configuration via .env file
- **XPath Locators**: Comprehensive element location strategies
- **Form Validation**: Required field testing and error message verification
- **Appium Integration**: Full mobile automation stack with proper setup

**Documentation**: Available in [English](lab4_mobile/README.md) and [French](lab4_mobile/fr/README.md)

## Prerequisites

### System Requirements

- **Python 3.8+** with pip package manager
- **Robot Framework 6.1.1+**
- **Git** for version control
- **Java JDK 8+** (required for mobile testing)
- **Node.js 14+** (required for Appium)

### Development Tools

- **IDE**: Visual Studio Code (recommended) or PyCharm
- **Version Control**: Git with appropriate .gitignore configurations
- **Browser Drivers**: ChromeDriver (automatically managed by Selenium 4.x)
- **Mobile Tools**: Android SDK, Appium Inspector, Android Emulator
- **Database Tools**: MongoDB Compass (optional for database management)
- **API Tools**: Postman (optional for API endpoint testing)

### Core Dependencies

```bash
# Core framework
pip install robotframework==6.1.1

# Web UI Testing
pip install robotframework-seleniumlibrary==6.2.0
pip install selenium==4.15.0

# API Testing
pip install robotframework-requests==0.9.0
pip install requests==2.31.0

# Database Testing
pip install pymongo==4.6.0
pip install bson==0.5.10

# Mobile Testing
pip install robotframework-appiumlibrary==2.0.0
pip install Appium-Python-Client==2.11.1

# Environment Management
pip install python-dotenv
```

## Quick Start

### 1. Repository Setup

```bash
# Clone the repository
git clone <repository-url>
cd qa_test_looma_app

# Install all Python dependencies
pip install robotframework==6.1.1
pip install robotframework-seleniumlibrary==6.2.0
pip install robotframework-requests==0.9.0
pip install robotframework-appiumlibrary==2.0.0
pip install pymongo==4.6.0
pip install python-dotenv
```

### 2. Environment Configuration

```bash
# Database Testing (Lab 1)
# Update MongoDB connection string in lab1_mongodb/pageobjects/variables.py

# Web UI Testing (Lab 2)
# Ensure Chrome browser is installed and up-to-date

# API Testing (Lab 3)
# Update eBay OAuth tokens in lab3_api/pageobjects/variables.py

# Mobile Testing (Lab 4)
# Copy and configure environment file
cp lab4_mobile/.env.example lab4_mobile/.env
# Edit lab4_mobile/.env with your device configuration
```

### 3. Run Individual Labs

```bash
# Database Testing - MongoDB CRUD operations
cd lab1_mongodb && robot testcases/

# Web UI Testing - CRM application automation
cd lab2_ui && robot testcases/

# API Testing - eBay sandbox with fallback
cd lab3_api && robot testcases/

# Mobile Testing - Android app automation (requires Appium server)
appium --port 4723 &  # Start Appium server
cd lab4_mobile && robot tests/
```

## Testing Methodologies Implemented

### Test Design Patterns

- **Page Object Model**: Clean separation of UI elements, data, and test logic across all labs
- **Data-Driven Testing**: External test data management and parameterization
- **Keyword-Driven Testing**: Reusable test components and business logic abstraction
- **Behavior-Driven Development**: Clear, readable test scenarios with descriptive names
- **Modular Architecture**: Consistent structure across all laboratories

### Automation Framework Features

- **Cross-Platform Compatibility**: Database, Web, API, and Mobile testing capabilities
- **Multi-Language Documentation**: Complete English and French documentation
- **Comprehensive Reporting**: Detailed HTML reports with screenshots and execution logs
- **Error Handling**: Robust exception management and recovery mechanisms
- **Environment Management**: Flexible configuration for different environments and devices
- **Fallback Mechanisms**: Automatic handling of external service unavailability (Lab 3)

### Quality Assurance Practices

- **Test Coverage Analysis**: Comprehensive functionality coverage across all application layers
- **Regression Testing**: Automated validation of existing features
- **Integration Testing**: End-to-end workflow validation
- **Security Testing**: Authentication and authorization validation
- **Performance Monitoring**: Response time tracking and error rate analysis
- **Data Validation**: Input validation, field requirements, and constraint testing

## Test Execution

### Individual Laboratory Execution

```bash
# Database Testing - Full CRUD operations across multiple entities
robot lab1_mongodb/testcases/TestProducts.robot      # Product operations
robot lab1_mongodb/testcases/TestOtherEntities.robot # Users, Orders, Categories

# Web UI Testing - Complete CRM workflow
robot lab2_ui/testcases/login_test.robot             # Authentication
robot lab2_ui/testcases/add_customer_test.robot      # Customer management
robot lab2_ui/testcases/testCas.robot                # Home page verification

# API Testing - eBay sandbox with automatic fallback
robot lab3_api/testcases/ebay_api_tests.robot        # Full API test suite

# Mobile Testing - Android application automation
robot lab4_mobile/tests/login_tests.robot            # Mobile authentication
robot lab4_mobile/tests/product_tests.robot          # Product management
```

### Advanced Execution Options

```bash
# Detailed logging with custom output directory
robot --loglevel DEBUG --outputdir results lab2_ui/testcases/

# Tag-based execution for specific test categories
robot --include smoke lab1_mongodb/testcases/         # Smoke tests only
robot --include authentication lab2_ui/testcases/    # Authentication tests
robot --include fallback lab3_api/testcases/         # Fallback mechanism tests
robot --exclude slow lab4_mobile/tests/              # Exclude slow tests

# Variable override for different environments
robot --variable BROWSER:Firefox lab2_ui/testcases/
robot --variable DEVICE_NAME:"Pixel_7_API_34" lab4_mobile/tests/
robot --variable MONGO_URI:your_connection_string lab1_mongodb/testcases/

# Parallel execution (requires pabot installation)
pip install robotframework-pabot
pabot --processes 4 lab*/testcases/
```

### Continuous Integration Execution

```bash
# CI/CD pipeline friendly execution with machine-readable output
robot --outputdir ci_results --loglevel INFO --report ci_report.html --log ci_log.html lab*/testcases/

# Generate JUnit XML for CI integration
robot --xunit junit_results.xml lab*/testcases/
```

## Test Reports and Analysis

### Generated Artifacts

- **`report.html`**: Executive test execution summary with pass/fail statistics
- **`log.html`**: Detailed step-by-step execution logs with screenshots
- **`output.xml`**: Machine-readable results for CI/CD integration
- **Screenshots**: Automatic capture on failures (UI and Mobile tests)
- **Debug Logs**: Comprehensive error information and stack traces

### Laboratory-Specific Reports

```bash
# Database Testing Reports
open lab1_mongodb/results/report.html              # MongoDB operations summary
open lab1_mongodb/results/log.html                 # Database transaction logs

# Web UI Testing Reports  
open lab2_ui/results/report.html                   # CRM automation summary
open lab2_ui/results/log.html                      # Browser interaction logs

# API Testing Reports
open lab3_api/results/report.html                  # API testing summary with fallback status
open lab3_api/results/log.html                     # HTTP request/response logs

# Mobile Testing Reports
open lab4_mobile/results/report.html               # Mobile automation summary
open lab4_mobile/results/log.html                  # Mobile interaction logs
```

### Report Analysis Commands

```bash
# Open comprehensive cross-laboratory reports
open report.html      # Executive summary across all labs
open log.html         # Detailed execution traces with timing

# Generate consolidated reports (if running all labs together)
robot --outputdir consolidated_results lab*/testcases/ lab*/tests/
```

## Best Practices Demonstrated

### Architecture & Design

- **Modular Framework Structure**: Reusable components across all laboratories
- **Consistent Patterns**: Same architectural approach across Database, Web, API, and Mobile
- **Configuration Management**: Environment-specific settings and credential management
- **Version Control Integration**: Clean repository structure with comprehensive .gitignore
- **Documentation Standards**: Bilingual documentation with consistent formatting

### Security & Compliance

- **Credential Management**: Secure handling of database connections, API tokens, and passwords
- **Environment Isolation**: Separate sandbox/production configurations
- **Access Control**: Proper authentication and authorization testing across all platforms
- **Data Privacy**: Sensitive information exclusion from version control
- **Token Security**: OAuth 2.0 best practices and token refresh mechanisms

### Maintenance & Scalability

- **Centralized Locators**: Easy maintenance of UI element selectors and API endpoints
- **Reusable Keywords**: Common functionality abstraction across all laboratories
- **Error Recovery**: Graceful handling of test failures, timeouts, and external service issues
- **Cross-Platform Support**: Multi-browser, multi-device, and multi-environment execution
- **Fallback Mechanisms**: Robust handling of external dependencies (eBay API)

### Quality Metrics & Standards

- **Test Coverage**: 100% coverage of core functionalities across all testing domains
- **Error Handling**: Comprehensive negative testing scenarios
- **Performance Monitoring**: Response time tracking and performance benchmarks
- **Code Quality**: Consistent coding standards and documentation practices
- **Automation ROI**: Reduced manual testing effort and increased test reliability

## Troubleshooting

### Common Issues Across Laboratories

#### Environment Setup Issues

**Database Connection (Lab 1)**:

```bash
# Verify MongoDB connectivity
python -c "from pymongo import MongoClient; print('PyMongo works')"
# Check network access to MongoDB Atlas
# Validate connection string format and credentials
```

**Browser Driver Issues (Lab 2)**:

```bash
# Selenium 4.x manages drivers automatically
# Ensure Chrome browser is installed and up-to-date
# Clear browser cache and temporary files if needed
```

**API Connectivity (Lab 3)**:

```bash
# Check eBay sandbox status
# Validate OAuth token expiration
# Test fallback mechanism activation
```

**Mobile Setup (Lab 4)**:

```bash
# Verify Appium server is running
appium --port 4723
# Check device/emulator connectivity
adb devices
# Validate app installation path
```

#### Advanced Troubleshooting

```bash
# Maximum logging for comprehensive debugging
robot --loglevel TRACE --outputdir debug_results testcases/

# Single test debugging with detailed information
robot --test "Specific Test Name" --loglevel DEBUG testcases/

# Performance analysis with timing information
robot --loglevel INFO --timestamping testcases/
```

### Laboratory-Specific Debugging

- **Lab 1**: Database connection strings, ObjectId format validation, collection permissions
- **Lab 2**: Element locators, browser compatibility, page load timing
- **Lab 3**: Token expiration, API rate limiting, fallback mechanism activation
- **Lab 4**: Device configuration, app installation, element visibility timing

### Laboratory Extension Guidelines

```bash
# Create new laboratory structure (example: Lab 5 Performance Testing)
mkdir lab5_performance
cd lab5_performance
mkdir {pageobjects,resources,testcases}
touch README.md
# Follow existing architectural patterns from other labs
```

### Best Practices for Contributors

- **Naming Conventions**: Follow Robot Framework and Python naming standards
- **Error Handling**: Implement comprehensive exception handling and logging
- **Documentation**: Add detailed docstrings and README updates
- **Test Data**: Use meaningful, realistic test data with proper cleanup
- **Cross-Platform Compatibility**: Consider different operating systems and environments
- **Internationalization**: Support both English and French documentation

## Support and Resources

### Official Documentation Links

- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Selenium WebDriver Documentation](https://selenium-python.readthedocs.io/)
- [Appium Documentation](http://appium.io/docs/en/about-appium/intro/)
- [MongoDB Testing Guide](https://docs.mongodb.com/manual/testing/)
- [RequestsLibrary Documentation](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)

### Laboratory-Specific Resources

- **Lab 1 (Database)**: PyMongo documentation, MongoDB Atlas setup guides
- **Lab 2 (Web UI)**: Selenium best practices, Chrome DevTools usage
- **Lab 3 (API)**: eBay Developer documentation, OAuth 2.0 specifications
- **Lab 4 (Mobile)**: Appium setup guides, Android SDK documentation

### Technical Support

- **Framework Issues**: Robot Framework community forums and GitHub
- **Database Connectivity**: MongoDB community support and Atlas documentation
- **Browser Automation**: Selenium community and Stack Overflow
- **API Integration**: eBay Developer support and REST API best practices
- **Mobile Testing**: Appium community forums and Android developer resources

## License

This comprehensive testing suite is developed for educational and professional development purposes, demonstrating industry-standard QA automation practices and methodologies across multiple testing domains.

## Technologies & Frameworks Summary

### Core Framework

- **Robot Framework** 6.1.1+ (Primary test automation framework)
- **Python** 3.8+ (Programming language and ecosystem)

### Testing Libraries by Laboratory

- **Lab 1**: PyMongo 4.6.0+ (MongoDB integration and operations)
- **Lab 2**: SeleniumLibrary 6.2.0+ (Web UI automation and browser control)
- **Lab 3**: RequestsLibrary (HTTP API testing and OAuth integration)  
- **Lab 4**: AppiumLibrary 2.0.0+ (Mobile application automation)

### Supporting Technologies

- **Database**: MongoDB Atlas (Cloud database service)
- **Web Browsers**: Chrome with automatic driver management
- **API Platforms**: eBay Sandbox with OAuth 2.0 authentication
- **Mobile Platforms**: Android SDK with UiAutomator2 driver
- **Development Tools**: Git, Visual Studio Code, Appium Inspector

### Additional Tools & Utilities

- **Reporting**: HTML reports with screenshots and detailed logs
- **CI/CD Integration**: JUnit XML output and machine-readable results
- **Environment Management**: Python dotenv for configuration
- **Parallel Execution**: Pabot for concurrent test execution
- **Version Control**: Git with comprehensive .gitignore configurations
