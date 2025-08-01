# Lab 3 API - Suite de tests API eBay

## Auteurs

**Bassine DIALLO**  
**Mohamed SENGHOR**

## Vue d'ensemble

Il s'agit d'une suite de tests automatisés Robot Framework pour l'API REST d'eBay en environnement sandbox. Le projet cible les API Fulfillment et Finance d'eBay : gestion des commandes, récupération des détails de commande, traitement des remboursements via OAuth 2.0. Un mécanisme de repli robuste gère l'indisponibilité du sandbox eBay.

## Structure du projet

```text
lab3_api/
├── README.md                    # Cette documentation
├── fr/                          # Documentation en français
│   └── README.md                # Version française
├── pageobjects/                 # Objets de configuration et de données
│   ├── locators.py              # Définitions des endpoints API
│   └── variables.py             # Variables et configuration de test
├── resources/                   # Ressources et mots-clés de test
│   ├── ebay_config.py           # Configuration API eBay
│   └── ebay_keywords.robot      # Mots-clés réutilisables pour les tests API
└── testcases/                   # Définition des cas de test
  └── ebay_api_tests.robot     # Cas de test API eBay
```

## Prérequis

### Logiciels requis

- **Python 3.8+** avec pip
- **Robot Framework 6.1.1+**
- **RequestsLibrary** pour les appels HTTP
- **Collections Library** pour la manipulation de données

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
- **Jeton OAuth 2.0** pour l’authentification API
- **Environnement sandbox eBay**
- **Mode de repli** : réponses simulées automatiques si eBay est indisponible

## Configuration

### Configuration API (`resources/ebay_config.py`)

```python
EBAY_BASE_URL = "https://api.ebay.com/sell/fulfillment/v1"
ACCESS_TOKEN = "v^1.1#i^1#f^0#r^0#p^3#I^3#t^H4s..."  # Jeton OAuth 2.0
REFRESH_TOKEN = "v^1.1#i^1#p^3#I^3#r^1#f^0#t^Ul4x..."  # Jeton de rafraîchissement
```

### Variables de test (`pageobjects/variables.py`)

```python
BASE_URL = "https://api.sandbox.ebay.com/sell/fulfillment/v1"
ACCESS_TOKEN = "v^1.1#i^1#r^0#p^3#f^0#I^3#t^H4s..."  # Jeton OAuth 2.0 valide

HEADERS = {
  "Authorization": f"Bearer {ACCESS_TOKEN}",
  "Content-Type": "application/json"
}
```

**REMARQUE** : Remplacez ACCESS_TOKEN par votre propre jeton OAuth 2.0 pour le sandbox eBay.

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
${ACCESS_TOKEN}    v^1.1#i^1#I^3#f^0#r^0#p^3#t^H4s...  # Jeton OAuth valide
${EBAY_API_BASE_URL}    https://api.sandbox.ebay.com
${EBAY_API_VERSION}    v1
```

## Composants de test

### Mots-clés API (`resources/ebay_keywords.robot`)

La suite propose des mots-clés réutilisables pour interagir avec l’API eBay :

#### Gestion de session

- **`Configure eBay Session`** : Initialise la session HTTP avec l’API eBay
- **`Create Session`** : Crée une session RequestsLibrary pour les appels API

#### Gestion des commandes

- **`Get Orders`** : Récupère la liste des commandes via l’API Fulfillment
- **`Get Order Details`** : Détails d’une commande spécifique
- **`Create Refund`** : Traite un remboursement pour une commande

#### Validation des réponses

- **`Verify API Response Status`** : Valide les codes de statut HTTP
- **`Verify API Error Response`** : Valide la structure et le contenu des erreurs

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

### 1. Préparation de l’environnement

```bash
# Aller dans le dossier du projet
cd /Users/mac/qa_test_looma_app/lab3_api

# Installer les dépendances Python
pip install -r requirements.txt
```

### 2. Lancer les suites de tests

```bash
# Lancer tous les tests
robot testcases/

# Lancer un fichier de test spécifique
robot testcases/ebay_api_tests.robot

# Lancer avec logs détaillés
robot --loglevel DEBUG testcases/

# Générer les rapports dans un dossier personnalisé
robot --outputdir results testcases/
```

### 3. Exemples d’exécution

```bash
# Exécution basique
robot testcases/

# Exécution détaillée avec logs
robot --loglevel DEBUG --outputdir results testcases/

# Lancer un cas de test précis
robot --test "Get Orders With Valid Token" testcases/ebay_api_tests.robot

# Lancer avec variables personnalisées
robot --variable ACCESS_TOKEN:votre_token testcases/

# Continuer en cas d’échec
robot --continue-on-failure testcases/
```

## Cas de test

### Tests d’authentification

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Get Orders With Valid Token** | Accès API avec jeton OAuth valide | 200 OK avec liste des commandes |
| **Get Orders With Invalid Token- Premier test** | Sécurité API avec jeton invalide | Échec avec message d’erreur |
| **Get Orders Without Token** | Appel API sans authentification | Erreur 401 Unauthorized |

### Gestion des commandes

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Get Order Details With Valid Token (Fallback)** | Détails commande avec mécanisme de repli | 400 Bad Request pour ID invalide |
| **Get Order Details With Valid Token** | Détails commande avec ID fictif | 400 Bad Request pour ID invalide |
| **Get Order With Invalid Token** | Récupération commande avec authentification invalide | Erreur 401 Unauthorized |
| **Get Order Without Token** | Récupération commande sans authentification | Erreur 401 Unauthorized |

### Opérations financières

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Create Refund With Valid Order (Skipped)** | Placeholder pour test réel de remboursement | Sauté si aucune commande réelle |
| **Create Refund With Valid Token** | Création de remboursement avec données fictives | Échec avec erreur Not Found |
| **Create Refund With Invalid Amount** | Remboursement avec montant négatif | Échec avec erreur 400/404 |
| **Create Refund Without Token** | Remboursement sans authentification | Échec avec erreur 401/403/404 |

## Mécanisme de repli

### Gestion de l’indisponibilité du sandbox eBay

La suite détecte automatiquement l’indisponibilité du sandbox :

#### Détection automatique

- Vérifie la disponibilité du sandbox avant exécution
- Bascule transparente entre API réelle et réponses simulées
- Logs clairs sur le mode utilisé

#### Système de réponses simulées

- Réponses réalistes imitant la structure de l’API eBay
- Codes HTTP appropriés selon les scénarios
- Simulation complète des erreurs

#### Bénéfices

- **Tests continus** : exécution même si le sandbox est hors ligne
- **Compatible CI/CD** : pas d’échec de pipeline à cause de dépendances externes
- **Continuité de développement** : framework utilisable en toute circonstance
- **Tests réalistes** : respect du contrat API même en mode simulé

## Rapports de tests

Robot Framework génère des rapports complets :

- **`report.html`** : résumé global de l’exécution
- **`log.html`** : log détaillé étape par étape avec requêtes/réponses API
- **`output.xml`** : résultats pour intégration CI/CD

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

**Solution** : Générez un nouveau jeton OAuth via la console développeur eBay et mettez à jour la variable `ACCESS_TOKEN` dans `resources/ebay_config.py` et `pageobjects/variables.py`.

#### 2. Limitation de débit API

```text
429 Too Many Requests
```

**Solutions** :

- Ajoutez des délais entre les appels API
- Suivez les recommandations eBay sur le débit
- Optimisez les données de test

#### 3. IDs de commande invalides

```text
404 Not Found - Order not found
```

**Solutions** :

- Utilisez des IDs réels du sandbox
- Ajoutez une étape de création de commande pour les tests
- Gérez l’absence de données avec le mot-clé Skip

#### 4. Problèmes de connectivité réseau

```text
ConnectionError: Failed to establish connection
```

**Solutions** :

- Vérifiez la connexion internet
- Contrôlez le statut du service sandbox eBay
- Le mécanisme de repli gère ce cas automatiquement

#### 5. Sandbox eBay indisponible

Si le sandbox est totalement indisponible :

- **Repli automatique** : utilisation de réponses simulées
- **Logs clairs** : indication du mode repli dans les logs
- **Couverture complète** : tous les scénarios restent testables

### Mode debug

```bash
# Exécution avec logs maximum
robot --loglevel TRACE --outputdir debug_results testcases/

# Logs des requêtes/réponses
robot --variable LOG_LEVEL:DEBUG testcases/

# Capturer les erreurs détaillées
robot --continue-on-failure --loglevel DEBUG testcases/
```

## Authentification & Sécurité

### Gestion des jetons OAuth 2.0

La suite utilise l’authentification OAuth 2.0 d’eBay :

```robot
*** Variables ***
${ACCESS_TOKEN}    v^1.1#i^1#I^3#f^0#r^0#p^3#t^H4s...

*** Keywords ***
Configure eBay Session
  [Arguments]    ${access_token}
  Create Session    ebay_session    ${EBAY_API_BASE_URL}
```

### Bonnes pratiques de sécurité des jetons

- Stockez les jetons dans des variables d’environnement en production
- Implémentez le rafraîchissement automatique via `REFRESH_TOKEN`
- Utilisez des jetons différents selon l’environnement
- Surveillez l’expiration et le renouvellement des jetons

## Exemples de requêtes API

### Requête Get Orders

```http
GET /sell/fulfillment/v1/order HTTP/1.1
Host: api.sandbox.ebay.com
Authorization: Bearer v^1.1#i^1#I^3#f^0#r^0#p^3#t^H4s...
Content-Type: application/json
```

### Requête Create Refund

```http
POST /sell/finances/v1/order/{orderId}/refund HTTP/1.1
Host: api.sandbox.ebay.com
Authorization: Bearer v^1.1#i^1#I^3#f^0#r^0#p^3#t^H4s...
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

## Bonnes pratiques mises en œuvre

### Tests API

- **Authentification par jeton** : OAuth 2.0 sécurisé
- **Gestion des erreurs** : tests complets des scénarios d’erreur
- **Validation des réponses** : codes de statut et contenu
- **Mots-clés modulaires** : composants réutilisables
- **Résilience repli** : gestion automatique de l’indisponibilité externe

### Conception des tests

- **Tests positifs/négatifs** : couverture des scénarios valides et invalides
- **Approche data-driven** : gestion configurable des données de test
- **Logique Skip** : gestion élégante des prérequis manquants
- **Logs détaillés** : journalisation complète des requêtes/réponses
- **Support français** : documentation complète en français (`fr/README.md`)

### Architecture du framework

- **Page Object Pattern** : gestion organisée des endpoints et variables
- **Séparation des responsabilités** : configuration, données, mots-clés, cas de test distincts
- **Configuration d’environnement** : sandbox/production flexible
- **Gestion des erreurs** : reporting robuste avec repli
- **Double configuration** : fichiers séparés pour différents usages (`ebay_config.py` et `variables.py`)

### Développement de mots-clés API

- Respecter la convention de nommage Robot Framework
- Documenter les arguments des mots-clés
- Gérer les erreurs et logs avec `Run Keyword And Ignore Error`
- Ajouter la validation des réponses pour chaque appel API
- Prendre en compte les scénarios de repli

### Gestion des données de test

- Utiliser des variables d’environnement pour les données sensibles en production
- Implémenter des procédures de setup/teardown pour les données de test
- Isoler les données entre les exécutions
- Documenter les prérequis de données
- Gérer l’absence de données avec le mot-clé Skip

## Licence

Cette suite de tests fait partie des exercices de laboratoire QA et est destinée à un usage pédagogique.

## Technologies & Frameworks

- **Robot Framework** 6.1.1+
- **Python** 3.8+
- **RequestsLibrary** pour les opérations HTTP
- **API eBay** (environnement sandbox)
- **OAuth 2.0** pour l’authentification
- **JSON** pour l’échange de données
- **Collections Library** pour la manipulation de données
