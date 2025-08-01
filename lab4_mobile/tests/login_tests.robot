***Settings***
Resource    ../resources/common_keywords.robot

Test Setup    Open My Application
Test Teardown    Close My Application

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
