*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/testCas.robot
Suite Setup    Ouvrir le navigateur
Suite Teardown    Fermer le navigateur



*** Test Cases ***
 Vérification de la page d'accueil
    [Tags]    smoke    home
    Aller à l'adresse de la page d'accueil
    Vérifier le contenu de la page d'accueil
