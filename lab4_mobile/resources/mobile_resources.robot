*** Settings ***
Resource    ../resources/mobile_resources.robot

*** Keywords ***
Login With Valid Credentials
    Open Looma Application
    Login    ${VALID_CREDENTIALS}[username]    ${VALID_CREDENTIALS}[password]
    Wait Until Page Contains Element    ${SCREEN_TITLE}
    Close Looma Application

Login With Invalid Credentials
    Open Looma Application
    Login    ${INVALID_CREDENTIALS}[username]    ${INVALID_CREDENTIALS}[password]
    Wait Until Page Contains Element    ${LoginLocators.ERROR_MESSAGE}
    Close Looma Application

Create Valid Product
    Open Looma Application
    Login    ${VALID_CREDENTIALS}[username]    ${VALID_CREDENTIALS}[password]
    Create Product    ${PRODUCT_DATA}[name]    ${PRODUCT_DATA}[price]    ${PRODUCT_DATA}[description]
    Wait Until Page Contains Element    ${PRODUCT_SUCCESS_MESSAGE}
    Close Looma Application

Create Invalid Product
    Open Looma Application
    Login    ${VALID_CREDENTIALS}[username]    ${VALID_CREDENTIALS}[password]
    Create Product    ${INVALID_PRODUCT_DATA}[name]    ${INVALID_PRODUCT_DATA}[price]    ${INVALID_PRODUCT_DATA}[description]
    Wait Until Page Contains Element    ${INVALID_PRICE_MESSAGE}
    Close Looma Application
    