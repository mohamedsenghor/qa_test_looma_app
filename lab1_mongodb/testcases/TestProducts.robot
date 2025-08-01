*** Settings ***
Library     Collections
Library    ../pageobjects/mongodb_lib.py

*** Variables ***
${MONGO_URI}      mongodb+srv://bassinediallo20:Passer%40123@cluster0.ifptzd7.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0
${DB_NAME}        fakestore

*** Test Cases ***
Create Product - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${price}=    Convert To Number    100
    ${product}=    Create Dictionary    title=Keyboard    price=${price}
    ${id}=    Create Product    ${db}    ${product}
    Should Not Be Empty    ${id}

Create Product - Missing Title - Fail
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${product}=    Create Dictionary    price=100
    ${id}=    Create Product    ${db}    ${product}
    Should Be Empty    ${id}

Create Product - Invalid Price (Negative) - Fail
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${product}=    Create Dictionary    title=InvalidProduct    price=-10
    ${id}=    Create Product    ${db}    ${product}
    Should Be Empty    ${id}



Read Product - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${price}=    Convert To Number    50
    ${product}=    Create Dictionary    title=Mouse    price=${price}
    ${id}=    Create Product    ${db}    ${product}
    ${result}=    Read Product    ${db}    ${id}
    Dictionary Should Contain Key    ${result}    title

Read Product - Invalid ID - Fail
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${result}=    Read Product    ${db}    invalid_id
    Should Be Empty    ${result}


Read Product - Non Existing ID - Fail
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${fake_id}=    Evaluate    '605c5f5a8f1b2c6d9bfa2e36'    # ID qui n'existe probablement pas
    ${result}=    Read Product    ${db}    ${fake_id}
    Should Be Empty    ${result}


Update Product - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${price}=    Convert To Number    200
    ${product}=    Create Dictionary    title=Tablet    price=${price}
    ${id}=    Create Product    ${db}    ${product}
    ${new_price}=    Convert To Number    260
    ${update_fields}=    Create Dictionary    price=${new_price}
    ${count}=    Update Product    ${db}    ${id}    ${update_fields}
    Should Be True    ${count} > 0

    
Update Product - Invalid Price - Fail
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${product}=    Create Dictionary    title=Tablet    price=100
    ${id}=    Create Product    ${db}    ${product}
    ${update_fields}=    Create Dictionary    price=-20
    ${count}=    Update Product    ${db}    ${id}    ${update_fields}
    Should Be Equal As Integers    ${count}    0

Update Product - Non Existing ID - Fail
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${fake_id}=    Evaluate    '605c5f5a8f1b2c6d9bfa2e36'
    ${update_fields}=    Create Dictionary    price=150
    ${count}=    Update Product    ${db}    ${fake_id}    ${update_fields}
    Should Be Equal As Integers    ${count}    0


Delete Product - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${price}=    Convert To Number    400
    ${product}=    Create Dictionary    title=Phone    price=${price}
    ${id}=    Create Product    ${db}    ${product}
    ${count}=    Delete Product    ${db}    ${id}
    Should Be Equal As Integers    ${count}    1


Delete Product - Invalid ID - Fail
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${count}=    Delete Product    ${db}    invalid_id
    Should Be Equal As Integers    ${count}    0


Delete Product - Non Existing ID - Fail
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${fake_id}=    Evaluate    '605c5f5a8f1b2c6d9bfa2e36'
    ${count}=    Delete Product    ${db}    ${fake_id}
    Should Be Equal As Integers    ${count}    0
