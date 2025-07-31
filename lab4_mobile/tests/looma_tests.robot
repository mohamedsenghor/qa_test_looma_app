*** Settings ***
Resource    ../resources/appium_setup.robot
Resource    ../pageobjects/login_page.robot
Variables    ../pageobjects/locators.py
Variables    ../pageobjects/variables.py

*** Test Cases ***
Valid Login
    Start Session
    Login With Credentials    ${VALID_CREDENTIALS}[username]    ${VALID_CREDENTIALS}[password]
    Wait Until Page Contains Element    ${LoginLocators.SCREEN_TITLE}
    End Session

Invalid Login
    Start Session
    Login With Credentials    ${INVALID_CREDENTIALS}[username]    ${INVALID_CREDENTIALS}[password]
    Wait Until Page Contains Element    ${LoginLocators.SCREEN_TITLE}
    # If the login fails, we expect to see an error message "Vérifiez vos identifiants" in modal with a button labelled "OK" that should be clicked after 3s
    Wait Until Page Contains Element    ${LoginLocators.ERROR_MESSAGE}
    Click Element    //android.widget.Button[@content-desc="OK"]
    End Session

Create Valid Product
    Start Session
    Login With Credentials    ${VALID_CREDENTIALS}[username]    ${VALID_CREDENTIALS}[password]
    Click Element    //android.widget.Button[@text='Add Product']
    Input Text    ${PRODUCT_NAME_INPUT}    ${PRODUCT_DATA}[name]
    Input Text    ${PRODUCT_PRICE_INPUT}    ${PRODUCT_DATA}[price]
    Input Text    ${PRODUCT_DESCRIPTION_INPUT}    ${PRODUCT_DATA}[description]
    Click Element    ${SAVE_BUTTON}
    Wait Until Page Contains Element    ${PRODUCT_SUCCESS_MESSAGE}
    End Session