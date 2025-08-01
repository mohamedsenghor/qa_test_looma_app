# Lab 2 UI - Suite de Tests CRM Application Web

## Auteurs

**Bassine DIALLO**  
**Mohamed SENGHOR**

## Vue d'ensemble

Il s'agit d'une suite de tests automatisés Robot Framework pour l'interface web d'une application de gestion de la relation client (CRM). Le projet cible les tests d'authentification utilisateur, la gestion des clients et la vérification de la page d'accueil, en utilisant Selenium WebDriver et le modèle Page Object.

## Structure du projet

```text
lab2_ui/
├── README.md                     # Cette documentation
├── fr/                          # Documentation en français
│   └── README.md                # Version française de la documentation
├── pageobject/                  # Implémentation du modèle Page Object
│   ├── locators.py              # Localisateurs d'éléments UI (vide - intégrés dans les fichiers de test)
│   ├── test_data.py             # Données de test (vide - utilise variables.py)
│   ├── variables.py             # Variables de configuration et données de test
│   └── __pycache__/             # Fichiers cache Python
├── resources/                   # Ressources et mots-clés de test
│   └── testCas.robot            # Mots-clés et utilitaires communs
└── testcases/                   # Définition des cas de test
    ├── add_customer_test.robot  # Cas de test d'ajout de client
    ├── login_test.robot         # Cas de test d'authentification
    └── testCas.robot            # Tests de vérification de la page d'accueil
```

## Prérequis

### Logiciels requis

- **Python 3.8+** avec pip
- **Robot Framework 6.1.1+**
- **Selenium WebDriver**
- **Navigateur Chrome** (navigateur principal de test)
- **ChromeDriver** (géré automatiquement par Selenium)

### Dépendances Python

#### requirements.txt

```text
robotframework==6.1.1
robotframework-seleniumlibrary==6.2.0
selenium==4.15.0
```

```bash
pip install -r requirements.txt
```

### Configuration du navigateur

La suite de tests utilise Chrome par défaut. Assurez-vous que Chrome est installé et accessible.

## Configuration

### Configuration de l'application (`pageobject/variables.py`)

```python
# URL de l'application
URL = "https://automationplayground.com/crm/"
BROWSER = "chrome"

# Identifiants d'authentification
USERNAME_AUTOMATION = "admin@robotframeworktutorial.com"
PASSWORD_AUTOMATION = "pwd"

# Données de test client
TEST_CUSTOMER_EMAIL = "bassinediallo@gmail.com"
TEST_CUSTOMER_FIRST_NAME = "Bassine"
TEST_CUSTOMER_LAST_NAME = "Diallo"
TEST_CUSTOMER_CITY = "New York"
TEST_CUSTOMER_STATE = "NY"
TEST_CUSTOMER_GENDER = "Female"
TEST_CUSTOMER_PROMOTION = "Yes"
```

### Mots-clés communs (`resources/testCas.robot`)

Fournit des mots-clés réutilisables pour la gestion du navigateur et les interactions avec la page :

```robot
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
```

## Composants de test

### Mots-clés communs (`resources/testCas.robot`)

La suite de tests propose des mots-clés réutilisables pour interagir avec l'application web :

#### Gestion du navigateur

- **`Ouvrir le navigateur`** : Ouvre Chrome et navigue vers l'URL de l'application
- **`Fermer le navigateur`** : Ferme correctement la session du navigateur
- **Configuration du navigateur** : Maximisation de la fenêtre et délai initial

#### Navigation

- **`Aller à l'adresse de la page d'accueil`** : Navigation vers la page d'accueil avec validation
- **`Vérifier le contenu de la page d'accueil`** : Vérifie la présence des éléments de la page d'accueil

#### Interactions avec les éléments

- Utilise des attentes explicites pour la visibilité des éléments
- Implémente des sélecteurs XPath et CSS pour localiser les éléments
- Fournit la saisie et la validation des formulaires

## Exécution des tests

### 1. Préparation de l'environnement

```bash
# Aller dans le dossier du projet
cd /Users/mac/qa_test_looma_app/lab2_ui

# Installer les dépendances Python
pip install -r requirements.txt

# Vérifier l'installation de Selenium
python -c "from selenium import webdriver; print('Selenium installé avec succès')"
```

### 2. Exécuter les suites de tests

```bash
# Exécuter tous les tests
robot testcases/

# Exécuter un fichier de test spécifique
robot testcases/login_test.robot
robot testcases/add_customer_test.robot
robot testcases/testCas.robot

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
robot --test "Test Login" testcases/login_test.robot

# Exécuter les tests avec des tags
robot --include smoke testcases/
robot --include customer testcases/

# Exécuter avec un navigateur personnalisé (si configuré)
robot --variable BROWSER:firefox testcases/
```

## Cas de test

### Tests de la page d'accueil (`testcases/testCas.robot`)

| Cas de test | Description | Tags | Résultat attendu |
|-------------|-------------|------|------------------|
| **Vérification de la page d'accueil** | Vérifie les éléments et le contenu de la page d'accueil | `smoke`, `home` | La page d'accueil s'affiche correctement avec le contenu attendu |

**Couverture :**

- Accessibilité de la page d'accueil
- Présence des éléments principaux
- Validation du titre et de l'en-tête

### Tests d'authentification (`testcases/login_test.robot`)

| Cas de test | Description | Tags | Résultat attendu |
|-------------|-------------|------|------------------|
| **Test Login** | Teste la connexion avec des identifiants valides | `smoke`, `login` | L'utilisateur est authentifié et redirigé avec succès |

**Couverture :**

- Accessibilité du formulaire de connexion
- Authentification avec identifiants valides
- Navigation post-connexion

**Étapes :**

1. Cliquer sur le bouton Sign In
2. Attendre le chargement de la page de connexion
3. Saisir l'identifiant et le mot de passe valides
4. Soumettre le formulaire

### Tests de gestion client (`testcases/add_customer_test.robot`)

| Cas de test | Description | Tags | Résultat attendu |
|-------------|-------------|------|------------------|
| **Test Add Customer** | Teste le workflow complet de création de client | `smoke`, `customer` | Client ajouté avec succès et message de confirmation |

**Couverture :**

- Processus de création de client de bout en bout
- Validation et saisie des champs du formulaire
- Confirmation du message de succès

**Étapes :**

1. **Authentification** : Connexion avec des identifiants valides
2. **Navigation** : Cliquer sur "New Customer"
3. **Remplissage du formulaire** : Saisir les informations du client
   - Adresse email
   - Prénom et nom
   - Ville et région
   - Genre
4. **Soumission** : Envoyer le formulaire
5. **Vérification** : Confirmer le message de succès

## Localisateurs d'éléments

La suite de tests utilise différentes stratégies de localisation :

### Éléments d'authentification

```robot
Click Element    //*[@id="SignIn"]              # Bouton de connexion
Input Text       //input[@id='email-id']       # Champ identifiant
Input Text       //input[@id='password']       # Champ mot de passe
Click Element    //*[@id="submit-id"]          # Bouton valider
```

### Éléments du formulaire client

```robot
Click Element    id=new-customer               # Bouton nouveau client
Input Text       id=EmailAddress               # Champ email
Input Text       id=FirstName                  # Champ prénom
Input Text       id=LastName                   # Champ nom
Input Text       id=City                       # Champ ville
Select From List By Value    id=StateOrRegion  # Liste déroulante région
Click Element    xpath=//input[@name='gender'][@value='male']  # Radio genre
Click Button     css=button.btn.btn-primary    # Bouton soumettre
```

## Rapports de test

Robot Framework génère des rapports complets après exécution :

- **`report.html`** : Résumé de l'exécution avec statistiques
- **`log.html`** : Journal détaillé étape par étape avec captures d'écran
- **`output.xml`** : Résultats lisibles par machine pour CI/CD

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

#### 1. Problèmes de driver navigateur

```text
WebDriverException: 'chromedriver' executable needs to be in PATH
```

**Solutions :**

- Selenium 4.x gère automatiquement ChromeDriver
- Vérifiez que Chrome est installé et à jour
- Pour une gestion manuelle, téléchargez ChromeDriver et ajoutez-le au PATH

#### 2. Élément introuvable

```text
ElementNotVisibleException: Element is not currently visible
```

**Solutions :**

- Augmentez les délais d'attente dans les mots-clés
- Utilisez des attentes explicites : `Wait Until Element Is Visible`
- Vérifiez les localisateurs avec les outils développeur du navigateur
- Contrôlez le chargement dynamique du contenu

#### 3. Problèmes de connexion

```text
Page should have contained text 'expected_text' but did not
```

**Solutions :**

- Vérifiez l'accessibilité de l'URL de l'application
- Contrôlez les identifiants dans [`pageobject/variables.py`](pageobject/variables.py)
- Assurez-vous que l'application est disponible et réactive
- Vérifiez la connectivité réseau

#### 4. Problèmes de soumission de formulaire

```text
Element with locator 'id=new-customer' not found
```

**Solutions :**

- Vérifiez la connexion avant les opérations client
- Ajoutez des attentes explicites après la connexion : `Wait Until Element Is Visible`
- Vérifiez les droits utilisateur pour la création de client
- Contrôlez les éventuels changements de l'UI

### Mode débogage

```bash
# Exécuter avec logs maximum
robot --loglevel TRACE --outputdir debug_results testcases/

# Exécuter un test avec infos de debug
robot --loglevel DEBUG --test "Test Add Customer" testcases/add_customer_test.robot

# Capturer des captures d'écran en cas d'échec
robot --variable CAPTURE_SCREENSHOTS:True testcases/
```

## Gestion des données de test

### Données de test client

La suite utilise des données prédéfinies dans [`pageobject/variables.py`](pageobject/variables.py) :

```python
TEST_CUSTOMER_EMAIL = "bassinediallo@gmail.com"
TEST_CUSTOMER_FIRST_NAME = "Bassine"
TEST_CUSTOMER_LAST_NAME = "Diallo"
TEST_CUSTOMER_CITY = "New York"
TEST_CUSTOMER_STATE = "NY"
TEST_CUSTOMER_GENDER = "Female"
TEST_CUSTOMER_PROMOTION = "Yes"
```

### Identifiants d'authentification

```python
USERNAME_AUTOMATION = "admin@robotframeworktutorial.com"
PASSWORD_AUTOMATION = "pwd"
```

**Remarque :** Ce sont des identifiants de test pour l'environnement d'automatisation.

## Bonnes pratiques appliquées

### Conception des tests

- **Modèle Page Object** : séparation des données et localisateurs
- **Mots-clés réutilisables** : opérations navigateur centralisées
- **Attentes explicites** : synchronisation robuste
- **Organisation par tags** : catégorisation smoke et fonctionnelle

### Framework d'automatisation

- **Gestion du navigateur** : procédures d'initialisation et de fermeture correctes
- **Gestion des erreurs** : gestion élégante des échecs de localisation
- **Captures d'écran** : débogage visuel automatique en cas d'échec
- **Logs détaillés** : suivi complet de l'exécution

### Maintenance

- **Configuration centralisée** : variables dans un seul fichier
- **Structure modulaire** : séparation claire entre ressources et cas de test
- **Localisation française** : documentation multilingue
- **Contrôle de version** : `.gitignore` adapté pour les fichiers générés

## Contribuer

### Ajouter de nouveaux cas de test

1. Créez les cas de test dans les fichiers `.robot` sous [`testcases/`](testcases/)
2. Ajoutez les nouvelles données dans [`pageobject/variables.py`](pageobject/variables.py)
3. Mettez à jour les mots-clés communs dans [`resources/testCas.robot`](resources/testCas.robot) si besoin
4. Ajoutez les localisateurs dans les fichiers de test ou centralisez-les
5. Mettez à jour ce README avec la documentation des nouveaux tests

### Gestion des localisateurs

- Privilégiez les localisateurs stables (id, name)
- Préférez les sélecteurs CSS aux XPath complexes
- Documentez les stratégies de localisation complexes
- Testez les localisateurs sur différents navigateurs

### Bonnes pratiques pour les données de test

- Utilisez des données représentatives de cas réels
- Prévoyez le nettoyage des données après les tests
- Implémentez des tests pilotés par les données pour plusieurs scénarios
- Placez les données sensibles dans des variables d'environnement

## Licence

Cette suite de tests fait partie des exercices de laboratoire QA et est destinée à un usage pédagogique.

## Technologies & Frameworks

- **Robot Framework** 6.1.1+
- **Python** 3.8+
- **Selenium WebDriver** 4.15.0+ pour l'automatisation web
- **SeleniumLibrary** 6.2.0+ pour l'intégration Robot Framework
- **Navigateur Chrome** avec gestion automatique du driver
