# Laboratoire de Tests QA - Suite de Tests Complète

## Auteurs

**Bassine DIALLO**  
**Mohamed SENGHOR**

## Aperçu

Ce dépôt contient une collection complète de laboratoires de tests automatisés couvrant l’ensemble des pratiques d’Assurance Qualité. Le projet illustre des méthodologies de test professionnelles sur différents types d’applications et technologies, en appliquant les meilleures pratiques du secteur avec Robot Framework.

## Structure du Dépôt

```text
qa_test_looma_app/
├── README.md                     # Cette documentation
├── .gitignore                    # Exclusions pour le contrôle de version
├── lab1_mongodb/                 # Laboratoire de tests base de données
│   ├── pageobjects/             # Connexion MongoDB & objets de données
│   ├── resources/               # Ressources de tests base de données
│   └── testcases/               # Cas de test des opérations BDD
├── lab2_ui/                     # Laboratoire de tests Web UI
│   ├── pageobject/              # Implémentation Page Object Model
│   ├── resources/               # Mots-clés et utilitaires UI
│   ├── testcases/               # Cas de test application web
│   └── results/                 # Rapports d’exécution des tests
├── lab3_api/                    # Laboratoire de tests API
│   ├── README.md                # Documentation API (anglais)
│   ├── fr/README.md             # Documentation API (français)
│   ├── pageobjects/             # Endpoints API et configuration
│   ├── resources/               # Mots-clés de test API
│   └── testcases/               # Cas de test REST API
└── lab4_mobile/                 # Laboratoire de tests mobiles
    ├── README.md                # Documentation mobile (anglais)
    ├── fr/README.md             # Documentation mobile (français)
    ├── .env                     # Configuration d’environnement
    ├── app-looma.apk            # Application Android de test
    ├── resources/               # Utilitaires de test mobile
    └── tests/                   # Cas de test application mobile
```

## Laboratoires de Test

### Lab 1 : Tests Base de Données (lab1_mongodb)

**Objectif** : Automatiser les tests des opérations MongoDB

**Technologies** :

- Base de données MongoDB
- Pilote PyMongo
- Robot Framework avec bibliothèques Python personnalisées

**Couverture de test** :

- Connexion et authentification à la base de données
- Validation des opérations CRUD
- Vérification de l’intégrité des données
- Scénarios de tests de performance

### Lab 2 : Tests Web UI (lab2_ui)

**Objectif** : Automatiser les tests de l’interface utilisateur web

**Technologies** :

- Selenium WebDriver
- Robot Framework SeleniumLibrary
- Modèle Page Object
- Compatibilité multi-navigateurs

**Couverture de test** :

- Flux d’authentification utilisateur
- Fonctionnalités de gestion client
- Vérification de la page d’accueil
- Validation de formulaires et gestion des erreurs

### Lab 3 : Tests API (lab3_api)

**Objectif** : Tests REST API complets avec l’environnement sandbox eBay

**Technologies** :

- APIs Fulfillment & Finance eBay
- Authentification OAuth 2.0
- Robot Framework RequestsLibrary
- Protocoles HTTP/REST

**Couverture de test** :

- Authentification et autorisation
- Opérations de gestion des commandes
- Traitement des transactions financières
- Gestion des erreurs et validation

**Documentation** : Disponible en [anglais](lab3_api/README.md) et [français](lab3_api/fr/README.md)

### Lab 4 : Tests Mobiles (lab4_mobile)

**Objectif** : Tests d’application Android native avec Appium

**Technologies** :

- Appium WebDriver
- Android SDK
- Robot Framework AppiumLibrary
- Automatisation sur appareils mobiles

**Couverture de test** :

- Installation et lancement de l’application mobile
- Authentification utilisateur sur mobile
- Flux de gestion des produits
- Interactions avec les éléments UI mobiles

**Documentation** : Disponible en [anglais](lab4_mobile/README.md) et [français](lab4_mobile/fr/README.md)

## Prérequis

### Configuration Système

- **Python 3.8+** avec pip
- **Robot Framework 6.1.1+**
- **Git** pour le contrôle de version
- **Java JDK 8+** (pour les tests mobiles)
- **Node.js 14+** (pour Appium)

### Outils de Développement

- **Git** (Contrôle de version)
- **Visual Studio Code** (IDE)
- **Appium Inspector** (Inspection des éléments mobiles)
- **MongoDB Compass** (Gestion base de données)
- **IDE** : Visual Studio Code (recommandé) ou PyCharm
- **Drivers navigateurs** : ChromeDriver, GeckoDriver (pour tests web)
- **Outils mobiles** : Android SDK, Appium Inspector
- **Outils base de données** : MongoDB Compass (optionnel)

## Démarrage Rapide

### 1. Préparation du Dépôt

```bash
# Cloner le dépôt
git clone <repository-url>
cd qa_test_looma_app

# Installer les dépendances Python (créer requirements.txt si besoin)
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-requests
pip install robotframework-appiumlibrary
pip install pymongo
pip install python-dotenv
```

### 2. Configuration de l’Environnement

```bash
# Copier le template d’environnement (pour tests mobiles)
cp lab4_mobile/.env.example lab4_mobile/.env

# Modifier les fichiers de configuration selon vos besoins
# Mettre à jour les tokens API, connexions BDD, paramètres appareils
```

### 3. Exécution des Laboratoires

```bash
# Tests base de données
cd lab1_mongodb && robot testcases/

# Tests Web UI  
cd lab2_ui && robot testcases/

# Tests API
cd lab3_api && robot testcases/

# Tests mobiles (Appium requis)
cd lab4_mobile && robot tests/
```

## Méthodologies de Test Implémentées

### Modèles de Conception de Test

- **Page Object Model** : Séparation claire des éléments UI et de la logique de test
- **Tests pilotés par les données** : Gestion externe des données de test et paramétrage
- **Tests pilotés par mots-clés** : Composants de test réutilisables et logique métier
- **Développement piloté par le comportement** : Scénarios de test clairs et lisibles

### Fonctionnalités du Framework d’Automatisation

- **Compatibilité multiplateforme** : Tests web, mobile et API
- **Exécution parallèle** : Capacité d’exécution concurrente des tests
- **Rapports complets** : Rapports HTML détaillés avec captures d’écran
- **Gestion des erreurs** : Gestion robuste des exceptions et reprise
- **Gestion d’environnement** : Configuration flexible selon l’environnement

### Pratiques d’Assurance Qualité

- **Analyse de couverture de test** : Couverture fonctionnelle complète
- **Tests de régression** : Validation automatisée des fonctionnalités existantes
- **Tests d’intégration** : Validation des workflows de bout en bout
- **Surveillance des performances** : Tests de temps de réponse et de charge
- **Tests de sécurité** : Validation de l’authentification et de l’autorisation

## Exécution des Tests

- Vérifier les fichiers de configuration d’environnement (`.env`, variables)
- Contrôler la disponibilité et les versions des applications
- Vérifier les prérequis et dépendances des données de test
- Surveiller les ressources système lors de l’exécution parallèle

### Exécution Individuelle d’un Laboratoire

```bash
# Exécuter un laboratoire spécifique
robot lab1_mongodb/testcases/           # Tests base de données
robot lab2_ui/testcases/                # Tests Web UI  
robot lab3_api/testcases/               # Tests API
robot lab4_mobile/tests/                # Tests mobiles
```

### Options d’Exécution Avancées

```bash
# Journalisation détaillée avec répertoire de sortie personnalisé
robot --loglevel DEBUG --outputdir results lab2_ui/testcases/

# Exécution par tag
robot --include smoke lab3_api/testcases/
robot --exclude slow lab4_mobile/tests/

# Surcharge de variable
robot --variable BROWSER:Firefox lab2_ui/testcases/
robot --variable DEVICE_NAME:"Custom Device" lab4_mobile/tests/

# Exécution parallèle (pabot requis)
pabot --processes 4 lab*/testcases/
```

## Rapports de Test et Analyse

### Artéfacts Générés

- **`report.html`** : Résumé exécutif de l’exécution des tests
- **`log.html`** : Journal détaillé étape par étape
- **`output.xml`** : Résultats lisibles par machine
- **Captures d’écran** : Automatique en cas d’échec (tests UI/Mobile)

### Analyse des Rapports

```bash
# Ouvrir les rapports complets
open report.html      # Résumé multiplateforme
open log.html         # Traces détaillées

# Rapports spécifiques à un laboratoire
open lab2_ui/results/report.html
open lab4_mobile/results/report.html
```

## Bonnes Pratiques Démontrées

### Architecture & Conception

- **Structure modulaire du framework** : Composants réutilisables entre laboratoires
- **Gestion de configuration** : Paramètres et identifiants spécifiques à l’environnement
- **Intégration au contrôle de version** : Structure propre avec `.gitignore` adapté
- **Normes de documentation** : README complets en plusieurs langues

### Sécurité & Conformité

- **Gestion des identifiants** : Sécurisation des tokens API et mots de passe
- **Isolation des environnements** : Configurations sandbox/production séparées
- **Contrôle d’accès** : Tests d’authentification et d’autorisation appropriés
- **Confidentialité des données** : Exclusion des informations sensibles du contrôle de version

### Maintenance & Scalabilité

- **Localisateurs centralisés** : Maintenance facilitée des sélecteurs UI
- **Mots-clés réutilisables** : Abstraction des fonctionnalités communes
- **Reprise sur erreur** : Gestion élégante des échecs et timeouts
- **Support multi-navigateurs/appareils** : Exécution multiplateforme

### Bonnes Pratiques pour les Contributeurs

- Suivre les conventions de nommage Robot Framework
- Implémenter une gestion d’erreur et une journalisation appropriées
- Ajouter une documentation de test complète
- Utiliser des données de test et assertions pertinentes
- Prendre en compte la compatibilité multiplateforme

## Dépannage

### Problèmes Courants

#### Configuration de l’Environnement

- Vérifier l’installation de Python et Robot Framework
- Contrôler la compatibilité des drivers navigateurs et le PATH
- S’assurer de la connexion de l’appareil mobile/émulateur pour le Lab 4
- Valider les identifiants API et la connectivité réseau pour le Lab 3

#### Mode Débogage

```bash
# Journalisation maximale pour le dépannage
robot --loglevel TRACE --outputdir debug_results testcases/

# Déboguer un test spécifique
robot --test "Nom du test spécifique" --loglevel DEBUG testcases/
```

## Support et Ressources

### Liens de Documentation

- [Guide utilisateur Robot Framework](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Documentation Selenium](https://selenium-python.readthedocs.io/)
- [Documentation Appium](http://appium.io/docs/en/about-appium/intro/)
- [Guide de test MongoDB](https://docs.mongodb.com/manual/testing/)

### Aide par Laboratoire

- **Lab 1** : Connexion base de données et intégration PyMongo
- **Lab 2** : Localisation des éléments web et compatibilité navigateurs
- **Lab 3** : Authentification API et tests d’endpoints
- **Lab 4** : Configuration appareil mobile et Appium

## Licence

Cette suite de tests complète est développée à des fins éducatives et de perfectionnement professionnel, illustrant les pratiques et méthodologies d’automatisation QA du secteur.

## Technologies & Frameworks

### Framework Principal

- **Robot Framework** 6.1.1+ (Framework d’automatisation de tests)
- **Python** 3.8+ (Langage de programmation)

### Bibliothèques de Test

- **SeleniumLibrary** (Automatisation Web UI)
- **RequestsLibrary** (Tests HTTP API)  
- **AppiumLibrary** (Automatisation mobile)
- **PyMongo** (Intégration MongoDB)
