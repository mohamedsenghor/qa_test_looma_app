*** Settings ***
Library    AppiumLibrary
Library    Collections
Library    OperatingSystem
Variables    ../pageobjects/locators.py
Variables    ../pageobjects/variables.py

*** Keywords ***
Open Looma Application
    ${desired_caps}=    Create Dictionary
    ...    platformName=${PLATFORM}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE}
    ...    automationName=${AUTOMATION_NAME}
    ...    app=${APK_PATH}
    ...    noReset=${NO_RESET}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    Open Application    ${APPIUM_URL}    &{desired_caps}
    Wait Until Page Contains Element    ${USERNAME_INPUT}    timeout=30s

Close Looma Application
    Close Application

Login
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_BUTTON}

Create Product
    [Arguments]    ${name}    ${price}    ${description}
    Click Element    //android.widget.Button[@text='Add Product']
    Input Text    ${PRODUCT_NAME_INPUT}    ${name}
    Input Text    ${PRODUCT_PRICE_INPUT}    ${price}
    Input Text    ${PRODUCT_DESCRIPTION_INPUT}    ${description}
    Click Element    ${SAVE_BUTTON}
