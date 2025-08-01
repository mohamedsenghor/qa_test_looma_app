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

Read Product - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${price}=    Convert To Number    50
    ${product}=    Create Dictionary    title=Mouse    price=${price}
    ${id}=    Create Product    ${db}    ${product}
    ${result}=    Read Product    ${db}    ${id}
    Dictionary Should Contain Key    ${result}    title

Update Product - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${price}=    Convert To Number    200
    ${product}=    Create Dictionary    title=Tablet    price=${price}
    ${id}=    Create Product    ${db}    ${product}
    ${new_price}=    Convert To Number    260
    ${update_fields}=    Create Dictionary    price=${new_price}
    ${count}=    Update Product    ${db}    ${id}    ${update_fields}
    Should Be True    ${count} > 0


Delete Product - Success
    ${db}=    connect_to_mongodb    ${MONGO_URI}    ${DB_NAME}
    ${price}=    Convert To Number    400
    ${product}=    Create Dictionary    title=Phone    price=${price}
    ${id}=    Create Product    ${db}    ${product}
    ${count}=    Delete Product    ${db}    ${id}
    Should Be Equal As Integers    ${count}    1
