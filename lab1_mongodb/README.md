# Lab 1 MongoDB - Database Testing Suite

## Authors

**Bassine DIALLO**  
**Mohamed SENGHOR**

## Overview

This is a comprehensive Robot Framework test suite for automated MongoDB database testing. The project focuses on testing CRUD (Create, Read, Update, Delete) operations on a MongoDB database using PyMongo driver, implementing the Page Object Model pattern for database operations.

## Project Structure

```text
lab1_mongodb/
├── README.md                     # This documentation
├── __init__.py                   # Python package initialization
├── fr/                          # French documentation
│   └── README.md                # French version of documentation
├── pageobjects/                 # Database objects and utilities
│   ├── __init__.py              # Package initialization
│   ├── locators.py              # Database field definitions
│   ├── mongodb_lib.py           # MongoDB operations library
│   ├── variables.py             # Database configuration
│   └── __pycache__/             # Python cache files
├── resources/                   # Test resources and keywords
│   └── MongoDBKeywords.robot    # Reusable database keywords
└── testcases/                   # Test case definitions
    └── TestProducts.robot       # Product CRUD test cases
```

## Prerequisites

### Software Requirements

- **Python 3.8+** with pip
- **Robot Framework 6.1.1+**
- **PyMongo** for MongoDB connectivity
- **MongoDB Atlas** account or local MongoDB instance

### Python Dependencies

#### requirements.txt

```text
robotframework==6.1.1
pymongo==4.6.0
bson==0.5.10
```

```bash
pip install -r requirements.txt
```

### Database Setup

- **MongoDB Atlas** cloud database or local MongoDB instance
- **Database Name**: `fakestore`
- **Collection**: `products`
- **Network Access**: Configured for your IP address

## Configuration

### Database Configuration (`pageobjects/variables.py`)

```python
BASE_URL = "https://fakestoreapi.com"
MONGO_URI = "mongodb+srv://username:password@cluster0.ifptzd7.mongodb.net/"
DB_NAME = "fakeStoreDB"
PRODUCTS_ENDPOINT = "/products"
```

### Connection Settings (`testcases/TestProducts.robot`)

```robot
*** Variables ***
${MONGO_URI}      mongodb+srv://bassinediallo20:Passer%40123@cluster0.ifptzd7.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0
${DB_NAME}        fakestore
```

**NOTE**: Replace the connection string with your own MongoDB credentials for testing.

### Field Definitions (`pageobjects/locators.py`)

```python
RESPONSE_KEYS_PRODUCT = ["id", "title", "price", "description", "category", "image"]
```

## Test Components

### MongoDB Library (`pageobjects/mongodb_lib.py`)

The core library provides MongoDB operations:

#### Connection Management

- **`connect_to_mongodb(uri, db_name)`**: Establishes database connection
- Returns database object for operations

#### CRUD Operations

- **`create_product(db, product)`**: Creates new product document
- **`read_product(db, product_id)`**: Retrieves product by ObjectId
- **`update_product(db, product_id, update_fields)`**: Updates existing product
- **`delete_product(db, product_id)`**: Removes product from collection

#### Data Validation

- **Field Requirements**: Validates required fields (title, price)
- **Price Validation**: Ensures price is positive number
- **ObjectId Handling**: Proper MongoDB ObjectId conversion

### Robot Keywords (`resources/MongoDBKeywords.robot`)

High-level Robot Framework keywords:

#### Session Management

- **`Connect To Mongodb`**: Establishes and stores database connection
- **`Set Suite Variable`**: Maintains database connection across tests

#### Product Operations

- **`Create Product`**: Creates product and returns ID
- **`Read Product`**: Retrieves product by ID
- **`Update Product`**: Updates product fields
- **`Delete Product`**: Removes product and returns count

## Running Tests

### 1. Environment Setup

```bash
# Navigate to project directory
cd /Users/mac/qa_test_looma_app/lab1_mongodb

# Install Python dependencies
pip install -r requirements.txt

# Verify MongoDB connection
python -c "from pymongo import MongoClient; print('PyMongo installed successfully')"
```

### 2. Execute Test Suites

```bash
# Run all tests
robot testcases/

# Run specific test file
robot testcases/TestProducts.robot

# Run tests with detailed logging
robot --loglevel DEBUG testcases/

# Generate reports in custom directory
robot --outputdir results testcases/
```

### 3. Test Execution Examples

```bash
# Basic execution
robot testcases/TestProducts.robot

# Detailed execution with logs
robot --loglevel DEBUG --outputdir results testcases/

# Run specific test case
robot --test "Create Product - Success" testcases/TestProducts.robot

# Run tests with custom variables
robot --variable MONGO_URI:your_connection_string testcases/

# Continue on failure
robot --continue-on-failure testcases/
```

## Test Cases

### Product CRUD Tests (`testcases/TestProducts.robot`)

| Test Case | Description | Expected Result |
|-----------|-------------|----------------|
| **Create Product - Success** | Creates a keyboard product with price 100 | Product ID returned and not empty |
| **Read Product - Success** | Creates mouse product and reads it back | Product contains title field |
| **Update Product - Success** | Creates tablet, updates price from 200 to 260 | Modified count > 0 |
| **Delete Product - Success** | Creates phone product and deletes it | Deleted count equals 1 |

### Test Data Examples

#### Create Product Test

```robot
${price}=    Convert To Number    100
${product}=    Create Dictionary    title=Keyboard    price=${price}
${id}=    Create Product    ${db}    ${product}
Should Not Be Empty    ${id}
```

#### Update Product Test

```robot
${new_price}=    Convert To Number    260
${update_fields}=    Create Dictionary    price=${new_price}
${count}=    Update Product    ${db}    ${id}    ${update_fields}
Should Be True    ${count} > 0
```

## Test Reports

Robot Framework generates comprehensive reports after execution:

- **`report.html`**: High-level test execution summary
- **`log.html`**: Detailed step-by-step execution log with database operations
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

## Database Operations

### Connection Management

```python
def connect_to_mongodb(uri, db_name):
    """Connect to MongoDB using the provided URI and database name."""
    client = MongoClient(uri)
    db = client[db_name]
    return db
```

### Product Creation

```python
def create_product(db, product):
    """Create a new product in the database."""
    required_fields = ['title', 'price']
    if not all(field in product for field in required_fields):
        return None
    
    if not isinstance(product['price'], (int, float)) or product['price'] <= 0:
        return None
    
    result = db.products.insert_one(product)
    return str(result.inserted_id)
```

### Product Retrieval

```python
def read_product(db, product_id):
    """Read a product from the database by its ID."""
    try:
        obj_id = ObjectId(product_id)
    except:
        return None
    
    return db.products.find_one({"_id": obj_id})
```

## Troubleshooting

### Common Issues and Solutions

#### 1. MongoDB Connection Issues

```text
ServerSelectionTimeoutError: connection timeout
```

**Solutions**:

- Verify MongoDB Atlas network access settings
- Check internet connectivity
- Validate connection string format
- Ensure database user permissions

#### 2. Authentication Failures

```text
Authentication failed
```

**Solutions**:

- Verify username and password in connection string
- Check database user roles and permissions
- Ensure URL encoding for special characters in password
- Validate database name accessibility

#### 3. ObjectId Conversion Errors

```text
InvalidId: ObjectIds have invalid ObjectId
```

**Solutions**:

- Ensure proper ObjectId format validation
- Handle invalid ID strings gracefully
- Use try/except blocks for ObjectId conversion

#### 4. Import Errors

```text
ModuleNotFoundError: No module named 'pymongo'
```

**Solutions**:

- Install PyMongo: `pip install pymongo`
- Verify Python environment and PATH
- Check virtual environment activation

### Debug Mode

```bash
# Run with maximum logging
robot --loglevel TRACE --outputdir debug_results testcases/

# Run with database operation logging
robot --variable LOG_LEVEL:DEBUG testcases/

# Capture detailed error information
robot --continue-on-failure --loglevel DEBUG testcases/
```

## Data Validation

### Field Validation

The library implements comprehensive data validation:

```python
# Required field validation
required_fields = ['title', 'price']
if not all(field in product for field in required_fields):
    return None

# Price validation
if not isinstance(product['price'], (int, float)) or product['price'] <= 0:
    return None
```

### ObjectId Handling

```python
# Safe ObjectId conversion
try:
    obj_id = ObjectId(product_id)
except:
    return None  # or appropriate error handling
```

## Best Practices Implemented

### Database Testing

- **Connection Management**: Proper database connection establishment and handling
- **Data Validation**: Comprehensive input validation and error handling
- **CRUD Operations**: Complete Create, Read, Update, Delete operation coverage
- **Error Handling**: Graceful handling of database errors and exceptions

### Test Design

- **Modular Architecture**: Separated database operations from test logic
- **Reusable Components**: Common database keywords for test reuse
- **Data Isolation**: Each test creates its own test data
- **Assertion Verification**: Proper validation of database operation results

### Framework Architecture

- **Page Object Pattern**: Database operations abstracted into library classes
- **Configuration Management**: External database configuration management
- **Error Recovery**: Robust exception handling and logging
- **Documentation**: Comprehensive inline documentation and examples

## Contributing

### Adding New Database Tests

1. Define new database operations in [`pageobjects/mongodb_lib.py`](pageobjects/mongodb_lib.py)
2. Add corresponding keywords in [`resources/MongoDBKeywords.robot`](resources/MongoDBKeywords.robot)
3. Create test cases in [`testcases/TestProducts.robot`](testcases/TestProducts.robot)
4. Update configuration in [`pageobjects/variables.py`](pageobjects/variables.py)
5. Update this README with new test documentation

### Database Operation Development

- Follow Python naming conventions for functions
- Include comprehensive docstrings with parameters and return values
- Implement proper error handling and validation
- Add logging for debugging and monitoring
