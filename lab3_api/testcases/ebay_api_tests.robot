*** Settings ***
Resource    ../resources/ebay_keywords.robot

*** Variables ***
${ACCESS_TOKEN}    v^1.1#i^1#I^3#f^0#r^0#p^3#t^H4sIAAAAAAAA/+VZa2wjRx2P8yohHFTtcVTXHhjfqaJc196X7fU29uG8SHJx4ti5XBIJRbOzs/Fc1rvOzmxin0BKg2gRtKgSqBREq5MKnCjfejq1Qj2+AFHV0qiVinRtANHAB3QgBK3EfQAKs3aSc8I9YrvSWbBfVjP7f/3+r9mZ4Vc6uz77yNAjVw/47mg9t8KvtPp8Qjff1dlx/KNtrYc7WvgqAt+5lWMr7attf+whIG8W1AwiBdsiyF/MmxZRy5PxgOtYqg0IJqoF8oioFKrZZGpUFYO8WnBsakPbDPiH++MBTQRaJAoMXkeipskam7W2ZU7a8QCQRTmi8BGRVyIxFFbYd0JcNGwRCiwaD4i8GOZ4heOFSZFXpZgqykFeEmYD/inkEGxbjCTIBxJlc9Uyr1Nl681NBYQghzIhgcRwcjA7nhzuHxib7AlVyUps+SFLAXXJ7lGfrSP/FDBddHM1pEytZl0IESGBUKKiYbdQNbltTB3ml10twEhUFmNKGEaFqCgbH4grB20nD+jN7fBmsM4ZZVIVWRTT0q08yryhnUGQbo3GmIjhfr/3mnCBiQ2MnHhgoDc5cyo7kAn4s+m0Yy9hHellpJIsC5IiSIEERYS5EDlzS8jSket44y11FZlbzt6jr8+2dOy5jvjHbNqLmO1or4fEKg8xonFr3Eka1LOrmk7c9qQYnvVCW4mlS3OWF12UZ+7wl4e3jsN2YlxLhQ8qNUAUSJoEgMRKUVN0uSo1vFqvOz0SXoSS6XTIswVpoMTlgbOAaMEEEHGQudfNIwfrqhQ2REkxEKdHYgYnxwyD08J6hBMMhHiENA3GlP+/LKHUwZpL0U6m7P1QhhoPZKFdQGnbxLAU2EtS7j9beVEk8UCO0oIaCi0vLweXpaDtzIdEnhdC06nRLMyhPAjs0OJbE3O4nLQQMS6CVVoqMGuKLAGZcms+kJAcPQ0cWup1S2ycRabJXttJvMvCxN7ZG0DtMzHzwyRT1FxIh2xCkd4QNB0tYYjmsH7bkHm1fl10nNAQMtOex1YK0Zx9+7BdF5fXFob7G8LGuiigzYWqqrEIUrkBSUFFlDg+qvJ8Q2CThcJwPu9SoJlouMliKYcFIdxYnhZc9zZW33VRLc6TsyUJKw5ADUHzFl8VA0Ol9gKyWP/0ar3JemhmYDAzkB2amxw/OTDWENoMMhxEcpMe1mbL0+REcjDJnlT6zIyZ642kbeH0cvK4vpi3S0DoHRoYGhqVnbw8kovk6UgxnZnKsSTI5OHnQxKmqTPGzOyERkFxcSIeb8hJWQQd1GStqy+MeiOybY+MTfNZYWAqWVxSRtN4OimawJ0opUbHzxSXclN9JWmiMfCTW2XQZCXgVBJ3rlylc2zUEMiB+Uo/82q9iUBGIkhUJFEWYgoPdE2BItIBkIHBHj4sNtbovCWqySpeY7stbCGdM4EGCpjL9k5zUV7TDKRAngNIMaIIwAZXrv/VhYt4e5vmgubxEyaAxTLoratBaOdDNmCbeG9qrmyxfz9EIc0tMf06coIOArptmaX98827bJNa4a5m8mr9xoyEbcGClT04g1Kj1t3MNfBgi+2rqe2U6lG4w1wDD4DQdi1aj7ot1ho4DNc0sGl6+/N6FFax12KmBcwSxZDUH8PyIQxzL8HzOVqrHDaXRw7jh4ACtr+rI4FJzi4UvCyEwNkn9HK9GAarF+DC8oFXbcZivXL6WC/YHX7WJbDZsJRCzrZQA1K8Wq9IArrO/hvqDuKORd5JYcNCKufZddUCtry+S2pgKYBSufJ0TAreqlFDY6EoH9QdYNRSdx5TDeQOYkaB/WfqHqZ6Q2HZFBsYVmQQVyPQwYU66uWGcuoJLmFNvKbQVhjq9cEScuzGTnaQjh0E6Zzr4Nv/A8JqPXGdn8o5HQPTtLm9/5hg0YHaAmjIAZ5nm/HULp3MZk+PZxo7t+tHS822TwhHBU2QIeAgikJOFmGEi8VkwPGGoIi8IkVicqQhzE13UilEwzKv8NHIvs/t9kxU3Yz819VYaPcNdaKl/Airvlf4Vd9aq8/H9/OccJx/oLPtVHvbRwKE9fYgAZau2cUgBkaQ/RhZbCVzUHABlQoAO613t7x55YnszBsnX3zyp2cXHw6eWGvpqrooP/cF/p6dq/KuNqG76t6cv+/alw7hY584IIYZckHkpZgoz/JHr31tFw61H7xjcPLbvjeubBz55cbwuW+8/MVffPe13/MHdoh8vo6W9lVfS6YzlXrv3aFj936t/0f+y+4F8puvPPv2n56fuvLkT4qLb/31wY8/utj+fv6h00PwyHrfZnLtqws9I2+OvXDo0Ev/6k49fen59TB57urFs7/W3vtH19RnOh6/f3bz4GPH3mp/7DsOfO3R80e1syN/OKleSD3zDnrpPHp65dX73hk5//PljYul7uDRzVMnf/W74I8B+OFasv3BzNI371H/uXap9fL6nYMbJ/62OP/KgYul0OtPKX1f/8uHR7uVe+HPNr8vfOpS+sLVP7/8g/jmpfX3p+//0MzlntPfSzwsxXtST3wSvv65u+5av7tz2khfePXIRubt1S//Nn34S8mZw1dbN8FDay/++91nP30id7Cj+Pd84in9W89VYvofWcRhgMIgAAA=

*** Test Cases ***


####Get Orders####

Get Orders With Valid Token
    [Documentation]    Récupération des commandes avec un access token valide
    # On configure la session avec le token valide
    Log    Using access token: ${ACCESS_TOKEN}
    Configure eBay Session    ${ACCESS_TOKEN}
     # On appelle l'API pour récupérer les commandes
    ${response}    Get Orders    ${ACCESS_TOKEN}
     # Vérification que la réponse est correcte (code 200)
    Verify API Response Status    ${response}
     # Vérification que la réponse est correcte (code 200)
    Log    ${response.json()}



Get Orders With Invalid Token- Premier test
    [Documentation]      Récupération des commandes avec un access token invalide
    # On configure la session avec un faux token
    Log    Using invalid token: FAUX_TOKEN
    Configure eBay Session    FAUX_TOKEN
    # Exécution du test sans arrêt en cas d’erreur
    ${result}=    Run Keyword And Ignore Error    Get Orders    FAUX_TOKEN
    ${status}=    Set Variable    ${result[0]}
    ${response}=  Set Variable    ${result[1]}
    # Vérifie que l’appel a échoué
    Log    Status = ${status}
    Should Be Equal As Strings    ${status}    FAIL
    Log    Erreur attendue : ${response}


Get Orders Without Token
    [Documentation]    Appel à l'API sans fournir de token
    ${empty_token}=    Set Variable    ""
    Configure eBay Session    ${empty_token}
    ${result}=    Run Keyword And Ignore Error    Get Orders    ${empty_token}
    ${status}=    Set Variable    ${result[0]}
    ${response}=  Set Variable    ${result[1]}
    # On attend une erreur 401 (non autorisé)
    Should Be Equal As Strings    ${status}    FAIL
    Should Contain    ${response}    401
    Log    Erreur capturée : ${response}






#### Get Order ####


Get Order Details With Valid Token (Fallback)
    [Documentation]    Teste la récupération des détails d'une commande ; utilise un ID fictif si aucun ID réel n’est disponible
    ${order_id}=    Set Variable If    '${EMPTY}' == ''    FAKE-ORDER-ID    ${EMPTY}
    Configure eBay Session    ${ACCESS_TOKEN}
    ${result}=    Run Keyword And Ignore Error    Get Order Details    ${ACCESS_TOKEN}    ${order_id}
    ${status}=    Set Variable    ${result[0]}
    ${response}=  Set Variable    ${result[1]}
    # Comme c'est un faux ID, on attend une erreur 400 (mauvaise requête)
    Should Be Equal As Strings    ${status}    FAIL
    Should Contain    ${response}    400
    Log    ${response}


Get Order Details With Valid Token
    [Documentation]     Teste la récupération des détails d'une commande avec valid token
    Configure eBay Session    ${ACCESS_TOKEN}
    ${response}=    Run Keyword And Ignore Error    Get Order Details    ${ACCESS_TOKEN}    FAKE-ORDER-ID
    ${status}=    Set Variable    ${response[0]}
    ${body}=      Set Variable    ${response[1]}
    # Résultat attendu : échec avec code 400
    Should Be Equal As Strings    ${status}    FAIL
    Should Contain    ${body}    400



Get Order With Invalid Token
    [Documentation]    Test getting orders with invalid access token
    Configure eBay Session    FAUX_TOKEN
    ${result}=    Run Keyword And Ignore Error    Get Orders    FAUX_TOKEN
    ${status}=    Set Variable    ${result[0]}
    ${response}=  Set Variable    ${result[1]}
    Should Be Equal As Strings    ${status}    FAIL
    Should Contain    ${response}    401
    Log    Erreur capturée : ${response}


Get Order Without Token
    [Documentation]    Test de récupération de commande sans fournir de token
    ${empty_token}=    Set Variable    ""
    Configure eBay Session    ${empty_token}
    ${result}=    Run Keyword And Ignore Error    Get Order Details    ${empty_token}    FAKE-ORDER-ID
    ${status}=    Set Variable    ${result[0]}
    ${response}=  Set Variable    ${result[1]}
    Should Be Equal As Strings    ${status}    FAIL
    Should Contain    ${response}    401
    Log    Erreur capturée : ${response}



### Issue Refund ####

Create Refund With Valid Order (Skipped)
    [Documentation]    Test à compléter quand un vrai order ID et line item ID sont disponibles
    ${order_id}=        Set Variable    ${EMPTY}
    ${line_item_id}=    Set Variable    ${EMPTY}
    # Si aucun ID n’est défini, on saute le test
    Run Keyword If    '${order_id}' == '' or '${line_item_id}' == ''    Skip    Pas de données de commande - test ignoré
    Configure eBay Session    ${ACCESS_TOKEN}
    ${response}    Create Refund    ${ACCESS_TOKEN}    ${order_id}    ${line_item_id}    10.00
    Verify API Response Status    ${response}    200
    Log    ${response.json()}


Create Refund With Valid Token
    [Documentation]    Tente de créer un remboursement avec un ID inexistant
    Configure eBay Session    ${ACCESS_TOKEN}
    ${result}=    Run Keyword And Ignore Error    Create Refund    ${ACCESS_TOKEN}    FAKE-ORDER-ID    FAKE-LINEITEM-ID    10.00
    ${status}=    Set Variable    ${result[0]}
    ${response}=  Set Variable    ${result[1]}
    Should Be Equal As Strings    ${status}    FAIL
    Should Contain    ${response}    Not Found


Create Refund With Invalid Amount
    [Documentation]    Tente de créer un remboursement avec un montant invalide (négatif)
    Configure eBay Session    ${ACCESS_TOKEN}
    ${result}=    Run Keyword And Ignore Error    Create Refund    ${ACCESS_TOKEN}    FAKE-ORDER-ID    FAKE-LINEITEM-ID    -10.00
    ${status}=    Set Variable    ${result[0]}
    ${response}=  Set Variable    ${result[1]}
    Should Be Equal As Strings    ${status}    FAIL
    Should Contain Any    ${response}    400    404
    Log    Erreur capturée : ${response}



Create Refund Without Token
    [Documentation]    Tente de créer un remboursement sans fournir de token
    ${empty_token}=    Set Variable    ""
    Configure eBay Session    ${empty_token}
    ${result}=    Run Keyword And Ignore Error    Create Refund    ${empty_token}    FAKE-ORDER-ID    FAKE-LINEITEM-ID    10.00
    ${status}=    Set Variable    ${result[0]}
    ${response}=  Set Variable    ${result[1]}
    Should Be Equal As Strings    ${status}    FAIL
    Should Contain Any    ${response}    401    403    404
    Log    Erreur capturée : ${response}





