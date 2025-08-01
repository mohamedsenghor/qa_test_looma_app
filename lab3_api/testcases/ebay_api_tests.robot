*** Settings ***
Resource          ../resources/ebay_keywords.robot


*** Test Cases ***
Test Get Order - Valid
    Create Session To eBay
    Get Order By ID    TEST-ORDER-2023-123456    # Remplace avec un ID réel si possible

Test Get Order - Invalid ID
    Create Session To eBay
    ${invalid_id}=     Set Variable    INVALID-12345
    ${response}=       Get Request    ebay    /order/${invalid_id}
    Should Be Equal As Integers    ${response.status_code}    404

Test Get Orders - Valid Request
    Create Session To eBay
    Get Orders

Test Issue Refund - Valid
    Create Session To eBay
    ${payload}=    Create Dictionary    refundReason=BUYER_CANCEL    comments=Annulation par le client
    Issue Refund    TEST-ORDER-2023-123456    ${payload}

Test Issue Refund - Invalid Request
    Create Session To eBay
    ${payload}=    Create Dictionary    refundReason=INVALID_REASON
    ${response}=   Post Request    ebay    /order/INVALID-12345/issue_refund    json=${payload}
    Should Not Be Equal As Integers    ${response.status_code}    200