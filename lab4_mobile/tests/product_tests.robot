***Settings***
Resource    ../resources/common_keywords.robot

Test Setup    Open And Login To Application
Test Teardown    Close My Application

***Test Cases***
Should Be Able To Add A Product With All Details
    [Tags]    ProductCreation
    Fill Product Details    ${PRODUCT_TITLE}    ${PRODUCT_PRICE}    ${PRODUCT_DESCRIPTION}    ${PRODUCT_CATEGORY}    ${PRODUCT_IMAGE_URL}
    Wait Until Page Contains Element    ${PRODUCT_LIST_TITLE}    timeout=${DEFAULT_WAIT_TIME}
    Element Should Be Visible    ${LAST_PRODUCT_AFTER_OPENING_PRODUCT_LIST}

Should Not Add Product With Missing Title
    [Tags]    ProductCreation    Validation
    Fill Product Details    ${EMPTY}    ${PRODUCT_PRICE}    ${PRODUCT_DESCRIPTION}    ${PRODUCT_CATEGORY}    ${PRODUCT_IMAGE_URL}
    Verify Required Field Message    ${PRODUCT_TITLE_INPUT_ERROR}

Should Not Add Product With Missing Price
    [Tags]    ProductCreation    Validation
    Fill Product Details    ${PRODUCT_TITLE}    ${EMPTY}    ${PRODUCT_DESCRIPTION}    ${PRODUCT_CATEGORY}    ${PRODUCT_IMAGE_URL}
    Verify Required Field Message    ${PRODUCT_TITLE_INPUT_ERROR}
