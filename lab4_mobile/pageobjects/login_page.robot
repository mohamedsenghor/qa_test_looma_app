*** Settings ***
Library    AppiumLibrary
Library    Collections
Library    OperatingSystem
Resource    base_page.robot
Variables    locators.py

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait And Input Text    ${LoginLocators.USERNAME}    ${username}
    Wait And Input Text    ${LoginLocators.PASSWORD}    ${password}
    Wait And Click    ${LoginLocators.LOGIN_BUTTON}

Login With Valid Credentials
    Open Looma Application
    Login With Credentials    ${VALID_CREDENTIALS}[username]    ${VALID_CREDENTIALS}[password]
    Wait Until Page Contains Element    ${LoginLocators.SCREEN_TITLE}
    Close Looma Application

Login With Invalid Credentials
    Open Looma Application
    Login With Credentials    ${INVALID_CREDENTIALS}[username]    ${INVALID_CREDENTIALS}[password]
    Wait Until Page Contains Element    ${LoginLocators.ERROR_MESSAGE}
    Close Looma Application
