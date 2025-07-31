# Documentation des Labs 2 et 3 - Tests UI et API

## Lab 2 - Tests UI (Service Client)

### Structure du Projet
```
lab2_ui/
├── pageobjects/
│   ├── customer_service_page.robot    # Keywords UI pour le service client
│   └── variables.py                  # Données clients pour les tests
├── resources/
│   ├── browser_keywords.robot        # Keywords Selenium pour le navigateur
│   └── ui_resources.robot            # Ressources communes UI
└── testcases/
    ├── customer_service_tests.robot  # Tests UI du service client
    └── add_customer_test.robot       # Tests d'ajout de client
```

### Points Importants

1. **Gestion du Navigateur**
   - Utilisation de SeleniumLibrary pour l'automatisation UI
   - Gestion centralisée de l'ouverture/fermeture du navigateur via suite setup/teardown
   - Configuration des timeouts et attentes explicites

2. **Architecture des Tests**
   - Séparation claire entre page objects et tests
   - Utilisation de variables Python pour les données de test
   - Tests indépendants avec setup/teardown appropriés

3. **Scénarios Tests**
   - Tests d'ajout de client avec données valides et invalides
   - Tests de consultation de clients
   - Tests de mise à jour de clients
   - Tests de suppression de clients

## Lab 3 - Tests API (eBay Fulfillment)

### Structure du Projet
```
lab3_api/
├── pageobjects/
│   ├── variables.py                 # Configuration API et données de test
│   └── ebay_api_page.robot         # Keywords API pour eBay Fulfillment
└── testcases/
    └── ebay_api_tests.robot        # Tests API eBay Fulfillment
```

### Points Importants

1. **Intégration API**
   - Utilisation de RequestsLibrary pour les appels API
   - Intégration avec l'API eBay Fulfillment
   - Gestion de l'authentification OAuth
   - Gestion des headers et des données JSON

2. **Architecture des Tests**
   - Tests pour les opérations d'ordre (getOrder, getOrders, issueRefund)
   - Scénarios passants et non passants pour chaque opération
   - Vérification des codes de statut HTTP
   - Vérification des réponses JSON

3. **Configuration**
   - Variables Python pour les URLs et données de test
   - Gestion des sessions API
   - Configuration des timeouts et retries

### Fonctionnalités Testées

1. **Opérations d'Ordre**
   - Récupération d'un ordre spécifique (GET /order/{orderId})
   - Liste des ordres (GET /order)
   - Remboursement d'ordre (POST /order/{orderId}/issue_refund)

2. **Scénarios de Test**
   - Tests avec données valides
   - Tests avec IDs invalides
   - Tests avec données de remboursement invalides
   - Vérification des erreurs et messages d'erreur

### Remarques Techniques

1. **Gestion des Erreurs**
   - Vérification des codes de statut HTTP
   - Vérification des messages d'erreur dans les réponses
   - Gestion des timeouts et erreurs réseau

2. **Performance**
   - Utilisation de sessions persistantes pour les appels API
   - Optimisation des timeouts et retries
   - Gestion des headers pour les performances

### Configuration Requise

Pour exécuter les tests eBay, il est nécessaire de :

1. **Obtenir un token OAuth valide**
   - Créer une application sur le Developer Program d'eBay
   - Obtenir les credentials (App ID, Cert ID, Dev ID)
   - Générer un token OAuth avec les permissions nécessaires
   - Configurer le token dans le fichier `variables.py`

2. **Configurer l'environnement de test**
   - Utiliser l'environnement Sandbox d'eBay
   - Obtenir des IDs de commande valides pour le sandbox
   - Configurer les URLs de l'API pour utiliser le sandbox

3. **Permissions requises**
   - Pour getOrder et getOrders : `https://api.ebay.com/oauth/api_scope/sell.fulfillment.readonly`
   - Pour issueRefund : `https://api.ebay.com/oauth/api_scope/sell.fulfillment`

4. **Configuration des URLs**
   - Base URL : `https://api.sandbox.ebay.com/sell/fulfillment/v1`
   - Pour les tests en production : `https://api.ebay.com/sell/fulfillment/v1`

### Exécution des Tests

Pour exécuter les tests :
```bash
# Tests UI
robot lab2_ui/testcases/customer_service_tests.robot
robot lab2_ui/testcases/add_customer_test.robot

# Tests API eBay
robot lab3_api/testcases/ebay_api_tests.robot
```

Les résultats seront générés dans les fichiers output.xml, log.html et report.html
