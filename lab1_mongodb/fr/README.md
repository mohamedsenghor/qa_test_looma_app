# Lab 1 MongoDB - Suite de Tests de Base de Données

## Auteurs

**Bassine DIALLO**  
**Mohamed SENGHOR**

## Vue d'ensemble

Il s'agit d'une suite de tests automatisés Robot Framework pour MongoDB. Le projet teste les opérations CRUD (Créer, Lire, Mettre à jour, Supprimer) sur une base MongoDB via le driver PyMongo, en appliquant le modèle Page Object pour les opérations de base de données.

## Structure du projet

```text
lab1_mongodb/
├── README.md                     # Cette documentation
├── __init__.py                   # Initialisation du package Python
├── fr/                          # Documentation en français
│   └── README.md                # Version française de la documentation
├── pageobjects/                 # Objets et utilitaires de base de données
│   ├── __init__.py              # Initialisation du package
│   ├── locators.py              # Définitions des champs de la base
│   ├── mongodb_lib.py           # Bibliothèque d'opérations MongoDB
│   ├── variables.py             # Configuration de la base
│   └── __pycache__/             # Fichiers cache Python
├── resources/                   # Ressources et mots-clés de tests
│   └── MongoDBKeywords.robot    # Mots-clés réutilisables
└── testcases/                   # Définition des cas de test
    └── TestProducts.robot       # Cas de test CRUD produits
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
- **Collection** : `products`
- **Accès réseau** : IP autorisée

## Configuration

### Configuration de la base (`pageobjects/variables.py`)

```python
BASE_URL = "https://fakestoreapi.com"
MONGO_URI = "mongodb+srv://username:password@cluster0.ifptzd7.mongodb.net/"
DB_NAME = "fakeStoreDB"
PRODUCTS_ENDPOINT = "/products"
```

### Paramètres de connexion (`testcases/TestProducts.robot`)

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

La bibliothèque principale fournit les opérations MongoDB :

#### Gestion de connexion

- **`connect_to_mongodb(uri, db_name)`** : Établit la connexion à la base
- Retourne l'objet base de données pour les opérations

#### Opérations CRUD

- **`create_product(db, product)`** : Crée un document produit
- **`read_product(db, product_id)`** : Récupère un produit par ObjectId
- **`update_product(db, product_id, update_fields)`** : Met à jour un produit
- **`delete_product(db, product_id)`** : Supprime un produit

#### Validation des données

- **Champs obligatoires** : Vérifie la présence de `title`, `price`
- **Validation du prix** : Doit être un nombre positif
- **Gestion ObjectId** : Conversion correcte en ObjectId MongoDB

### Mots-clés Robot (`resources/MongoDBKeywords.robot`)

Mots-clés Robot Framework de haut niveau :

#### Gestion de session

- **`Connect To Mongodb`** : Établit et stocke la connexion
- **`Set Suite Variable`** : Maintient la connexion entre les tests

#### Opérations produit

- **`Create Product`** : Crée un produit et retourne l'ID
- **`Read Product`** : Récupère un produit par ID
- **`Update Product`** : Met à jour les champs d'un produit
- **`Delete Product`** : Supprime un produit et retourne le nombre supprimé

## Exécution des tests

### 1. Préparation de l'environnement

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

# Lancer avec logs détaillés
robot --loglevel DEBUG testcases/

# Générer les rapports dans un dossier personnalisé
robot --outputdir results testcases/
```

### 3. Exemples d'exécution

```bash
# Exécution basique
robot testcases/TestProducts.robot

# Exécution détaillée avec logs
robot --loglevel DEBUG --outputdir results testcases/

# Lancer un cas de test précis
robot --test "Create Product - Success" testcases/TestProducts.robot

# Lancer avec variables personnalisées
robot --variable MONGO_URI:votre_chaine_connexion testcases/

# Continuer en cas d'échec
robot --continue-on-failure testcases/
```

## Cas de test

### Tests CRUD Produit (`testcases/TestProducts.robot`)

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Create Product - Success** | Crée un clavier à 100€ | ID produit retourné et non vide |
| **Read Product - Success** | Crée une souris puis la lit | Le produit contient le champ title |
| **Update Product - Success** | Crée une tablette, met à jour le prix de 200 à 260 | Nombre modifié > 0 |
| **Delete Product - Success** | Crée un téléphone puis le supprime | Nombre supprimé = 1 |

### Exemples de données de test

#### Test de création de produit

```robot
${price}=    Convert To Number    100
${product}=    Create Dictionary    title=Keyboard    price=${price}
${id}=    Create Product    ${db}    ${product}
Should Not Be Empty    ${id}
```

#### Test de mise à jour de produit

```robot
${new_price}=    Convert To Number    260
${update_fields}=    Create Dictionary    price=${new_price}
${count}=    Update Product    ${db}    ${id}    ${update_fields}
Should Be True    ${count} > 0
```

## Rapports de test

Robot Framework génère des rapports complets après exécution :

- **`report.html`** : Résumé de l'exécution des tests
- **`log.html`** : Log détaillé étape par étape avec opérations MongoDB
- **`output.xml`** : Résultats pour intégration CI/CD

### Visualiser les rapports

```bash
# Ouvrir les rapports dans le navigateur
open report.html
open log.html

# Ou avec un dossier de sortie personnalisé
robot --outputdir results testcases/
open results/report.html
```

## Opérations sur la base

### Gestion de connexion

```python
def connect_to_mongodb(uri, db_name):
    """Connexion à MongoDB avec l'URI et le nom de la base."""
    client = MongoClient(uri)
    db = client[db_name]
    return db
```

### Création de produit

```python
def create_product(db, product):
    """Créer un nouveau produit dans la base."""
    required_fields = ['title', 'price']
    if not all(field in product for field in required_fields):
        return None
    
    if not isinstance(product['price'], (int, float)) or product['price'] <= 0:
        return None
    
    result = db.products.insert_one(product)
    return str(result.inserted_id)
```

### Lecture de produit

```python
def read_product(db, product_id):
    """Lire un produit par son ID."""
    try:
        obj_id = ObjectId(product_id)
    except:
        return None
    
    return db.products.find_one({"_id": obj_id})
```

## Dépannage

### Problèmes courants et solutions

#### 1. Problèmes de connexion MongoDB

```text
ServerSelectionTimeoutError: connection timeout
```

**Solutions** :

- Vérifier les paramètres d'accès réseau MongoDB Atlas
- Vérifier la connexion Internet
- Valider le format de la chaîne de connexion
- Vérifier les permissions utilisateur

#### 2. Échecs d'authentification

```text
Authentication failed
```

**Solutions** :

- Vérifier l'identifiant et le mot de passe
- Vérifier les rôles et permissions utilisateur
- Encoder les caractères spéciaux du mot de passe
- Valider l'accès à la base

#### 3. Erreurs de conversion ObjectId

```text
InvalidId: ObjectIds have invalid ObjectId
```

**Solutions** :

- Vérifier le format ObjectId
- Gérer les chaînes d'ID invalides
- Utiliser try/except pour la conversion

#### 4. Erreurs d'import

```text
ModuleNotFoundError: No module named 'pymongo'
```

**Solutions** :

- Installer PyMongo : `pip install pymongo`
- Vérifier l'environnement Python et le PATH
- Vérifier l'activation de l'environnement virtuel

### Mode debug

```bash
# Exécution avec logs maximum
robot --loglevel TRACE --outputdir debug_results testcases/

# Exécution avec logs des opérations base
robot --variable LOG_LEVEL:DEBUG testcases/

# Capturer les erreurs détaillées
robot --continue-on-failure --loglevel DEBUG testcases/
```

## Validation des données

### Validation des champs

La bibliothèque implémente une validation complète :

```python
# Validation des champs obligatoires
required_fields = ['title', 'price']
if not all(field in product for field in required_fields):
    return None

# Validation du prix
if not isinstance(product['price'], (int, float)) or product['price'] <= 0:
    return None
```

### Gestion ObjectId

```python
# Conversion sécurisée ObjectId
try:
    obj_id = ObjectId(product_id)
except:
    return None  # ou gestion d'erreur appropriée
```

## Bonnes pratiques appliquées

### Tests base de données

- **Gestion de connexion** : Connexion et gestion appropriée
- **Validation des données** : Validation et gestion d'erreurs complètes
- **Opérations CRUD** : Couverture complète des opérations
- **Gestion des erreurs** : Gestion robuste des exceptions

### Conception des tests

- **Architecture modulaire** : Séparation logique des opérations base et tests
- **Composants réutilisables** : Mots-clés communs pour la réutilisation
- **Isolation des données** : Chaque test crée ses propres données
- **Vérification des assertions** : Validation correcte des résultats

### Architecture du framework

- **Pattern Page Object** : Abstraction des opérations dans des classes
- **Gestion de configuration** : Configuration externe de la base
- **Récupération d'erreur** : Gestion robuste des exceptions et logs
- **Documentation** : Documentation complète et exemples

## Contribution

### Ajouter de nouveaux tests base de données

1. Définir de nouvelles opérations dans [`pageobjects/mongodb_lib.py`](pageobjects/mongodb_lib.py)
2. Ajouter les mots-clés dans [`resources/MongoDBKeywords.robot`](resources/MongoDBKeywords.robot)
3. Créer les cas de test dans [`testcases/TestProducts.robot`](testcases/TestProducts.robot)
4. Mettre à jour la configuration dans [`pageobjects/variables.py`](pageobjects/variables.py)
5. Mettre à jour ce README avec la nouvelle documentation

### Développement des opérations base

- Suivre les conventions de nommage Python
- Ajouter des docstrings complets avec paramètres et retours
- Implémenter la gestion d'erreur et la validation
- Ajouter des logs pour le debug et le suivi

