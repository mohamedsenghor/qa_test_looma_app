# Lab 3 API - eBay API Testing Suite

## Authors

**Bassine DIALLO**  
**Mohamed SENGHOR**

## Overview

This is a comprehensive Robot Framework test suite for automated API testing of eBay's REST API using their sandbox environment. The project focuses on testing core eBay fulfillment and finance APIs including order management, order details retrieval, and refund processing using OAuth 2.0 authentication. The suite includes a robust fallback mechanism to handle eBay sandbox unavailability.

## Project Structure

```text
lab3_api/
├── README.md                    # This documentation
├── fr/                          # French documentation
│   └── README.md                # French version of documentation
├── pageobjects/                 # Configuration and data objects
│   ├── locators.py              # API endpoint definitions
│   └── variables.py             # Test variables and configuration
├── resources/                   # Test resources and keywords
│   ├── ebay_config.py           # eBay API configuration
│   └── ebay_keywords.robot      # Reusable API test keywords
└── testcases/                   # Test case definitions
    └── ebay_api_tests.robot     # eBay API test cases
```

## Prerequisites

### Software Requirements

- **Python 3.8+** with pip
- **Robot Framework 6.1.1+**
- **RequestsLibrary** for HTTP API calls
- **Collections Library** for data manipulation

### Python Dependencies

#### requirements.txt

```text
robotframework==6.1.1
robotframework-requests==0.9.0
requests==2.31.0
```

```bash
pip install -r requirements.txt
```

### eBay API Access

- **eBay Developer Account** with sandbox access
- **OAuth 2.0 Access Token** for API authentication
- **eBay Sandbox Environment** access
- **Fallback Mode**: Automatic mock responses when eBay is unavailable

## Configuration

### API Configuration (`resources/ebay_config.py`)

```python
EBAY_BASE_URL = "https://api.ebay.com/sell/fulfillment/v1"
ACCESS_TOKEN = "v^1.1#i^1#f^0#r^0#p^3#I^3#t^H4s..."  # OAuth 2.0 token
REFRESH_TOKEN = "v^1.1#i^1#p^3#I^3#r^1#f^0#t^Ul4x..."  # OAuth refresh token
```

### Test Variables Configuration (`pageobjects/variables.py`)

```python
BASE_URL = "https://api.sandbox.ebay.com/sell/fulfillment/v1"
ACCESS_TOKEN = "v^1.1#i^1#r^0#p^3#f^0#I^3#t^H4s..."  # Valid OAuth 2.0 token

HEADERS = {
    "Authorization": f"Bearer {ACCESS_TOKEN}",
    "Content-Type": "application/json"
}
```

**NOTE**: The ACCESS_TOKEN is a valid OAuth 2.0 token for eBay sandbox environment. Replace with your own token for testing.

### API Endpoints (`pageobjects/locators.py`)

```python
ENDPOINTS = {
    "GET_ORDER": "/order/",
    "GET_ORDERS": "/order",
    "ISSUE_REFUND": "/order/{orderId}/issue_refund"
}
```

### Test Variables (`testcases/ebay_api_tests.robot`)

```robot
*** Variables ***
${ACCESS_TOKEN}    v^1.1#i^1#I^3#f^0#r^0#p^3#t^H4s...  # Valid OAuth token
${EBAY_API_BASE_URL}    https://api.sandbox.ebay.com
${EBAY_API_VERSION}    v1
```

## Test Components

### API Keywords (`resources/ebay_keywords.robot`)

The test suite provides reusable keywords for eBay API interactions:

#### Session Management

- **`Configure eBay Session`**: Initializes HTTP session with eBay API base URL
- **`Create Session`**: Creates RequestsLibrary session for API calls

#### Order Management

- **`Get Orders`**: Retrieves list of orders using fulfillment API
- **`Get Order Details`**: Fetches detailed information for specific order
- **`Create Refund`**: Processes refund for order line items

#### Response Validation

- **`Verify API Response Status`**: Validates HTTP response status codes
- **`Verify API Error Response`**: Validates error response structure and content

### API Endpoints Tested

#### Fulfillment API

```text
GET /sell/fulfillment/v1/order
GET /sell/fulfillment/v1/order/{orderId}
```

#### Finance API

```text
POST /sell/finances/v1/order/{orderId}/refund
```

## Running Tests

### 1. Environment Setup

```bash
# Navigate to project directory
cd /Users/mac/qa_test_looma_app/lab3_api

# Ensure Python dependencies are installed
pip install -r requirements.txt
```

### 2. Execute Test Suites

```bash
# Run all tests
robot testcases/

# Run specific test file
robot testcases/ebay_api_tests.robot

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
robot --test "Get Orders With Valid Token" testcases/ebay_api_tests.robot

# Run tests with custom variables
robot --variable ACCESS_TOKEN:your_token_here testcases/

# Continue on failure
robot --continue-on-failure testcases/
```

## Test Cases

### Authentication Tests

| Test Case | Description | Expected Result |
|-----------|-------------|----------------|
| **Get Orders With Valid Token** | Tests API access with valid OAuth token | 200 OK with orders list |
| **Get Orders With Invalid Token- Premier test** | Tests API security with invalid token | FAIL status with error message |
| **Get Orders Without Token** | Tests API call without authentication | 401 Unauthorized error |

### Order Management Tests

| Test Case | Description | Expected Result |
|-----------|-------------|----------------|
| **Get Order Details With Valid Token (Fallback)** | Tests order details retrieval with fallback mechanism | 400 Bad Request for invalid order ID |
| **Get Order Details With Valid Token** | Tests order details retrieval with fake ID | 400 Bad Request for invalid order ID |
| **Get Order With Invalid Token** | Tests order retrieval with invalid authentication | 401 Unauthorized error |
| **Get Order Without Token** | Tests order retrieval without authentication | 401 Unauthorized error |

### Financial Operations Tests

| Test Case | Description | Expected Result |
|-----------|-------------|----------------|
| **Create Refund With Valid Order (Skipped)** | Placeholder for real refund testing | Skipped when no real order available |
| **Create Refund With Valid Token** | Tests refund creation API with fake data | FAIL with Not Found error |
| **Create Refund With Invalid Amount** | Tests refund with negative amount | FAIL with 400/404 error |
| **Create Refund Without Token** | Tests refund creation without authentication | FAIL with 401/403/404 error |

## Fallback Mechanism

### eBay Sandbox Unavailability Handling

The test suite includes an automatic fallback mechanism for when eBay sandbox is unavailable:

#### Automatic Detection

- Tests automatically detect eBay sandbox availability before execution
- Seamless switching between live API and mock responses
- Clear logging to indicate which mode is being used

#### Mock Response System

- Realistic mock responses that mirror eBay API structure
- Proper HTTP status codes for different scenarios
- Comprehensive error response simulation

#### Benefits

- **Continuous Testing**: Tests can run even when eBay sandbox is down
- **CI/CD Friendly**: No pipeline failures due to external dependencies
- **Development Continuity**: Framework development can continue uninterrupted
- **Realistic Testing**: Mock responses maintain API contract fidelity

## Test Reports

Robot Framework generates comprehensive reports after execution:

- **`report.html`**: High-level test execution summary
- **`log.html`**: Detailed step-by-step execution log with API requests/responses
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

#### 1. Token Expiration

```text
401 Unauthorized - Token expired
```

**Solution**: Generate new OAuth token from eBay Developer Console and update `ACCESS_TOKEN` variable in both `resources/ebay_config.py` and `pageobjects/variables.py`.

#### 2. API Rate Limiting

```text
429 Too Many Requests
```

**Solutions**:

- Implement delays between API calls
- Use eBay's rate limiting guidelines
- Consider test data optimization

#### 3. Invalid Order IDs

```text
404 Not Found - Order not found
```

**Solutions**:

- Use real order IDs from sandbox account
- Implement order creation setup for tests
- Handle missing test data gracefully with Skip keyword

#### 4. Network Connectivity Issues

```text
ConnectionError: Failed to establish connection
```

**Solutions**:

- Verify internet connectivity
- Check eBay sandbox service status
- Fallback mechanism will automatically handle this scenario

#### 5. eBay Sandbox Unavailable

When eBay sandbox is completely unavailable:

- **Automatic Fallback**: Tests will use mock responses automatically
- **Clear Logging**: Test logs will indicate fallback mode is active
- **Full Coverage**: All test scenarios remain executable with mock data

### Debug Mode

```bash
# Run with maximum logging
robot --loglevel TRACE --outputdir debug_results testcases/

# Run with request/response logging
robot --variable LOG_LEVEL:DEBUG testcases/

# Capture detailed error information
robot --continue-on-failure --loglevel DEBUG testcases/
```

## Authentication & Security

### OAuth 2.0 Token Management

The test suite uses eBay's OAuth 2.0 authentication:

```robot
*** Variables ***
${ACCESS_TOKEN}    v^1.1#i^1#I^3#f^0#r^0#p^3#t^H4s...

*** Keywords ***
Configure eBay Session
    [Arguments]    ${access_token}
    Create Session    ebay_session    ${EBAY_API_BASE_URL}
```

### Token Security Best Practices

- Store tokens in environment variables for production
- Implement token refresh mechanisms using `REFRESH_TOKEN`
- Use different tokens for different test environments
- Monitor token expiration and renewal

## API Request Examples

### Get Orders Request

```http
GET /sell/fulfillment/v1/order HTTP/1.1
Host: api.sandbox.ebay.com
Authorization: Bearer v^1.1#i^1#I^3#f^0#r^0#p^3#t^H4s...
Content-Type: application/json
```

### Create Refund Request

```http
POST /sell/finances/v1/order/{orderId}/refund HTTP/1.1
Host: api.sandbox.ebay.com
Authorization: Bearer v^1.1#i^1#I^3#f^0#r^0#p^3#t^H4s...
Content-Type: application/json

{
  "orderId": "12345",
  "refundItems": [
    {
      "lineItemId": "67890",
      "amount": {
        "currency": "USD",
        "value": "10.00"
      }
    }
  ]
}
```

## Best Practices Implemented

### API Testing

- **Token-based Authentication**: Secure OAuth 2.0 implementation
- **Error Handling**: Comprehensive error scenario testing with proper exception handling
- **Response Validation**: Status code and content verification
- **Modular Keywords**: Reusable API interaction components
- **Fallback Resilience**: Automatic handling of external service unavailability

### Test Design

- **Positive/Negative Testing**: Valid and invalid scenario coverage
- **Data-Driven Approach**: Configurable test data management
- **Skip Logic**: Graceful handling of missing test prerequisites
- **Detailed Logging**: Comprehensive request/response logging with clear status indicators
- **French Language Support**: Complete documentation in French (`fr/README.md`)

### Framework Architecture

- **Page Object Pattern**: Organized endpoint and variable management
- **Separation of Concerns**: Clear division between configuration, test data, keywords, and test cases
- **Environment Configuration**: Flexible sandbox/production setup
- **Error Recovery**: Robust error handling and reporting with fallback mechanisms
- **Dual Configuration**: Separate config files for different purposes (`ebay_config.py` and `variables.py`)

### API Keyword Development

- Follow Robot Framework keyword naming conventions
- Include comprehensive argument documentation
- Implement proper error handling and logging using `Run Keyword And Ignore Error`
- Add response validation for all API calls
- Consider fallback scenarios for external service dependencies

### Test Data Management

- Use environment variables for sensitive data in production
- Implement test data setup/teardown procedures
- Consider test data isolation between test runs
- Document required test data prerequisites
- Handle missing test data gracefully with Skip keyword

## License

This test suite is part of the QA testing laboratory exercises and is intended for educational purposes.

## Technologies & Frameworks

- **Robot Framework** 6.1.1+
- **Python** 3.8+
- **RequestsLibrary** for HTTP operations
- **eBay API** (Sandbox environment)
- **OAuth 2.0** for authentication
- **JSON** for data exchange
- **Collections Library** for data manipulation
