*** Settings ***
Library    ../pageobjects/mongodb_lib.py

*** Keywords ***
Connect To Mongodb
    [Arguments]    ${uri}    ${db_name}
    ${db}=    connect_to_mongodb    ${uri}    ${db_name}
    Set Suite Variable    ${DB}    ${db}

Create Product
    [Arguments]    ${product}
    ${id}=    create_product    ${DB}    ${product}
    [Return]    ${id}

Read Product
    [Arguments]    ${product_id}
    ${product}=    read_product    ${DB}    ${product_id}
    [Return]    ${product}

Update Product
    [Arguments]    ${product_id}    ${fields}
    ${count}=    update_product    ${DB}    ${product_id}    ${fields}
    [Return]    ${count}

Delete Product
    [Arguments]    ${product_id}
    ${count}=    delete_product    ${DB}    ${product_id}
    [Return]    ${count}
