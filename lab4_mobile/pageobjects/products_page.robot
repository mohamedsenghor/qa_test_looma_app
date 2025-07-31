*** Settings ***
Resource    base_page.robot
Variables    ../utilities/locators.py

*** Keywords ***
Create Product
    [Arguments]    ${name}    ${price}    ${description}
    Wait And Click    ${ProductLocators.ADD_BUTTON}
    Wait And Input Text    ${ProductLocators.NAME}    ${name}
    Wait And Input Text    ${ProductLocators.PRICE}    ${price}
    Wait And Input Text    ${ProductLocators.DESCRIPTION}    ${description}
    Wait And Click    ${ProductLocators.SAVE_BUTTON}
