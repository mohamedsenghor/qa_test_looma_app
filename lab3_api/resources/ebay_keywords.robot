*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${EBAY_API_BASE_URL}    https://api.sandbox.ebay.com
${EBAY_API_VERSION}    v1

*** Keywords ***
Configure eBay Session
    [Arguments]    ${access_token}
    Create Session    ebay_session    ${EBAY_API_BASE_URL}

*** Keywords ***
Get Orders
    [Arguments]    ${access_token}
    ${url}       Set Variable    ${EBAY_API_BASE_URL}/sell/fulfillment/${EBAY_API_VERSION}/order
    ${headers}   Create Dictionary    Authorization=Bearer ${access_token}    Content-Type=application/json
    ${response}  GET On Session    ebay_session    ${url}    headers=${headers}
    [Return]     ${response}



Get Order Details
    [Arguments]    ${access_token}    ${order_id}
    ${url}    Set Variable    ${EBAY_API_BASE_URL}/sell/fulfillment/${EBAY_API_VERSION}/order/${order_id}
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}    Content-Type=application/json
    ${response}    GET On Session    ebay_session    ${url}    headers=${headers}
    [Return]    ${response}

Create Refund
    [Arguments]    ${access_token}    ${order_id}    ${line_item_id}    ${amount}
    ${url}    Set Variable    ${EBAY_API_BASE_URL}/sell/finances/${EBAY_API_VERSION}/order/${order_id}/refund
    ${body}    Create Dictionary
    Set To Dictionary    ${body}    orderId=${order_id}
    ${refund_items}    Create List
    ${refund_item}    Create Dictionary
    Set To Dictionary    ${refund_item}    lineItemId=${line_item_id}
    ${amount_dict}    Create Dictionary
    Set To Dictionary    ${amount_dict}    currency=USD    value=${amount}
    Set To Dictionary    ${refund_item}    amount=${amount_dict}
    Append To List    ${refund_items}    ${refund_item}
    Set To Dictionary    ${body}    refundItems=${refund_items}
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}    Content-Type=application/json
    ${response}    POST On Session    ebay_session    ${url}    ${body}    headers=${headers}
    [Return]    ${response}

Verify API Response Status
    [Arguments]    ${response}    ${expected_status}=200
    Should Be Equal As Strings    ${response.status_code}    ${expected_status}

Verify API Error Response
    [Arguments]    ${response}    ${error_id}    ${error_message}
    ${errors}    Get From Dictionary    ${response.json()}    errors
    For    ${error}    IN    @{errors}
        ${error_id_value}    Get From Dictionary    ${error}    errorId
        ${message}    Get From Dictionary    ${error}    message
        Should Be Equal As Strings    ${error_id_value}    ${error_id}
        Should Be Equal As Strings    ${message}    ${error_message}
    End