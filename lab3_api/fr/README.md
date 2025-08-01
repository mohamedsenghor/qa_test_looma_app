# Lab 3 API - Suite de tests API eBay

## Auteurs

Bassine DIALLO  
Mohamed SENGHOR

## Vue d'ensemble

Il s'agit d'une suite de tests automatisés Robot Framework pour l'API REST eBay, utilisant l'environnement sandbox. Le projet cible les API Fulfillment et Finance d'eBay, incluant la gestion des commandes, la récupération des détails de commande et le traitement des remboursements via l'authentification OAuth 2.0.

## Structure du projet

```text
lab3_api/
├── README.md                     # Cette documentation
├── fr/                          # Documentation en français
│   └── README.md                # Version française de la documentation
├── pageobjects/                 # Objets de configuration et de données
│   ├── locators.py              # Définitions des endpoints API
│   └── variables.py             # Variables et configuration des tests
├── resources/                   # Ressources et mots-clés de test
│   └── ebay_keywords.robot      # Mots-clés réutilisables pour les tests API
└── testcases/                   # Définition des cas de test
    └── ebay_api_tests.robot     # Cas de test API eBay
```

## Prérequis

### Logiciels nécessaires

- **Python 3.8+** avec pip
- **Robot Framework 6.1.1+**
- **RequestsLibrary** pour les appels HTTP API
- **Collections Library** pour la manipulation des données

### Dépendances Python

#### requirements.txt

```text
robotframework==6.1.1
robotframework-requests==0.9.0
requests==2.31.0
```

```bash
pip install -r requirements.txt
```

### Accès API eBay

- **Compte développeur eBay** avec accès sandbox
- **Jeton OAuth 2.0** pour l'authentification API
- **Accès à l'environnement sandbox eBay**

## Configuration

### Configuration API (`pageobjects/variables.py`)

```python
BASE_URL = "https://api.sandbox.ebay.com/sell/fulfillment/v1"
ACCESS_TOKEN = "v^1.1#i^1#r^0#p^3#f^0#I^3#t^H4s..."  # Jeton OAuth 2.0

HEADERS = {
    "Authorization": f"Bearer {ACCESS_TOKEN}",
    "Content-Type": "application/json"
}
```

**REMARQUE** : Le ACCESS_TOKEN est un jeton OAuth 2.0 valide pour l'environnement sandbox eBay. Remplacez-le par votre propre jeton pour les tests.

### Endpoints API (`pageobjects/locators.py`)

```python
ENDPOINTS = {
    "GET_ORDER": "/order/",
    "GET_ORDERS": "/order",
    "ISSUE_REFUND": "/order/{orderId}/issue_refund"
}
```

### Variables de test (`testcases/ebay_api_tests.robot`)

```robot
*** Variables ***
${ACCESS_TOKEN}    v^1.1#i^1#f^0#r^0#p^3#I^3#t^H4s...  # Jeton OAuth valide
${EBAY_API_BASE_URL}    https://api.sandbox.ebay.com
${EBAY_API_VERSION}    v1
```

## Composants de test

### Mots-clés API (`resources/ebay_keywords.robot`)

La suite de tests fournit des mots-clés réutilisables pour interagir avec l'API eBay :

#### Gestion de session

- **`Configure eBay Session`** : Initialise la session HTTP avec l'URL de base de l'API eBay
- **`Create Session`** : Crée une session RequestsLibrary pour les appels API

#### Gestion des commandes

- **`Get Orders`** : Récupère la liste des commandes via l'API Fulfillment
- **`Get Order Details`** : Récupère les détails d'une commande spécifique
- **`Create Refund`** : Traite un remboursement pour des lignes de commande

#### Validation des réponses

- **`Verify API Response Status`** : Valide les codes de statut HTTP
- **`Verify API Error Response`** : Valide la structure et le contenu des réponses d'erreur

### Endpoints API testés

#### API Fulfillment

```text
GET /sell/fulfillment/v1/order
GET /sell/fulfillment/v1/order/{orderId}
```

#### API Finance

```text
POST /sell/finances/v1/order/{orderId}/refund
```

## Exécution des tests

### 1. Préparation de l'environnement

```bash
# Aller dans le répertoire du projet
cd /Users/mac/qa_test_looma_app/lab3_api

# Installer les dépendances Python
pip install -r requirements.txt
```

### 2. Exécuter les suites de tests

```bash
# Exécuter tous les tests
robot testcases/

# Exécuter un fichier de test spécifique
robot testcases/ebay_api_tests.robot

# Exécuter les tests avec logs détaillés
robot --loglevel DEBUG testcases/

# Générer les rapports dans un dossier personnalisé
robot --outputdir results testcases/
```

### 3. Exemples d'exécution

```bash
# Exécution basique
robot testcases/

# Exécution détaillée avec logs
robot --loglevel DEBUG --outputdir results testcases/

# Exécuter un cas de test spécifique
robot --test "Get Orders With Valid Token" testcases/ebay_api_tests.robot

# Exécuter avec des variables personnalisées
robot --variable ACCESS_TOKEN:votre_token_ici testcases/

# Continuer en cas d'échec
robot --continue-on-failure testcases/
```

## Cas de test

### Tests d'authentification

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Get Orders With Valid Token** | Teste l'accès API avec un jeton OAuth valide | 200 OK avec la liste des commandes |
| **Get Orders With Invalid Token** | Teste la sécurité API avec un jeton invalide | Erreur 401 Unauthorized |
| **Get Orders With Invalid Token- Premier test** | Test supplémentaire avec jeton invalide | Statut FAIL avec message d'erreur |

### Tests de gestion des commandes

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Get Order Details With Valid Token** | Teste la récupération des détails d'une commande avec un ID fictif | 400 Bad Request pour ID de commande invalide |
| **Get Order Details With Valid Token (Skipped)** | Placeholder pour test réel | Ignoré si aucune commande réelle disponible |

### Tests d'opérations financières

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Create Refund With Valid Token** | Teste la création de remboursement avec des données fictives | 404 Not Found pour commande fictive |
| **Create Refund With Valid Order (Skipped)** | Placeholder pour test réel de remboursement | Ignoré si aucune commande réelle disponible |

## Rapports de test

Robot Framework génère des rapports complets après l'exécution :

- **`report.html`** : Résumé de l'exécution des tests
- **`log.html`** : Log détaillé étape par étape avec requêtes/réponses API
- **`output.xml`** : Résultats lisibles par machine pour CI/CD

### Visualisation des rapports

```bash
# Ouvrir les rapports dans le navigateur
open report.html
open log.html

# Ou spécifier un dossier de sortie personnalisé
robot --outputdir results testcases/
open results/report.html
```

## Dépannage

### Problèmes courants et solutions

#### 1. Expiration du jeton

```text
401 Unauthorized - Token expired
```

**Solution** : Générez un nouveau jeton OAuth depuis la console développeur eBay et mettez à jour la variable `ACCESS_TOKEN`.

#### 2. Limitation de débit API

```text
429 Too Many Requests
```

**Solutions** :

- Ajoutez des délais entre les appels API
- Suivez les recommandations de limitation d'eBay
- Optimisez les données de test

#### 3. IDs de commande invalides

```text
404 Not Found - Order not found
```

**Solutions** :

- Utilisez des IDs de commande réels du compte sandbox
- Implémentez la création de commande pour les tests
- Gérez l'absence de données avec le mot-clé Skip

#### 4. Problèmes de connectivité réseau

```text
ConnectionError: Failed to establish connection
```

**Solutions** :

- Vérifiez la connexion internet
- Contrôlez le statut du service sandbox eBay
- Implémentez des mécanismes de retry pour les erreurs transitoires

### Mode debug

```bash
# Exécuter avec logs maximum
robot --loglevel TRACE --outputdir debug_results testcases/

# Exécuter avec logs des requêtes/réponses
robot --variable LOG_LEVEL:DEBUG testcases/

# Capturer les erreurs détaillées
robot --continue-on-failure --loglevel DEBUG testcases/
```

## Authentification & Sécurité

### Gestion du jeton OAuth 2.0

La suite de tests utilise l'authentification OAuth 2.0 d'eBay :

```robot
*** Variables ***
${ACCESS_TOKEN}    v^1.1#i^1#f^0#r^0#p^3#I^3#t^H4s...

*** Keywords ***
Configure eBay Session
    [Arguments]    ${access_token}
    Create Session    ebay_session    ${EBAY_API_BASE_URL}
```

### Bonnes pratiques de sécurité des jetons

- Stockez les jetons dans des variables d'environnement en production
- Implémentez des mécanismes de rafraîchissement de jeton
- Utilisez des jetons différents selon l'environnement de test
- Surveillez l'expiration et le renouvellement des jetons

## Exemples de requêtes API

### Requête Get Orders

```http
GET /sell/fulfillment/v1/order HTTP/1.1
Host: api.sandbox.ebay.com
Authorization: Bearer v^1.1#i^1#f^0#r^0#p^3#I^3#t^H4s...
Content-Type: application/json
```

### Requête Create Refund

```http
POST /sell/finances/v1/order/{orderId}/refund HTTP/1.1
Host: api.sandbox.ebay.com
Authorization: Bearer v^1.1#i^1#f^0#r^0#p^3#I^3#t^H4s...
Content-Type: application/json

{
  "orderId": "12345",
  "refundItems": [
    {
      "lineItemId": "67890",
      "amount": {
        "currency": "USD",
        "value": "10.00"
      }
    }
  ]
}
```

## Bonnes pratiques appliquées

### Tests API

- **Authentification par jeton** : Implémentation sécurisée OAuth 2.0
- **Gestion des erreurs** : Tests complets des scénarios d'erreur
- **Validation des réponses** : Vérification des codes de statut et du contenu
- **Mots-clés modulaires** : Composants réutilisables pour l'interaction API

### Conception des tests

- **Tests positifs/négatifs** : Couverture des scénarios valides et invalides
- **Approche orientée données** : Gestion configurable des données de test
- **Logique de saut** : Gestion élégante des prérequis manquants
- **Logs détaillés** : Journalisation complète des requêtes/réponses

### Architecture du framework

- **Page Object Pattern** : Organisation des endpoints et variables
- **Séparation des responsabilités** : Données, mots-clés et cas de test distincts
- **Configuration d'environnement** : Adaptable sandbox/production
- **Gestion des erreurs** : Traitement robuste des erreurs et reporting

## Contribution

### Ajouter de nouveaux tests API

1. Définir les nouveaux endpoints dans `pageobjects/locators.py`
2. Ajouter les mots-clés correspondants dans `resources/ebay_keywords.robot`
3. Créer les cas de test dans `testcases/ebay_api_tests.robot`
4. Mettre à jour les données de test dans `pageobjects/variables.py`
5. Mettre à jour ce README avec la nouvelle documentation

### Développement de mots-clés API

- Respecter la convention de nommage Robot Framework
- Documenter les arguments des mots-clés
- Implémenter la gestion des erreurs et la journalisation
- Ajouter la validation des réponses pour chaque appel API

### Gestion des données de test

- Utiliser des variables d'environnement pour les données sensibles
- Implémenter des procédures de setup/teardown pour les données de test
- Isoler les données de test entre les exécutions
- Documenter les prérequis de données nécessaires

## Licence

Cette suite de tests fait partie des exercices de laboratoire QA et est destinée à un usage pédagogique.

## Technologies & Frameworks

- **Robot Framework** 6.1.1+
- **Python** 3.13+
- **RequestsLibrary** pour les opérations HTTP
- **API eBay** (environnement sandbox)
- **OAuth 2.0** pour l'authentification
- **JSON** pour l'échange de données
