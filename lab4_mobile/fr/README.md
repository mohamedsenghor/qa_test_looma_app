# Lab 4 Mobile - Suite de Tests Looma App

## Auteurs

Bassine DIALLO  
Mohamed SENGHOR

## Vue d’ensemble

Il s’agit d’une suite de tests automatisés Robot Framework pour l’application Android Looma utilisant Appium. Le projet cible les fonctionnalités principales : authentification utilisateur et gestion des produits.

## Structure du projet

```text
lab4_mobile/
├── README.md                     # Cette documentation
├── .env                          # Configuration d’environnement
├── app-looma.apk                 # Application Android à tester
├── resources/                    # Ressources et utilitaires de test
│   ├── common_keywords.robot     # Mots-clés de test réutilisables
│   ├── locators.py               # Localisateurs UI (XPath)
│   └── variables.py              # Variables et configuration de test
└── tests/                        # Cas de test
   ├── login_tests.robot         # Cas de test d’authentification
   └── product_tests.robot       # Cas de test gestion des produits
```

## 🔧 Prérequis

### Logiciels requis

- **Python 3.8+** avec pip
- **Node.js 14+** pour Appium
- **Java JDK 8+** pour outils Android
- **Android SDK** avec platform tools
- **Émulateur Android** ou appareil physique
- [**APK Looma**](https://drive.google.com/drive/folders/1SDDdiFu1mIvJXaJagv0QOs4eNCFfyaqU?usp=sharing) à tester

### Dépendances Python

#### requirements.txt

```text
robotframework==6.1.1
robotframework-seleniumlibrary==6.1.1
robotframework-mongodblibrary==0.3.4
robotframework-requests==0.9.0
robotframework-appiumlibrary==2.0.0
Appium-Python-Client==2.11.1
pymongo==4.6.1
requests==2.31.0
```

```bash
pip install -r requirements.txt
```

### Installation d’Appium

```bash
# Installer Appium globalement
npm install -g appium

# Installer le driver UiAutomator2
appium driver install uiautomator2

# Installer le driver Appium Flutter
appium driver install --source=npm appium-flutter-driver

# Installer le plugin Appium Inspector
appium plugin install --source=npm appium-inspector-plugin

# Vérifier l’installation
appium doctor --android
```

## Configuration

### Variables d’environnement

Le fichier `.env` contient la configuration de l’environnement de test, notamment les identifiants sensibles :

```env
# Configuration Appium
PLATFORM_NAME = "Android"
PLATFORM_VERSION = "16"
DEVICE_NAME = "Medium Phone API 36"
AUTOMATION_NAME = "UiAutomator2"
APP_PACKAGE = "sn.sonatel.dsi.moussa.wade.moussawade"
APP_ACTIVITY = ".MainActivity"
APK_PATH = "/Users/mac/qa_test_looma_app/lab4_mobile/app-looma.apk"
NO_RESET = False
APPIUM_SERVER_URL = "http://localhost:4723"

# Identifiants de test
VALID_USERNAME = "johnd"
VALID_PASSWORD = "m38rmF$"
INVALID_USERNAME = "invalid_user_for_testing_purposes"
INVALID_PASSWORD = "wrong_pass_for_testing_purposes"
```

**REMARQUE** : Vérifiez la variable APK_PATH, elle doit pointer vers le bon emplacement de votre apk. Il est recommandé d’adapter les informations de l’appareil.

### Configuration de l’appareil

1. **Émulateur Android** :
   - Créez un AVD avec API level 36
   - Nom de l’appareil : "Medium Phone API 36"
   - Lancez l’émulateur avant les tests

2. **Appareil physique** :
   - Activez les options développeur et le débogage USB
   - Connectez via USB ou WiFi ADB
   - Mettez à jour `DEVICE_NAME` dans `.env` si besoin

## Composants de test

### Mots-clés communs (`resources/common_keywords.robot`)

#### Gestion de l’application

- **`Open My Application`** : Initialise la session Appium avec les capacités configurées
- **`Open And Login To Application`** : Configuration complète de l’application avec authentification
- **`Close My Application`** : Ferme proprement la session Appium

#### Interactions avec les éléments

- **`Wait And Click`** : Clique sécurisé avec attente de visibilité
- **`Wait And Input Text`** : Saisie sécurisée avec attente
- **`Fill Input By XPath`** : Saisie complète (attente, clic, saisie)
- **`Verify Element Text`** : Validation du contenu textuel

#### Authentification

- **`Login`** : Effectue la connexion avec identifiants
- **`Verify Login Error Modal`** : Valide les messages d’erreur d’authentification
- **`Verify Product Creation Page Displayed`** : Confirme la réussite de la connexion

#### Gestion des produits

- **`Fill Product Details`** : Remplit le formulaire de création de produit
- **`Verify Required Field Message`** : Valide les champs obligatoires

### Localisateurs UI (`resources/locators.py`)

Localisateurs XPath organisés par écran :

#### Page de connexion

```python
LOGIN_TITLE = "//android.view.View[@content-desc=\"Connexion\"]"
USERNAME_INPUT = "//android.widget.FrameLayout[...]/android.widget.EditText[1]"
PASSWORD_INPUT = "//android.widget.FrameLayout[...]/android.widget.EditText[2]"
LOGIN_BUTTON = "//android.widget.Button[@content-desc=\"Se connecter\"]"
```

#### Modales d’erreur

```python
ERROR_MODAL_TITLE = '//android.view.View[@content-desc="Erreur de connexion"]'
ERROR_MODAL_MESSAGE = "//android.view.View[@content-desc=\"Vérifiez vos identifiants.\"]"
ERROR_MODAL_OK_BUTTON = "//android.widget.Button[@content-desc=\"OK\"]"
```

#### Création de produit

```python
PRODUCT_CREATION_TITLE = '//android.view.View[@content-desc="Ajouter un produit"]'
PRODUCT_TITLE_INPUT = '//android.widget.FrameLayout[...]/android.widget.EditText[1]'
PRODUCT_PRICE_INPUT = '//android.widget.FrameLayout[...]/android.widget.EditText[2]'
# ... autres champs du formulaire produit
```

### Variables (`resources/variables.py`)

Charge la configuration d’environnement et définit les données de test :

```python
# Configuration basée sur l’environnement
APPIUM_SERVER_URL = os.getenv("APPIUM_SERVER_URL")
PLATFORM_NAME = os.getenv("PLATFORM_NAME", "Android")
VALID_USERNAME = os.getenv("VALID_USERNAME")
VALID_PASSWORD = os.getenv("VALID_PASSWORD")

# Données de test
PRODUCT_TITLE = "DANVOUY Womens T Shirt Casual Cotton Short"
PRODUCT_PRICE = 12.99
PRODUCT_DESCRIPTION = "95%Cotton,5%Spandex, Features: Casual..."
PRODUCT_CATEGORY = "women's clothing"
PRODUCT_IMAGE_URL = "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg"
```

## Exécution des tests

### 1. Préparation de l’environnement

```bash
# Démarrer le serveur Appium
appium --port 4723

# Démarrer l’émulateur Android (si utilisé)
emulator -avd "Medium Phone API 36"

# Vérifier la connexion de l’appareil
adb devices
```

### 2. Lancer les suites de tests

```bash
# Exécuter tous les tests
robot tests/

# Exécuter une suite spécifique
robot tests/login_tests.robot
robot tests/product_tests.robot

# Exécuter avec des tags spécifiques
robot --include ProductCreation tests/
robot --include Validation tests/

# Exécuter avec un dossier de sortie personnalisé
robot --outputdir results tests/

# Exécuter avec une variable personnalisée
robot --variable DEVICE_NAME:"Votre_Nom_Appareil" tests/
```

### 3. Exemples d’exécution

```bash
# Exécution basique
cd /Users/mac/qa_test_looma_app/lab4_mobile
robot tests/

# Exécution détaillée avec logs
robot --loglevel DEBUG --outputdir results tests/

# Exécuter un cas de test spécifique
robot --test "Should Login With Valid Credentials" tests/login_tests.robot

# Exécution parallèle (plusieurs appareils)
robot --variable DEVICE_NAME:emulator-5554 tests/ &
robot --variable DEVICE_NAME:emulator-5556 tests/ &
```

## Cas de test

### Tests de connexion (`tests/login_tests.robot`)

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Should Display Login Page Correctly** | Vérifie les éléments UI de la page de connexion | Éléments du formulaire visibles |
| **Should Not Login With Invalid Credentials** | Teste l’authentification avec mauvais identifiants | Modale d’erreur affichée |
| **Should Login With Valid Credentials** | Teste le flux de connexion réussi | Page de création de produit affichée |

### Tests produits (`tests/product_tests.robot`)

| Cas de test | Description | Résultat attendu |
|-------------|-------------|------------------|
| **Should Be Able To Add A Product With All Details** | Création complète d’un produit | Produit ajouté à la liste |
| **Should Not Add Product With Missing Title** | Validation du champ titre obligatoire | Message d’erreur affiché |
| **Should Not Add Product With Missing Price** | Validation du champ prix obligatoire | Message d’erreur affiché |

## Rapports de test

Robot Framework génère des rapports complets après exécution :

- **`report.html`** : Résumé de l’exécution
- **`log.html`** : Log détaillé avec captures d’écran
- **`output.xml`** : Résultats pour intégration CI/CD

### Visualisation des rapports

```bash
# Ouvrir les rapports dans le navigateur
open report.html
open log.html

# Ou spécifier un dossier de sortie personnalisé
robot --outputdir results tests/
open results/report.html
```

## Dépannage

### Problèmes courants et solutions

#### 1. Erreur variable non trouvée

```text
Variable '${VALID_PASSWORD}' not found.
```

**Solution** : Vérifiez que le fichier `.env` existe et contient toutes les variables requises.

#### 2. Problèmes de connexion Appium

```text
WebDriverException: Could not connect to the Appium server
```

**Solutions** :

- Vérifiez que le serveur Appium est lancé : `appium --port 4723`
- Vérifiez la connexion de l’appareil/émulateur : `adb devices`
- Vérifiez l’URL `APPIUM_SERVER_URL` dans `.env`

#### 3. Élément non trouvé

```text
Element with locator 'xpath=...' not found
```

**Solutions** :

- Vérifiez que l’UI de l’application n’a pas changé
- Utilisez Appium Inspector pour valider les XPath
- Vérifiez la résolution et la disposition de l’appareil
- Augmentez les délais d’attente dans les variables

#### 4. Problèmes d’installation de l’application

```text
An unknown server-side error occurred while processing the command
```

**Solutions** :

- Vérifiez le chemin APK dans `.env`
- Vérifiez l’espace de stockage de l’appareil
- Vérifiez les permissions et la compatibilité de l’application
- Essayez une installation manuelle : `adb install app-looma.apk`

#### 5. Problèmes de timeout

```text
Element did not appear within timeout
```

**Solutions** :

- Augmentez `DEFAULT_WAIT_TIME` dans `variables.py`
- Vérifiez les performances de l’application sur l’appareil
- Vérifiez la connectivité réseau pour le chargement des images
- Utilisez des attentes explicites pour certains éléments

### Mode debug

```bash
# Exécuter avec logs maximum
robot --loglevel TRACE --outputdir debug_results tests/

# Exécuter un test avec logs debug
robot --loglevel DEBUG --test "Should Login With Valid Credentials" tests/login_tests.robot
```

## Bonnes pratiques appliquées

### Conception des tests

- **Page Object Pattern** : Localisateurs séparés de la logique de test
- **Tests orientés données** : Configuration externe des données de test
- **Mots-clés modulaires** : Composants réutilisables
- **Structure claire** : Cas de test lisibles et maintenables

### Framework d’automatisation

- **Attentes explicites** : Synchronisation robuste des éléments
- **Configuration d’environnement** : Déploiement flexible
- **Gestion des erreurs** : Validation complète des erreurs
- **Reporting** : Logs détaillés et captures d’écran

### Maintenance

- **Localisateurs centralisés** : Gestion facilitée des changements UI
- **Gestion de la configuration** : Paramètres spécifiques à l’environnement
- **Contrôle de version** : Structure de dépôt propre
- **Documentation** : Guides complets d’installation et d’utilisation

## Contribution

### Ajouter de nouveaux tests

1. Créez les cas de test dans les fichiers `.robot` appropriés
2. Ajoutez les nouveaux localisateurs dans `locators.py`
3. Mettez à jour les variables dans `variables.py` si nécessaire
4. Ajoutez les mots-clés réutilisables dans `common_keywords.robot`
5. Mettez à jour ce README avec la documentation des nouveaux tests

### Maintenance des localisateurs

- Utilisez Appium Inspector pour vérifier les localisateurs
- Privilégiez les attributs content-desc aux XPath complexes
- Groupez les localisateurs par écran/fonctionnalité
- Documentez toute logique complexe de localisateur

## Licence

Cette suite de tests fait partie des exercices de laboratoire QA et est destinée à un usage éducatif.
