*** Settings ***
Library     SeleniumLibrary
Resource   ../resources/testCas.robot
Variables   ../pageobject/variables.py
Suite Setup    Ouvrir le navigateur
Suite Teardown    Fermer le navigateur
 
*** Test Cases ***
Test Login
    [Documentation]    Test de login avec des identifiants valides
    [Tags]    smoke    login
    Click Element    //*[@id="SignIn"]
    Wait Until Page Contains    Login
    Input Text    //input[@id='email-id']    ${USERNAME_AUTOMATION}
    Input Text    //input[@id='password']    ${PASSWORD_AUTOMATION}
    Click Element    //*[@id="submit-id"]
    
    
