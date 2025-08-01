*** Settings ***
Resource    ../resources/ebay_keywords.robot

*** Variables ***
${ACCESS_TOKEN}    v^1.1#i^1#f^0#r^0#p^3#I^3#t^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

*** Test Cases ***
Get Orders With Valid Token
    [Documentation]    Test getting orders with valid access token
    Log    Using access token: ${ACCESS_TOKEN}
    Configure eBay Session    ${ACCESS_TOKEN}
    ${response}    Get Orders    ${ACCESS_TOKEN}
    Verify API Response Status    ${response}
    Log    ${response.json()}

Get Orders With Invalid Token- Premier test
    [Documentation]    Test getting orders with invalid access token
    Log    Using invalid token: FAUX_TOKEN
    Configure eBay Session    FAUX_TOKEN

    ${result}=    Run Keyword And Ignore Error    Get Orders    FAUX_TOKEN
    ${status}=    Set Variable    ${result[0]}
    ${response}=  Set Variable    ${result[1]}
    Log    Status = ${status}
    Should Be Equal As Strings    ${status}    FAIL
    Log    Erreur attendue : ${response}

Get Order Details With Valid Token (Skipped)
    [Documentation]    Test à compléter quand un vrai order ID est disponible
    ${order_id}=    Set Variable    ${EMPTY}
    Run Keyword If    '${order_id}' == ''    Skip    Pas de commande disponible - test ignoré
    Configure eBay Session    ${ACCESS_TOKEN}
    ${response}    Get Order Details    ${ACCESS_TOKEN}    ${order_id}
    Verify API Response Status    ${response}    400
    Log    ${response.json()}

Create Refund With Valid Order (Skipped)
    [Documentation]    Test à compléter quand un vrai order ID et line item ID sont disponibles
    ${order_id}=        Set Variable    ${EMPTY}
    ${line_item_id}=    Set Variable    ${EMPTY}
    Run Keyword If    '${order_id}' == '' or '${line_item_id}' == ''    Skip    Pas de données de commande - test ignoré
    Configure eBay Session    ${ACCESS_TOKEN}
    ${response}    Create Refund    ${ACCESS_TOKEN}    ${order_id}    ${line_item_id}    10.00
    Verify API Response Status    ${response}    200
    Log    ${response.json()}

Get Orders With Invalid Token
    [Documentation]    Test getting orders with invalid access token
    Configure eBay Session    FAUX_TOKEN
    ${result}=    Run Keyword And Ignore Error    Get Orders    FAUX_TOKEN
    ${status}=    Set Variable    ${result[0]}
    ${response}=  Set Variable    ${result[1]}
    Should Be Equal As Strings    ${status}    FAIL
    Should Contain    ${response}    401
    Log    Erreur capturée : ${response}

Get Order Details With Valid Token
    [Documentation]    Test getting order details with valid token
    Configure eBay Session    ${ACCESS_TOKEN}
    ${response}=    Run Keyword And Ignore Error    Get Order Details    ${ACCESS_TOKEN}    FAKE-ORDER-ID
    ${status}=    Set Variable    ${response[0]}
    ${body}=      Set Variable    ${response[1]}
    Should Be Equal As Strings    ${status}    FAIL
    Should Contain    ${body}    400

Create Refund With Valid Token
    [Documentation]    Test creating a refund with valid token
    Configure eBay Session    ${ACCESS_TOKEN}
    ${result}=    Run Keyword And Ignore Error    Create Refund    ${ACCESS_TOKEN}    FAKE-ORDER-ID    FAKE-LINEITEM-ID    10.00
    ${status}=    Set Variable    ${result[0]}
    ${response}=  Set Variable    ${result[1]}
    Should Be Equal As Strings    ${status}    FAIL
    Should Contain    ${response}    Not Found