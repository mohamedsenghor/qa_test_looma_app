# Lab 1 MongoDB - Database Testing Suite

## Authors

**Bassine DIALLO**  
**Mohamed SENGHOR**

## Overview

This is a comprehensive Robot Framework test suite for automated MongoDB database testing. The project focuses on testing CRUD (Create, Read, Update, Delete) operations on a MongoDB database using PyMongo driver, implementing the Page Object Model pattern for database operations across multiple entities: Products, Users, Orders, and Categories.

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
    ├── TestProducts.robot       # Product CRUD test cases
    └── TestOtherEntities.robot  # User, Order, Category test cases
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
- **Collections**: `products`, `users`, `orders`, `categories`
- **Network Access**: Configured for your IP address

## Configuration

### Database Configuration (`pageobjects/variables.py`)

```python
BASE_URL = "https://fakestoreapi.com"
MONGO_URI = "mongodb+srv://username:password@cluster0.ifptzd7.mongodb.net/"
DB_NAME = "fakeStoreDB"
PRODUCTS_ENDPOINT = "/products"
```

### Connection Settings (`testcases/TestProducts.robot` & `testcases/TestOtherEntities.robot`)

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

The core library provides MongoDB operations for multiple entities:

#### Connection Management

- **`connect_to_mongodb(uri, db_name)`**: Establishes database connection
- Returns database object for operations

#### Product Operations

- **`create_product(db, product)`**: Creates new product document
- **`read_product(db, product_id)`**: Retrieves product by ObjectId
- **`update_product(db, product_id, update_fields)`**: Updates existing product
- **`delete_product(db, product_id)`**: Removes product from collection

#### User Operations

- **`create_user(db, user)`**: Creates new user document with email validation
- **`read_user(db, user_id)`**: Retrieves user by ObjectId
- **`update_user(db, user_id, update_fields)`**: Updates existing user
- **`delete_user(db, user_id)`**: Removes user from collection

#### Order Operations

- **`create_order(db, order)`**: Creates new order with product references
- **`read_order(db, order_id)`**: Retrieves order by ObjectId
- **`update_order(db, order_id, update_fields)`**: Updates existing order
- **`delete_order(db, order_id)`**: Removes order from collection

#### Category Operations

- **`create_category(db, category)`**: Creates new category with unique name validation
- **`read_category(db, category_id)`**: Retrieves category by ObjectId
- **`update_category(db, category_id, update_fields)`**: Updates existing category
- **`delete_category(db, category_id)`**: Removes category from collection

#### Data Validation

- **Field Requirements**: Validates required fields for each entity
- **Email Validation**: Ensures proper email format for users
- **Price Validation**: Ensures price is positive number for products
- **ObjectId Handling**: Proper MongoDB ObjectId conversion and validation
- **Unique Constraints**: Prevents duplicate category names

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

# Run specific test files
robot testcases/TestProducts.robot
robot testcases/TestOtherEntities.robot

# Run tests with detailed logging
robot --loglevel DEBUG testcases/

# Generate reports in custom directory
robot --outputdir results testcases/
```

### 3. Test Execution Examples

```bash
# Basic execution
robot testcases/TestProducts.robot

# Run all entity tests
robot testcases/TestOtherEntities.robot

# Detailed execution with logs
robot --loglevel DEBUG --outputdir results testcases/

# Run specific test case
robot --test "Create Product - Success" testcases/TestProducts.robot
robot --test "Create User - Success" testcases/TestOtherEntities.robot

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
| **Create Product - Missing Title - Fail** | Creates product without title | Empty ID returned |
| **Create Product - Invalid Price (Negative) - Fail** | Creates product with negative price | Empty ID returned |
| **Read Product - Success** | Creates mouse product and reads it back | Product contains title field |
| **Read Product - Invalid ID - Fail** | Reads with invalid ObjectId format | Empty result returned |
| **Read Product - Non Existing ID - Fail** | Reads with non-existent valid ObjectId | Empty result returned |
| **Update Product - Success** | Creates tablet, updates price from 200 to 260 | Modified count > 0 |
| **Update Product - Invalid Price - Fail** | Updates with negative price | Modified count = 0 |
| **Update Product - Non Existing ID - Fail** | Updates non-existent product | Modified count = 0 |
| **Delete Product - Success** | Creates phone product and deletes it | Deleted count equals 1 |
| **Delete Product - Invalid ID - Fail** | Deletes with invalid ID format | Deleted count = 0 |
| **Delete Product - Non Existing ID - Fail** | Deletes non-existent product | Deleted count = 0 |

### User Management Tests (`testcases/TestOtherEntities.robot`)

| Test Case | Description | Expected Result |
|-----------|-------------|----------------|
| **Create User - Success** | Creates user with valid email and required fields | User ID returned and not empty |
| **Create User - Invalid Email** | Creates user with invalid email format | Empty ID returned |
| **Create User - Missing Password** | Creates user without password field | Empty ID returned |
| **Read User - Success** | Creates user and reads it back | User contains email field |
| **Read User - Not Found** | Reads non-existent user | None returned |
| **Read User - Invalid ID** | Reads with invalid ObjectId | None returned |
| **Update User - Success** | Updates user address information | Modified count > 0 |
| **Delete User - Success** | Creates and deletes user | Deleted count = 1 |

### Order Management Tests (`testcases/TestOtherEntities.robot`)

| Test Case | Description | Expected Result |
|-----------|-------------|----------------|
| **Create Order - Success** | Creates order with user and product references | Order created successfully |
| **Create Order - Invalid Product ID** | Creates order with non-existent product | Order creation handled gracefully |
| **Create Order - Empty Products List** | Creates order with empty products array | Order creation handled appropriately |
| **Read Order - Success** | Reads existing order by ID | Order contains required fields |
| **Update Order - Success** | Updates order date field | Modified count > 0 |
| **Delete Order - Success** | Creates and deletes order | Deleted count = 1 |

### Category Management Tests (`testcases/TestOtherEntities.robot`)

| Test Case | Description | Expected Result |
|-----------|-------------|----------------|
| **Create Category - Success** | Creates category with name and description | Category ID returned |
| **Create Category - Duplicate Name** | Creates category with existing name | Empty ID returned (unique constraint) |
| **Create Category - Missing Name** | Creates category without name field | Empty ID returned |
| **Read Category - Success** | Creates category and reads it back | Category contains name field |
| **Update Category - Success** | Updates category description | Modified count > 0 |
| **Delete Category - Success** | Creates and deletes category | Deleted count = 1 |

## Test Data Examples

### Product Test Data

```robot
${price}=    Convert To Number    100
${product}=    Create Dictionary    title=Keyboard    price=${price}
${id}=    Create Product    ${db}    ${product}
Should Not Be Empty    ${id}
```

### User Test Data

```robot
${user}=    Create Dictionary
...    email=john@gmail.com
...    username=johnd
...    password=hashedpassword
...    name=Create Dictionary firstname=John lastname=Doe
${id}=    Create User    ${db}    ${user}
Should Not Be Empty    ${id}
```

### Order Test Data

```robot
${product1}=    Create Dictionary
...    productId=${product_id}
...    quantity=4
${products}=    Create List    ${product1}
${order}=    Create Dictionary
...    userId=${user_id}
...    date=2020-03-02T00:00:00.000Z
...    products=${products}
```

### Category Test Data

```robot
${category}=    Create Dictionary
...    name="men's clothing"
...    description="Articles destinés aux hommes"
...    image="URL d'une image représentative"
${id}=    Create Category    ${db}    ${category}
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

### Product Operations Example

```python
def create_product(db, product):
    """Create a new product in the database."""
    required_fields = ['title', 'price']
    if not all(field in product for field in required_fields):
        return ''
    
    if not isinstance(product['price'], (int, float)) or product['price'] <= 0:
        return ''
    
    result = db.products.insert_one(product)
    return str(result.inserted_id)
```

### User Operations Example

```python
def create_user(db, user):
    """Create a new user in the database."""
    required_fields = ['email', 'username', 'password']
    if not all(field in user for field in required_fields):
        return ''
    
    if not isinstance(user['email'], str) or '@' not in user['email']:
        return ''
    
    result = db.users.insert_one(user)
    return str(result.inserted_id)
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

### Multi-Entity Validation

The library implements comprehensive data validation across all entities:

```python
# Product validation
required_fields = ['title', 'price']
if not all(field in product for field in required_fields):
    return ''

# User email validation
if not isinstance(user['email'], str) or '@' not in user['email']:
    return ''

# Category uniqueness check
existing = db.categories.find_one({"name": category['name']})
if existing:
    return ''
```

### ObjectId Handling

```python
# Safe ObjectId conversion
try:
    obj_id = ObjectId(product_id)
except:
    return ''  # Return empty string for consistent error handling
```

## Best Practices Implemented

### Database Testing

- **Multi-Entity Coverage**: Complete CRUD testing across Products, Users, Orders, Categories
- **Connection Management**: Proper database connection establishment and handling
- **Data Validation**: Comprehensive input validation and error handling
- **Referential Integrity**: Proper handling of entity relationships (Orders → Users → Products)
- **Error Handling**: Graceful handling of database errors and exceptions

### Test Design

- **Modular Architecture**: Separated database operations from test logic
- **Reusable Components**: Common database keywords for test reuse
- **Data Isolation**: Each test creates its own test data
- **Comprehensive Coverage**: Both positive and negative test scenarios
- **Assertion Verification**: Proper validation of database operation results

### Framework Architecture

- **Page Object Pattern**: Database operations abstracted into library classes
- **Configuration Management**: External database configuration management
- **Error Recovery**: Robust exception handling and logging
- **Multi-Language Documentation**: English and French documentation support

## Contributing

### Adding New Database Tests

1. Define new database operations in [`pageobjects/mongodb_lib.py`](pageobjects/mongodb_lib.py)
2. Add corresponding keywords in [`resources/MongoDBKeywords.robot`](resources/MongoDBKeywords.robot)
3. Create test cases in appropriate test files ([`testcases/TestProducts.robot`](testcases/TestProducts.robot) or [`testcases/TestOtherEntities.robot`](testcases/TestOtherEntities.robot))
4. Update configuration in [`pageobjects/variables.py`](pageobjects/variables.py)
5. Update this README with new test documentation

### Database Operation Development

- Follow Python naming conventions for functions
- Include comprehensive docstrings with parameters and return values
- Implement proper error handling and validation
- Return consistent data types (empty string for failures, None where appropriate)
- Add logging for debugging and monitoring

## License

This test suite is part of the QA testing laboratory exercises and is intended for educational purposes.

## Technologies & Frameworks

- **Robot Framework** 6.1.1+
- **Python** 3.8+
- **PyMongo** 4.6.0+ for MongoDB connectivity
- **MongoDB Atlas** cloud database
- **BSON** for MongoDB document handling

---

**Last Updated**: August 1, 2025  
**Framework Version**: Robot Framework with PyMongo  
**Target Database**: MongoDB (Atlas/Local)  
**Test Environment**: MongoDB Sandbox/Development  
**Entities Covered**: Products, Users, Orders, Categories
