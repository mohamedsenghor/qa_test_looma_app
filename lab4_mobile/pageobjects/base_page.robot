*** Settings ***
Resource    ../resources/appium_setup.robot

*** Keywords ***
Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Wait And Input Text
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}
    Input Text    ${locator}    ${text}
