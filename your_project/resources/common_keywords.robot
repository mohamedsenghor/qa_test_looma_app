***Settings***
Library    AppiumLibrary
Library    OperatingSystem
Variables    locators.py

***Variables***
${APPIUM_SERVER_URL}    http://127.0.0.1:4723
${APP_PACKAGE}          sn.sonatel.dsi.moussa.wade.moussawade
${APP_ACTIVITY}         sn.sonatel.dsi.moussa.wade.moussawade.MainActivity
${DEFAULT_WAIT_TIME}    10s

***Keywords***
Fill Input By XPath
    [Arguments]    ${xpath_locator}    ${text_to_fill}
    Wait Until Element Is Visible    ${xpath_locator}    timeout=${DEFAULT_WAIT_TIME}
    Click Element    ${xpath_locator}
    Input Text       ${xpath_locator}    ${text_to_fill}

Open My Application
    ${desired_caps}=    Create Dictionary
    ...    platformName=Android
    ...    platformVersion=16
    ...    deviceName=Medium Phone API 36
    ...    automationName=UiAutomator2
    ...    app=/home/mohamed/Documents/ISI_Courses/QA_Test/EXAMEN_QA_TEST/lab4_mobile/app-looma.apk
    ...    noReset=${False}
    ...    appPackage=sn.sonatel.dsi.moussa.wade.moussawade
    ...    appActivity=sn.sonatel.dsi.moussa.wade.moussawade.MainActivity
    
    Open Application    http://localhost:4723    &{desired_caps}    strict_ssl=False
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
    # Press Keycode    66  # Keycode for Enter (might not be needed for all text fields)

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
    # This might require more specific locators depending on how the "Obligatoire" message is displayed.
    # You might need to find a way to locate the error text specifically for each field.
    # For now, a general check that the page contains the message:
    Wait Until Page Contains Element    ${PRODUCT_INPUT_ERROR}
