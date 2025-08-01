***Settings***
Library    AppiumLibrary
Library    OperatingSystem
Variables    locators.py
Variables    variables.py

***Keywords***
Fill Input By XPath
    [Arguments]    ${xpath_locator}    ${text_to_fill}
    Wait Until Element Is Visible    ${xpath_locator}    timeout=${DEFAULT_WAIT_TIME}
    Click Element    ${xpath_locator}
    Input Text       ${xpath_locator}    ${text_to_fill}

Open My Application
    ${desired_caps}=    Create Dictionary
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    app=${APK_PATH}
    ...    noReset=${NO_RESET}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}

    Open Application    ${APPIUM_SERVER_URL}    &{desired_caps}    strict_ssl=False
    Set Appium Timeout    30 seconds

Open And Login To Application
    Open My Application
    Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Product Creation Page Displayed

Close My Application
    Close Application

Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Wait And Input Text
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}
    Input Text    ${locator}    ${text}

Wait For And Click Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=${DEFAULT_WAIT_TIME}
    Click Element    ${locator}

Input Text And Press Enter
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    timeout=${DEFAULT_WAIT_TIME}
    Input Text    ${locator}    ${text}

Verify Element Text
    [Arguments]    ${locator}    ${expected_text}
    Wait Until Element Is Visible    ${locator}    timeout=${DEFAULT_WAIT_TIME}
    Element Text Should Be    ${locator}    ${expected_text}

Login
    [Arguments]    ${username}    ${password}
    Wait Until Page Contains Element    ${USERNAME_INPUT}    timeout=${DEFAULT_WAIT_TIME}
    Wait Until Page Contains Element    ${PASSWORD_INPUT}    timeout=${DEFAULT_WAIT_TIME}
    Wait Until Page Contains Element    ${LOGIN_BUTTON}    timeout=${DEFAULT_WAIT_TIME}
    Fill Input By XPath    ${USERNAME_INPUT}    ${username}
    Fill Input By XPath    ${PASSWORD_INPUT}    ${password}
    Wait And Click    ${LOGIN_BUTTON}

Verify Login Error Modal
    Wait Until Element Is Visible    ${ERROR_MODAL_TITLE}    timeout=${DEFAULT_WAIT_TIME}
    Wait Until Page Contains Element    ${ERROR_MODAL_TITLE}
    Page Should Contain Text    Vérifiez vos identifiants.
    Wait Until Page Contains Element    ${ERROR_MODAL_MESSAGE}
    Page Should Contain Text    Vérifiez vos identifiants.
    Click Element    ${ERROR_MODAL_OK_BUTTON}

Verify Product Creation Page Displayed
    Wait Until Element Is Visible    ${PRODUCT_CREATION_TITLE}    timeout=${DEFAULT_WAIT_TIME}
    Page Should Contain Text    Titre
    Page Should Contain Text    Prix
    Page Should Contain Text    Description
    Page Should Contain Text    Catégorie
    Page Should Contain Text    Image URL

Fill Product Details
    [Arguments]    ${title}    ${price}    ${description}    ${category}    ${image_url}
    Fill Input By XPath    ${PRODUCT_TITLE_INPUT}    ${title}
    Fill Input By XPath    ${PRODUCT_PRICE_INPUT}    ${price}
    Fill Input By XPath    ${PRODUCT_DESCRIPTION_INPUT}    ${description}
    Fill Input By XPath    ${PRODUCT_CATEGORY_INPUT}    ${category}
    Fill Input By XPath    ${PRODUCT_IMAGE_URL_INPUT}    ${image_url}
    Click Element    ${ADD_PRODUCT_BUTTON}

Verify Required Field Message
    [Arguments]    ${PRODUCT_INPUT_ERROR}
    Wait Until Page Contains Element    ${PRODUCT_INPUT_ERROR}
