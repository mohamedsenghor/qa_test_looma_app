*** Settings ***
Library           RequestsLibrary
Variables         ../pageobjects/variables.py

*** Keywords ***
Create Session To eBay
    Create Session    ebay    ${BASE_URL}    headers=${HEADERS}    verify=False

Get Order By ID
    [Arguments]    ${order_id}
    ${response}=   Get Request    ebay    /order/${order_id}
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.json()}

Get Orders
    ${response}=   Get Request    ebay    /order
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.json()}

Issue Refund
    [Arguments]    ${order_id}    ${payload}
    ${response}=   Post Request    ebay    /order/${order_id}/issue_refund    json=${payload}
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.json()}