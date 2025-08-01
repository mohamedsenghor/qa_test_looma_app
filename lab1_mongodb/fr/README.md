# Lab 1 MongoDB - Suite de Tests de Base de Données

## Auteurs

**Bassine DIALLO**  
**Mohamed SENGHOR**

## Vue d’ensemble

Il s’agit d’une suite de tests automatisés Robot Framework pour MongoDB. Le projet cible les opérations CRUD (Créer, Lire, Mettre à jour, Supprimer) sur une base MongoDB via le driver PyMongo, en appliquant le modèle Page Object pour les entités : Produits, Utilisateurs, Commandes et Catégories.

## Structure du projet

```text
lab1_mongodb/
├── README.md                     # Cette documentation
├── __init__.py                   # Initialisation du package Python
├── fr/                          # Documentation en français
│   └── README.md                # Version française de la documentation
├── pageobjects/                 # Objets et utilitaires base de données
│   ├── __init__.py              # Initialisation du package
│   ├── locators.py              # Définitions des champs de la base
│   ├── mongodb_lib.py           # Bibliothèque d’opérations MongoDB
│   ├── variables.py             # Configuration de la base
│   └── __pycache__/             # Fichiers cache Python
├── resources/                   # Ressources et mots-clés de test
│   └── MongoDBKeywords.robot    # Mots-clés réutilisables
└── testcases/                   # Définition des cas de test
    ├── TestProducts.robot       # Cas de test CRUD Produits
    └── TestOtherEntities.robot  # Cas de test Utilisateurs, Commandes, Catégories
```

## Prérequis

### Logiciels requis

- **Python 3.8+** avec pip
- **Robot Framework 6.1.1+**
- **PyMongo** pour la connexion MongoDB
- Compte **MongoDB Atlas** ou instance MongoDB locale

### Dépendances Python

#### requirements.txt

```text
robotframework==6.1.1
pymongo==4.6.0
bson==0.5.10
```

```bash
pip install -r requirements.txt
```

### Configuration de la base

- Base MongoDB Atlas ou instance locale
- **Nom de la base** : `fakestore`
- **Collections** : `products`, `users`, `orders`, `categories`
- **Accès réseau** : IP autorisée

## Configuration

### Configuration de la base (`pageobjects/variables.py`)

```python
BASE_URL = "https://fakestoreapi.com"
MONGO_URI = "mongodb+srv://username:password@cluster0.ifptzd7.mongodb.net/"
DB_NAME = "fakeStoreDB"
PRODUCTS_ENDPOINT = "/products"
```

### Paramètres de connexion (`testcases/TestProducts.robot` & `testcases/TestOtherEntities.robot`)

```robot
*** Variables ***
${MONGO_URI}      mongodb+srv://bassinediallo20:Passer%40123@cluster0.ifptzd7.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0
${DB_NAME}        fakestore
```

**REMARQUE** : Remplacez la chaîne de connexion par vos propres identifiants MongoDB pour les tests.

### Définitions des champs (`pageobjects/locators.py`)

```python
RESPONSE_KEYS_PRODUCT = ["id", "title", "price", "description", "category", "image"]
```

## Composants de test

### Bibliothèque MongoDB (`pageobjects/mongodb_lib.py`)

La bibliothèque principale fournit les opérations MongoDB pour plusieurs entités :

#### Gestion de connexion

- **`connect_to_mongodb(uri, db_name)`** : Établit la connexion à la base
- Retourne l’objet base de données

#### Opérations Produit

- **`create_product(db, product)`** : Crée un nouveau produit
- **`read_product(db, product_id)`** : Récupère un produit par ObjectId
- **`update_product(db, product_id, update_fields)`** : Met à jour un produit
- **`delete_product(db, product_id)`** : Supprime un produit

#### Opérations Utilisateur

- **`create_user(db, user)`** : Crée un utilisateur avec validation email
- **`read_user(db, user_id)`** : Récupère un utilisateur par ObjectId
- **`update_user(db, user_id, update_fields)`** : Met à jour un utilisateur
- **`delete_user(db, user_id)`** : Supprime un utilisateur

#### Opérations Commande

- **`create_order(db, order)`** : Crée une commande avec références produits
- **`read_order(db, order_id)`** : Récupère une commande par ObjectId
- **`update_order(db, order_id, update_fields)`** : Met à jour une commande
- **`delete_order(db, order_id)`** : Supprime une commande

#### Opérations Catégorie

- **`create_category(db, category)`** : Crée une catégorie avec nom unique
- **`read_category(db, category_id)`** : Récupère une catégorie par ObjectId
- **`update_category(db, category_id, update_fields)`** : Met à jour une catégorie
- **`delete_category(db, category_id)`** : Supprime une catégorie

#### Validation des données

- **Champs obligatoires** : Validation des champs requis pour chaque entité
- **Validation email** : Format email correct pour les utilisateurs
- **Validation prix** : Prix positif pour les produits
- **Gestion ObjectId** : Conversion et validation ObjectId MongoDB
- **Contraintes d’unicité** : Noms de catégories uniques

### Mots-clés Robot (`resources/MongoDBKeywords.robot`)

Mots-clés Robot Framework de haut niveau :

#### Gestion de session

- **`Connect To Mongodb`** : Établit et stocke la connexion
- **`Set Suite Variable`** : Maintient la connexion entre les tests

#### Opérations Produit

- **`Create Product`** : Crée un produit et retourne l’ID
- **`Read Product`** : Récupère un produit par ID
- **`Update Product`** : Met à jour un produit
- **`Delete Product`** : Supprime un produit et retourne le nombre supprimé

## Exécution des tests

### 1. Préparation de l’environnement

```bash
# Aller dans le dossier du projet
cd /Users/mac/qa_test_looma_app/lab1_mongodb

# Installer les dépendances Python
pip install -r requirements.txt

# Vérifier la connexion MongoDB
python -c "from pymongo import MongoClient; print('PyMongo installé avec succès')"
```

### 2. Exécuter les suites de tests

```bash
# Lancer tous les tests
robot testcases/

# Lancer un fichier de test spécifique
robot testcases/TestProducts.robot
robot testcases/TestOtherEntities.robot

# Lancer avec logs détaillés
robot --loglevel DEBUG testcases/

# Générer les rapports dans un dossier personnalisé
robot --outputdir results testcases/
```

### 3. Exemples d’exécution

```bash
# Exécution basique
robot testcases/TestProducts.robot

# Tous les tests entités
robot testcases/TestOtherEntities.robot

# Exécution détaillée avec logs
robot --loglevel DEBUG --outputdir results testcases/

# Cas de test spécifique
robot --test "Create Product - Success" testcases/TestProducts.robot
robot --test "Create User - Success" testcases/TestOtherEntities.robot

# Tests avec variables personnalisées
robot --variable MONGO_URI:votre_chaine_connexion testcases/

# Continuer en cas d’échec
robot --continue-on-failure testcases/
```

## Cas de test

### Tests CRUD Produit (`testcases/TestProducts.robot`)

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Create Product - Success** | Crée un clavier à 100€ | ID produit retourné non vide |
| **Create Product - Missing Title - Fail** | Produit sans titre | ID vide |
| **Create Product - Invalid Price (Negative) - Fail** | Produit avec prix négatif | ID vide |
| **Read Product - Success** | Crée une souris puis la lit | Le produit contient le champ titre |
| **Read Product - Invalid ID - Fail** | Lecture avec ObjectId invalide | Résultat vide |
| **Read Product - Non Existing ID - Fail** | Lecture avec ObjectId inexistant | Résultat vide |
| **Update Product - Success** | Crée une tablette, met à jour le prix de 200 à 260 | Modified count > 0 |
| **Update Product - Invalid Price - Fail** | Mise à jour avec prix négatif | Modified count = 0 |
| **Update Product - Non Existing ID - Fail** | Mise à jour produit inexistant | Modified count = 0 |
| **Delete Product - Success** | Crée un téléphone puis le supprime | Deleted count = 1 |
| **Delete Product - Invalid ID - Fail** | Suppression avec ID invalide | Deleted count = 0 |
| **Delete Product - Non Existing ID - Fail** | Suppression produit inexistant | Deleted count = 0 |

### Tests Gestion Utilisateur (`testcases/TestOtherEntities.robot`)

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Create User - Success** | Crée un utilisateur avec email valide | ID utilisateur non vide |
| **Create User - Invalid Email** | Utilisateur avec email invalide | ID vide |
| **Create User - Missing Password** | Utilisateur sans mot de passe | ID vide |
| **Read User - Success** | Crée puis lit un utilisateur | L’utilisateur contient le champ email |
| **Read User - Not Found** | Lecture utilisateur inexistant | None retourné |
| **Read User - Invalid ID** | Lecture avec ObjectId invalide | None retourné |
| **Update User - Success** | Met à jour l’adresse utilisateur | Modified count > 0 |
| **Delete User - Success** | Crée puis supprime un utilisateur | Deleted count = 1 |

### Tests Gestion Commande (`testcases/TestOtherEntities.robot`)

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Create Order - Success** | Crée une commande avec références | Commande créée avec succès |
| **Create Order - Invalid Product ID** | Commande avec produit inexistant | Création gérée proprement |
| **Create Order - Empty Products List** | Commande avec liste produits vide | Création gérée correctement |
| **Read Order - Success** | Lecture commande existante | Commande avec champs requis |
| **Update Order - Success** | Met à jour la date de commande | Modified count > 0 |
| **Delete Order - Success** | Crée puis supprime une commande | Deleted count = 1 |

### Tests Gestion Catégorie (`testcases/TestOtherEntities.robot`)

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Create Category - Success** | Crée une catégorie avec nom et description | ID catégorie retourné |
| **Create Category - Duplicate Name** | Catégorie avec nom existant | ID vide (unicité) |
| **Create Category - Missing Name** | Catégorie sans nom | ID vide |
| **Read Category - Success** | Crée puis lit une catégorie | Catégorie avec champ nom |
| **Update Category - Success** | Met à jour la description | Modified count > 0 |
| **Delete Category - Success** | Crée puis supprime une catégorie | Deleted count = 1 |

## Exemples de données de test

### Données Produit

```robot
${price}=    Convert To Number    100
${product}=    Create Dictionary    title=Keyboard    price=${price}
${id}=    Create Product    ${db}    ${product}
Should Not Be Empty    ${id}
```

### Données Utilisateur

```robot
${user}=    Create Dictionary
...    email=john@gmail.com
...    username=johnd
...    password=hashedpassword
...    name=Create Dictionary firstname=John lastname=Doe
${id}=    Create User    ${db}    ${user}
Should Not Be Empty    ${id}
```

### Données Commande

```robot
${product1}=    Create Dictionary
...    productId=${product_id}
...    quantity=4
${products}=    Create List    ${product1}
${order}=    Create Dictionary
...    userId=${user_id}
...    date=2020-03-02T00:00:00.000Z
...    products=${products}
```

### Données Catégorie

```robot
${category}=    Create Dictionary
...    name="men's clothing"
...    description="Articles destinés aux hommes"
...    image="URL d'une image représentative"
${id}=    Create Category    ${db}    ${category}
```

## Rapports de test

Robot Framework génère des rapports complets après exécution :

- **`report.html`** : Résumé global de l’exécution
- **`log.html`** : Log détaillé étape par étape
- **`output.xml`** : Résultats pour intégration CI/CD

### Visualisation des rapports

```bash
# Ouvrir les rapports dans le navigateur
open report.html
open log.html

# Ou spécifier un dossier de sortie
robot --outputdir results testcases/
open results/report.html
```

## Opérations base de données

### Gestion de connexion

```python
def connect_to_mongodb(uri, db_name):
    """Connexion à MongoDB avec l’URI et le nom de base."""
    client = MongoClient(uri)
    db = client[db_name]
    return db
```

### Exemple opérations Produit

```python
def create_product(db, product):
    """Créer un nouveau produit dans la base."""
    required_fields = ['title', 'price']
    if not all(field in product for field in required_fields):
        return ''
    
    if not isinstance(product['price'], (int, float)) or product['price'] <= 0:
        return ''
    
    result = db.products.insert_one(product)
    return str(result.inserted_id)
```

### Exemple opérations Utilisateur

```python
def create_user(db, user):
    """Créer un nouvel utilisateur dans la base."""
    required_fields = ['email', 'username', 'password']
    if not all(field in user for field in required_fields):
        return ''
    
    if not isinstance(user['email'], str) or '@' not in user['email']:
        return ''
    
    result = db.users.insert_one(user)
    return str(result.inserted_id)
```

## Dépannage

### Problèmes courants et solutions

#### 1. Problèmes de connexion MongoDB

```text
ServerSelectionTimeoutError: connection timeout
```

**Solutions** :

- Vérifier les paramètres réseau MongoDB Atlas
- Vérifier la connexion internet
- Valider le format de la chaîne de connexion
- Vérifier les droits utilisateur

#### 2. Échecs d’authentification

```text
Authentication failed
```

**Solutions** :

- Vérifier l’identifiant et le mot de passe
- Vérifier les rôles et permissions utilisateur
- Encoder les caractères spéciaux du mot de passe
- Valider l’accessibilité de la base

#### 3. Erreurs de conversion ObjectId

```text
InvalidId: ObjectIds have invalid ObjectId
```

**Solutions** :

- Valider le format ObjectId
- Gérer les chaînes invalides proprement
- Utiliser try/except pour la conversion

#### 4. Erreurs d’import

```text
ModuleNotFoundError: No module named 'pymongo'
```

**Solutions** :

- Installer PyMongo : `pip install pymongo`
- Vérifier l’environnement Python et le PATH
- Vérifier l’activation de l’environnement virtuel

### Mode debug

```bash
# Exécution avec logs maximum
robot --loglevel TRACE --outputdir debug_results testcases/

# Logs des opérations base de données
robot --variable LOG_LEVEL:DEBUG testcases/

# Capturer les erreurs détaillées
robot --continue-on-failure --loglevel DEBUG testcases/
```

## Validation des données

### Validation multi-entités

La bibliothèque applique une validation complète sur toutes les entités :

```python
# Validation produit
required_fields = ['title', 'price']
if not all(field in product for field in required_fields):
    return ''

# Validation email utilisateur
if not isinstance(user['email'], str) or '@' not in user['email']:
    return ''

# Vérification unicité catégorie
existing = db.categories.find_one({"name": category['name']})
if existing:
    return ''
```

### Gestion ObjectId

```python
# Conversion ObjectId sécurisée
try:
    obj_id = ObjectId(product_id)
except:
    return ''  # Retourne chaîne vide pour gestion d’erreur cohérente
```

## Bonnes pratiques appliquées

### Tests base de données

- **Couverture multi-entités** : Tests CRUD complets sur Produits, Utilisateurs, Commandes, Catégories
- **Gestion connexion** : Connexion à la base gérée proprement
- **Validation des données** : Validation et gestion d’erreur complètes
- **Intégrité référentielle** : Gestion correcte des relations (Commandes → Utilisateurs → Produits)
- **Gestion des erreurs** : Gestion élégante des exceptions

### Conception des tests

- **Architecture modulaire** : Séparation logique opérations/tests
- **Composants réutilisables** : Mots-clés communs pour la base
- **Isolation des données** : Chaque test crée ses propres données
- **Couverture complète** : Scénarios positifs et négatifs
- **Vérification assertions** : Validation correcte des résultats

### Architecture du framework

- **Pattern Page Object** : Abstraction des opérations base dans des classes
- **Gestion configuration** : Configuration externe de la base
- **Récupération d’erreur** : Gestion robuste des exceptions et logs
- **Documentation multilingue** : Support documentation anglais/français

### Développement des opérations base

- Suivre les conventions de nommage Python
- Ajouter des docstrings complets (paramètres, retours)
- Implémenter la gestion d’erreur et la validation
- Retourner des types cohérents (chaîne vide pour échec, None si besoin)
- Ajouter des logs pour le debug

## Licence

Cette suite de tests fait partie des exercices de laboratoire QA et est destinée à un usage pédagogique.

## Technologies & Frameworks

- **Robot Framework** 6.1.1+
- **Python** 3.8+
- **PyMongo** 4.6.0+ pour MongoDB
- **MongoDB Atlas** base cloud
- **BSON** pour la gestion des documents MongoDB
