# Lab 2 UI - Suite de Tests d'Application Web

## Vue d'ensemble

Il s'agit d'une suite de tests Robot Framework complète pour les tests d'interface utilisateur d'applications web utilisant Selenium WebDriver. Le projet met en œuvre des tests automatisés pour une application web avec un accent sur la fonctionnalité de connexion, la gestion des clients et la vérification de la page d'accueil, en utilisant le modèle Page Object Model.

## Structure du projet

```text
lab2_ui/
├── README.md                     # Cette documentation
├── log.html                      # Journal d'exécution des tests (généré)
├── output.xml                    # Résultats des tests XML (généré)
├── report.html                   # Rapport d'exécution des tests (généré)
├── pageobject/                   # Implémentation du Page Object Model
│   ├── locators.py              # Sélecteurs d'éléments UI
│   ├── test_data.py             # Données de test et constantes
│   ├── variables.py             # Variables de configuration
│   └── __pycache__/             # Fichiers cache Python
├── resources/                    # Ressources de test
│   └── testCas.robot            # Mots-clés et ressources communs
├── results/                     # Artéfacts d'exécution des tests
│   ├── log.html                 # Journal d'exécution détaillé
│   ├── output.xml               # Résultats lisibles par machine
│   ├── report.html              # Rapport récapitulatif
│   └── selenium-screenshot-*.png # Captures d'écran des tests
└── testcases/                   # Définitions des cas de test
    ├── add_customer_test.robot  # Cas de test d'ajout de client
    ├── login_test.robot         # Cas de test d'authentification
    └── testCas.robot            # Tests de vérification de la page d'accueil
```

## Prérequis

### Prérequis logiciels

- **Python 3.8+** avec pip
- **Robot Framework 6.1.1+**
- **Selenium WebDriver**
- **Navigateur Web** (Chrome, Firefox, etc.)
- **Driver de navigateur** (ChromeDriver, GeckoDriver, etc.)

### Dépendances Python

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
pip install selenium
```

### Installation du driver navigateur

```bash
# Pour Chrome (avec webdriver-manager)
pip install webdriver-manager

# Ou téléchargez ChromeDriver manuellement et ajoutez-le au PATH
# https://chromedriver.chromium.org/
```

## Configuration

### Structure Page Object Model

La suite de tests implémente le modèle Page Object Model avec les composants suivants :

#### Sélecteurs (`pageobject/locators.py`)

Contient tous les sélecteurs d'éléments UI organisés par page :

```python
# Sélecteurs de la page de connexion
LOGIN_USERNAME = "id=email-id"
LOGIN_PASSWORD = "id=password"
LOGIN_BUTTON = "id=SignIn"

# Sélecteurs de la page client
CUSTOMER_NAME_INPUT = "id=customer-name"
CUSTOMER_EMAIL_INPUT = "id=customer-email"
ADD_CUSTOMER_BUTTON = "id=add-customer"

# Éléments de navigation
HOME_LINK = "xpath=//a[contains(text(),'Home')]"
LOGOUT_BUTTON = "id=logout"
```

#### Données de test (`pageobject/test_data.py`)

Définit les données de test et constantes :

```python
# Identifiants utilisateur
VALID_USERNAME = "test@example.com"
VALID_PASSWORD = "password123"

# Données client
CUSTOMER_NAME = "John Doe"
CUSTOMER_EMAIL = "john.doe@example.com"

# Constantes de test
DEFAULT_TIMEOUT = 10
```

#### Variables (`pageobject/variables.py`)

Contient les variables de configuration et paramètres :

```python
# Configuration du navigateur
BROWSER = "Chrome"
HEADLESS = False
IMPLICIT_WAIT = 10

# URLs de l'application
BASE_URL = "https://example-app.com"
LOGIN_URL = "${BASE_URL}/login"
```

## Cas de test

### Tests de connexion (`testcases/login_test.robot`)

| Cas de test | Description | Tags | Résultat attendu |
|-------------|-------------|------|------------------|
| **Test Login** | Teste la connexion réussie avec des identifiants valides | `login`, `smoke` | L'utilisateur est connecté avec succès |

**Couverture des tests :**

- Authentification avec identifiants valides
- Vérification des éléments de la page de connexion
- Validation de la navigation après connexion

### Tests client (`testcases/add_customer_test.robot`)

| Cas de test | Description | Tags | Résultat attendu |
|-------------|-------------|------|------------------|
| **Test Add Customer** | Teste la fonctionnalité de création de client | `customer`, `smoke` | Client ajouté avec succès |

**Couverture des tests :**

- Validation des champs du formulaire client
- Soumission des données client
- Vérification du message de succès
- Confirmation de la mise à jour de la liste des clients

### Tests page d'accueil (`testcases/testCas.robot`)

| Cas de test | Description | Tags | Résultat attendu |
|-------------|-------------|------|------------------|
| **Vérification de la page d'accueil** | Vérifie les éléments et la fonctionnalité de la page d'accueil | `home`, `smoke` | La page d'accueil s'affiche correctement |

**Couverture des tests :**

- Présence des éléments de la page d'accueil
- Fonctionnalité du menu de navigation
- Vérification du contenu de la page

## Exécution des tests

### Exécution basique

```bash
# Aller dans le répertoire du projet
cd /Users/mac/qa_test_looma_app/lab2_ui

# Exécuter tous les tests
robot testcases/

# Exécuter une suite de test spécifique
robot testcases/login_test.robot
robot testcases/add_customer_test.robot
robot testcases/testCas.robot
```

### Options avancées d'exécution

```bash
# Exécuter les tests avec des tags spécifiques
robot --include smoke testcases/
robot --include login testcases/
robot --include customer testcases/

# Exécuter les tests avec un navigateur personnalisé
robot --variable BROWSER:Firefox testcases/

# Exécuter les tests en mode headless
robot --variable HEADLESS:True testcases/

# Générer les rapports dans un répertoire personnalisé
robot --outputdir results testcases/

# Exécuter avec un niveau de log spécifique
robot --loglevel DEBUG testcases/

# Exécuter les tests avec un timeout personnalisé
robot --variable DEFAULT_TIMEOUT:15 testcases/
```

### Exécution parallèle

```bash
# Exécuter les tests en parallèle (nécessite pabot)
pip install robotframework-pabot
pabot --processes 2 testcases/
```

## Rapports de test

La suite de tests génère des rapports complets après exécution :

### Fichiers générés

- **[`report.html`](report.html)** : Résumé exécutif avec statistiques de réussite/échec
- **[`log.html`](log.html)** : Journal détaillé pas à pas avec captures d'écran
- **[`output.xml`](output.xml)** : Résultats de test lisibles par machine pour intégration CI/CD

### Statistiques de test

Basé sur l'exécution actuelle :

- **Nombre total de tests** : 3
- **Réussis** : 3 (100%)
- **Échoués** : 0 (0%)
- **Ignorés** : 0 (0%)
- **Temps total d'exécution** : 00:00:06

### Détail par suite de test

- **Test ajout client** : 1 test, 0:00:18 écoulé
- **Test connexion** : 1 test, 0:00:05 écoulé  
- **Test page d'accueil** : 1 test, 0:00:01 écoulé

### Statistiques par tag

- **customer** : 1 test (0:00:05)
- **home** : 1 test (0:00:00)
- **login** : 1 test (0:00:01)
- **smoke** : 3 tests (0:00:06)

## Mots-clés communs (`resources/testCas.robot`)

La suite de tests inclut des mots-clés réutilisables pour les opérations courantes :

### Gestion du navigateur

- **Open Browser To Login Page** : Ouvre le navigateur et va à la page de connexion
- **Close Browser** : Ferme correctement la session du navigateur

### Interactions avec les éléments

- **Wait Until Element Is Visible** : Attente robuste de la visibilité d'un élément
- **Click Element With Wait** : Clic sécurisé avec vérification de visibilité
- **Input Text With Wait** : Saisie de texte sécurisée avec validation

### Mots-clés de vérification

- **Verify Page Contains Text** : Validation de la présence d'un texte
- **Verify Element Attribute** : Vérification d'attribut d'élément
- **Take Screenshot On Failure** : Capture automatique d'écran en cas d'échec

## Dépannage

### Problèmes courants et solutions

#### 1. Problèmes de driver navigateur

```text
WebDriverException: 'chromedriver' executable needs to be in PATH
```

**Solutions** :

- Installer webdriver-manager : `pip install webdriver-manager`
- Télécharger ChromeDriver manuellement et l'ajouter au PATH système
- Utiliser WebDriverManager dans votre configuration de test

#### 2. Élément non trouvé

```text
ElementNotVisibleException: Element is not currently visible
```

**Solutions** :

- Augmenter le temps d'attente implicite dans les variables
- Utiliser des attentes explicites pour les éléments dynamiques
- Vérifier les sélecteurs avec les outils développeur du navigateur
- Vérifier le chargement complet de la page

#### 3. Problèmes de lancement du navigateur

```text
WebDriverException: unknown error: Chrome failed to start
```

**Solutions** :

- Vérifier que le navigateur Chrome est installé
- Essayer d'exécuter en mode headless
- Vérifier la compatibilité des versions Chrome/ChromeDriver
- Vérifier les permissions système

#### 4. Problèmes de données de test

```text
Variable '${VALID_USERNAME}' not found
```

**Solutions** :

- Vérifier que test_data.py contient les variables requises
- Vérifier les imports dans les fichiers robot
- S'assurer de la bonne configuration du chemin Python

### Mode debug

```bash
# Exécuter avec un niveau de log maximal
robot --loglevel TRACE --outputdir debug_results testcases/

# Exécuter un test unique avec les infos de debug
robot --loglevel DEBUG --test "Test Login" testcases/login_test.robot

# Capturer les captures d'écran en cas d'échec
robot --variable CAPTURE_SCREENSHOTS:True testcases/
```

## Bonnes pratiques mises en œuvre

### Conception des tests

- **Page Object Model** : Séparation claire de la logique de test et des éléments UI
- **Tests pilotés par les données** : Gestion externe des données de test
- **Mots-clés modulaires** : Composants de test réutilisables
- **Structure claire des tests** : Cas de test lisibles et maintenables

### Framework d'automatisation

- **Attentes explicites** : Synchronisation robuste des éléments
- **Capture d'écran** : Débogage visuel en cas d'échec
- **Journalisation complète** : Suivi détaillé de l'exécution
- **Support multi-navigateurs** : Compatibilité multi-navigateurs

### Maintenance

- **Sélecteurs centralisés** : Gestion facilitée des changements UI
- **Gestion de la configuration** : Paramètres spécifiques à l'environnement
- **Contrôle de version** : Structure de dépôt propre
- **Documentation** : Guides de configuration et d'utilisation complets

## Contribution

### Ajouter de nouveaux tests

1. Créez les cas de test dans les fichiers `.robot` appropriés sous `testcases/`
2. Ajoutez les nouveaux sélecteurs à `pageobject/locators.py`
3. Mettez à jour les données de test dans `pageobject/test_data.py` si nécessaire
4. Ajoutez les mots-clés réutilisables dans `resources/testCas.robot`
5. Mettez à jour ce README avec la documentation des nouveaux tests

### Maintenance des sélecteurs

- Utilisez les outils développeur du navigateur pour vérifier les sélecteurs
- Préférez les sélecteurs stables (id, name) aux sélecteurs fragiles (xpath avec indices)
- Groupez les sélecteurs par page/fonctionnalité dans locators.py
- Documentez toute stratégie de sélecteur complexe

### Gestion des données de test

- Gardez les données sensibles dans des variables d'environnement
- Utilisez des données de test significatives reflétant des scénarios réels
- Organisez les données de test par fonctionnalité
- Prévoyez un nettoyage des données après exécution des tests

## Support

Pour toute question ou problème :

1. Consultez la section dépannage ci-dessus
2. Lisez la documentation de Robot Framework SeleniumLibrary
3. Vérifiez la compatibilité navigateur/driver
4. Consultez les journaux d'exécution pour plus de détails

## Licence

Cette suite de tests fait partie des exercices de laboratoire de test QA et est destinée à un usage éducatif.
