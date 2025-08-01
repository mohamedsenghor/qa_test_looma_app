*** Settings ***
Library     SeleniumLibrary
Resource   ../resources/testCas.robot
Variables   ../pageobject/variables.py
Suite Setup    Ouvrir le navigateur
Suite Teardown    Fermer le navigateur

*** Test Cases ***
Test Add Customer
    [Documentation]    Test d'ajout d'un nouveau client
    [Tags]    smoke    customer

    # Pré-conditions : Connexion
    Click Element    id=SignIn
    Wait Until Page Contains    Login
    Input Text    id=email-id    ${USERNAME_AUTOMATION}
    Input Text    id=password    ${PASSWORD_AUTOMATION}
    Click Element    id=submit-id

    # 🔁 Attente que le bouton 'new-customer' apparaisse après connexion
    Wait Until Element Is Visible    id=new-customer    timeout=10s
    Click Element    id=new-customer

    # Étapes : formulaire client
    Wait Until Page Contains         Add Customer
    Input Text    id=EmailAddress       ${TEST_CUSTOMER_EMAIL}
    Input Text    id=FirstName          ${TEST_CUSTOMER_FIRST_NAME}
    Input Text    id=LastName           ${TEST_CUSTOMER_LAST_NAME}
    Input Text    id=City               ${TEST_CUSTOMER_CITY}
    Select From List By Value          id=StateOrRegion    ${TEST_CUSTOMER_STATE}
    Click Element                      xpath=//input[@name='gender'][@value='male']
    Click Button    css=button.btn.btn-primary


    # Post-conditions
    Wait Until Page Contains    Success! New customer added.
