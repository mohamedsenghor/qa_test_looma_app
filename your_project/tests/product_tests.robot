***Settings***
Resource    ../resources/common_keywords.robot
Variables    ../resources/locators.py

Test Setup    Open And Login To Application
Test Teardown    Close My Application

***Variables***
${VALID_USERNAME}       johnd
${VALID_PASSWORD}       m38rmF$

${VALID_PRODUCT_TITLE}        DANVOUY Womens T Shirt Casual Cotton Short
${VALID_PRODUCT_PRICE}        12.99
${VALID_PRODUCT_DESCRIPTION}  95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.
${VALID_PRODUCT_CATEGORY}     women's clothing
${VALID_PRODUCT_IMAGE_URL}    https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg

***Test Cases***
Should Be Able To Add A Product With All Details
    [Tags]    ProductCreation
    Fill Product Details    ${VALID_PRODUCT_TITLE}    ${VALID_PRODUCT_PRICE}    ${VALID_PRODUCT_DESCRIPTION}    ${VALID_PRODUCT_CATEGORY}    ${VALID_PRODUCT_IMAGE_URL}
    # Add assertions here to verify product was added successfully
    # (e.g., a success toast message, redirection to product list, etc.)
    # Example: Page Should Contain Text    Produit ajouté avec succès!

Should Not Add Product With Missing Title
    [Tags]    ProductCreation    Validation
    Fill Product Details    ${EMPTY}    ${VALID_PRODUCT_PRICE}    ${VALID_PRODUCT_DESCRIPTION}    ${VALID_PRODUCT_CATEGORY}    ${VALID_PRODUCT_IMAGE_URL}
    Verify Required Field Message    ${PRODUCT_TITLE_INPUT_ERROR}

Should Not Add Product With Missing Price
    [Tags]    ProductCreation    Validation
    Fill Product Details    ${VALID_PRODUCT_TITLE}    ${EMPTY}    ${VALID_PRODUCT_DESCRIPTION}    ${VALID_PRODUCT_CATEGORY}    ${VALID_PRODUCT_IMAGE_URL}
    Verify Required Field Message    ${PRODUCT_TITLE_INPUT_ERROR}
