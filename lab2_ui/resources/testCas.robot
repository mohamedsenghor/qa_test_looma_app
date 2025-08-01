*** Settings ***
Library     SeleniumLibrary
Variables   ../pageobject/locators.py
Variables   ../pageobject/variables.py

*** Keywords ***
Ouvrir le navigateur
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    1

Aller à l'adresse de la page d'accueil
    Go To    ${URL}
    Wait Until Page Contains     Customers Are Priority One!    

Vérifier le contenu de la page d'accueil
    Page Should Contain Element    //*[@id="feature"]/div/div/div[1]/h2

Fermer le navigateur
    Close Browser

