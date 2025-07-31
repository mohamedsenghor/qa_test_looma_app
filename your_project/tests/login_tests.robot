***Settings***
Resource    ../resources/common_keywords.robot
Variables    ../resources/locators.py

Test Setup    Open My Application
Test Teardown    Close My Application

***Variables***
# Default wait time for elements to be visible
# Valid Credentials
${VALID_USERNAME}       johnd
${VALID_PASSWORD}       m38rmF$

# Invalid Credentials
${INVALID_USERNAME}     wrong_user
${INVALID_PASSWORD}     wrong_password

***Test Cases***
Should Display Login Page Correctly
    Wait Until Page Contains Element    ${LOGIN_TITLE}
    Page Should Contain Text    Nom d'utilisateur
    Page Should Contain Text    Mot de passe
    Page Should Contain Text    Se connecter

Should Not Login With Invalid Credentials
    Login    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Verify Login Error Modal

Should Login With Valid Credentials
    Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Product Creation Page Displayed
