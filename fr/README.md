# Laboratoire de QA - Suite Complète de Tests

## Auteurs

**Bassine DIALLO**  
**Mohamed SENGHOR**

## Aperçu

Ce dépôt contient une collection complète de laboratoires de tests automatisés couvrant l’ensemble des pratiques d’Assurance Qualité. Le projet démontre des méthodologies de test professionnelles sur différents types d’applications et technologies, en appliquant les meilleures pratiques du secteur avec Robot Framework. Chaque laboratoire met en avant une expertise dans un domaine de test spécifique tout en maintenant des schémas architecturaux et des standards de documentation cohérents.

## Structure du Dépôt

```text
qa_test_looma_app/
├── README.md                     # Cette documentation
├── .gitignore                    # Exclusions pour le contrôle de version
├── fr/                          # Documentation en français
│   └── README.md                # Documentation complète en français
├── lab1_mongodb/                 # Laboratoire de tests base de données
│   ├── README.md                # Documentation du Lab 1
│   ├── fr/README.md             # Documentation en français
│   ├── pageobjects/             # Connexion MongoDB & objets de données
│   │   ├── mongodb_lib.py       # Librairie d’opérations MongoDB
│   │   ├── variables.py         # Configuration de la base de données
│   │   └── locators.py          # Définitions des champs de la base
│   ├── resources/               # Ressources de test base de données
│   │   └── MongoDBKeywords.robot # Mots-clés réutilisables
│   └── testcases/               # Cas de test base de données
│       ├── TestProducts.robot   # Cas de test CRUD produits
│       └── TestOtherEntities.robot # Tests utilisateurs, commandes, catégories
├── lab2_ui/                     # Laboratoire de tests Web UI
│   ├── README.md                # Documentation du Lab 2
│   ├── fr/README.md             # Documentation en français
│   ├── pageobject/              # Implémentation Page Object Model
│   │   └── variables.py         # Variables de configuration et données de test
│   ├── resources/               # Mots-clés et utilitaires UI
│   │   └── testCas.robot        # Mots-clés communs de test
│   └── testcases/               # Cas de test application web
│       ├── add_customer_test.robot # Tests gestion clients
│       ├── login_test.robot     # Cas de test authentification
│       └── testCas.robot        # Vérification page d’accueil
├── lab3_api/                    # Laboratoire de tests API
│   ├── README.md                # Documentation du Lab 3
│   ├── fr/README.md             # Documentation en français
│   ├── pageobjects/             # Endpoints API et configuration
│   │   ├── locators.py          # Définitions des endpoints API
│   │   └── variables.py         # Variables et configuration de test
│   ├── resources/               # Mots-clés de test API
│   │   ├── ebay_config.py       # Configuration API eBay
│   │   └── ebay_keywords.robot  # Mots-clés API réutilisables
│   └── testcases/               # Cas de test REST API
│       └── ebay_api_tests.robot # Cas de test eBay API avec fallback
└── lab4_mobile/                 # Laboratoire de tests mobiles
    ├── README.md                # Documentation du Lab 4
    ├── fr/README.md             # Documentation en français
    ├── .env                     # Configuration d’environnement
    ├── app-looma.apk            # Application Android de test
    ├── resources/               # Utilitaires de test mobile
    │   ├── common_keywords.robot # Mots-clés réutilisables
    │   ├── locators.py          # Localisateurs UI (XPath)
    │   └── variables.py         # Variables et configuration de test
    └── tests/                   # Cas de test application mobile
        ├── login_tests.robot    # Cas de test authentification
        └── product_tests.robot  # Cas de test gestion produits
```

## Laboratoires de Test

### Lab 1 : Tests Base de Données (lab1_mongodb)

**Objectif** : Tests automatisés des opérations MongoDB sur plusieurs entités

**Technologies** :

- Base de données MongoDB (Atlas/Local)
- Pilote PyMongo 4.6.0+
- Robot Framework avec librairies Python personnalisées
- BSON pour la gestion des documents

**Couverture de Test** :

- Connexion et authentification base de données
- Validation des opérations CRUD (Produits, Utilisateurs, Commandes, Catégories)
- Vérification de l’intégrité des données et validation des champs
- Tests de relations multi-entités
- Gestion des ObjectId et des erreurs

**Fonctionnalités Clés** :

- **Support Multi-Entités** : Produits, Utilisateurs, Commandes, Catégories
- **Validation Complète** : Email, prix, contraintes d’unicité
- **Gestion des Erreurs** : Gestion élégante des ObjectId invalides et champs manquants
- **Isolation des Données** : Chaque test crée ses propres données

**Documentation** : Disponible en [anglais](lab1_mongodb/README.md) et [français](lab1_mongodb/fr/README.md)

### Lab 2 : Tests Web UI (lab2_ui)

**Objectif** : Tests automatisés de l’interface utilisateur d’une application CRM

**Technologies** :

- Selenium WebDriver 4.15.0+
- Robot Framework SeleniumLibrary 6.2.0+
- Implémentation du modèle Page Object
- Navigateur Chrome avec gestion automatique du driver

**Couverture de Test** :

- Flux d’authentification utilisateur et validation de sécurité
- Fonctionnalités de gestion client (CRUD)
- Vérification de la page d’accueil et validation du contenu
- Validation de formulaire et gestion des erreurs
- Tests de compatibilité multi-navigateurs

**Fonctionnalités Clés** :

- **Gestion Automatique du Driver** : Selenium 4.x gère ChromeDriver
- **Attentes Explicites** : Synchronisation robuste des éléments
- **Localisation Française** : Mots-clés de test en français
- **Conception Modulaire** : Séparation claire entre ressources et cas de test

**Documentation** : Disponible en [anglais](lab2_ui/README.md) et [français](lab2_ui/fr/README.md)

### Lab 3 : Tests API (lab3_api)

**Objectif** : Tests REST API complets sur l’environnement sandbox eBay avec mécanisme de secours

**Technologies** :

- APIs Fulfillment & Finance eBay
- Authentification OAuth 2.0 et gestion des tokens
- Robot Framework RequestsLibrary
- Protocoles HTTP/REST avec échanges JSON
- Système de réponses mock pour les scénarios de secours

**Couverture de Test** :

- Authentification et autorisation (OAuth 2.0)
- Opérations de gestion des commandes (GET commandes, détails)
- Traitement des transactions financières (remboursements)
- Gestion des erreurs et validation (401, 404, 400)
- Mécanisme de secours en cas d’indisponibilité du sandbox

**Fonctionnalités Clés** :

- **Secours Automatique** : Réponses mock si le sandbox eBay est indisponible
- **Double Configuration** : Fichiers de config séparés selon l’usage
- **Tests d’Erreur Complets** : Tokens invalides, commandes manquantes, problèmes réseau
- **Compatible CI/CD** : Les tests ne sont jamais en échec à cause d’un service externe

**Documentation** : Disponible en [anglais](lab3_api/README.md) et [français](lab3_api/fr/README.md)

### Lab 4 : Tests Mobiles (lab4_mobile)

**Objectif** : Tests d’application Android native avec Appium

**Technologies** :

- Appium WebDriver avec UiAutomator2
- Android SDK et outils de plateforme
- Robot Framework AppiumLibrary 2.0.0+
- Automatisation sur appareil ou émulateur
- Localisation des éléments via XPath

**Couverture de Test** :

- Installation et lancement de l’application mobile
- Authentification utilisateur sur mobile
- Gestion produits et validation de formulaires
- Interactions UI et navigation mobile
- Gestion des erreurs et messages de validation

**Fonctionnalités Clés** :

- **Configuration Environnement** : Paramétrage flexible via fichier .env
- **Localisateurs XPath** : Stratégies complètes de localisation d’éléments
- **Validation de Formulaire** : Tests des champs obligatoires et messages d’erreur
- **Intégration Appium** : Stack d’automatisation mobile complète

**Documentation** : Disponible en [anglais](lab4_mobile/README.md) et [français](lab4_mobile/fr/README.md)

## Prérequis

### Configuration Système

- **Python 3.8+** avec pip
- **Robot Framework 6.1.1+**
- **Git** pour le contrôle de version
- **Java JDK 8+** (requis pour les tests mobiles)
- **Node.js 14+** (requis pour Appium)

### Outils de Développement

- **IDE** : Visual Studio Code (recommandé) ou PyCharm
- **Contrôle de Version** : Git avec .gitignore adapté
- **Drivers Navigateur** : ChromeDriver (géré automatiquement par Selenium 4.x)
- **Outils Mobiles** : Android SDK, Appium Inspector, Émulateur Android
- **Outils Base de Données** : MongoDB Compass (optionnel)
- **Outils API** : Postman (optionnel)

### Dépendances Principales

```bash
# Framework principal
pip install robotframework==6.1.1

# Tests Web UI
pip install robotframework-seleniumlibrary==6.2.0
pip install selenium==4.15.0

# Tests API
pip install robotframework-requests==0.9.0
pip install requests==2.31.0

# Tests Base de Données
pip install pymongo==4.6.0
pip install bson==0.5.10

# Tests Mobiles
pip install robotframework-appiumlibrary==2.0.0
pip install Appium-Python-Client==2.11.1

# Gestion d’environnement
pip install python-dotenv
```

## Démarrage Rapide

### 1. Préparation du Dépôt

```bash
# Cloner le dépôt
git clone <repository-url>
cd qa_test_looma_app

# Installer toutes les dépendances Python
pip install robotframework==6.1.1
pip install robotframework-seleniumlibrary==6.2.0
pip install robotframework-requests==0.9.0
pip install robotframework-appiumlibrary==2.0.0
pip install pymongo==4.6.0
pip install python-dotenv
```

### 2. Configuration de l’Environnement

```bash
# Tests Base de Données (Lab 1)
# Mettre à jour la chaîne de connexion MongoDB dans lab1_mongodb/pageobjects/variables.py

# Tests Web UI (Lab 2)
# Vérifier que Chrome est installé et à jour

# Tests API (Lab 3)
# Mettre à jour les tokens OAuth eBay dans lab3_api/pageobjects/variables.py

# Tests Mobiles (Lab 4)
# Copier et configurer le fichier d’environnement
cp lab4_mobile/.env.example lab4_mobile/.env
# Modifier lab4_mobile/.env avec la configuration de votre appareil
```

### 3. Exécution des Laboratoires Individuels

```bash
# Tests Base de Données - Opérations CRUD MongoDB
cd lab1_mongodb && robot testcases/

# Tests Web UI - Automatisation CRM
cd lab2_ui && robot testcases/

# Tests API - Sandbox eBay avec fallback
cd lab3_api && robot testcases/

# Tests Mobiles - Automatisation Android (Appium requis)
appium --port 4723 &  # Démarrer le serveur Appium
cd lab4_mobile && robot tests/
```

## Méthodologies de Test Implémentées

### Modèles de Conception de Test

- **Page Object Model** : Séparation claire des éléments UI, données et logique de test
- **Tests Pilotés par les Données** : Gestion externe des données de test et paramétrage
- **Tests Pilotés par les Mots-Clés** : Abstraction des composants réutilisables
- **Développement Piloté par le Comportement** : Scénarios lisibles et descriptifs
- **Architecture Modulaire** : Structure cohérente sur tous les laboratoires

### Fonctionnalités du Framework d’Automatisation

- **Compatibilité Multi-Plateformes** : Tests base de données, Web, API et Mobile
- **Documentation Multi-Langue** : Documentation complète en anglais et français
- **Rapports Complets** : Rapports HTML détaillés avec captures d’écran et logs
- **Gestion des Erreurs** : Gestion robuste des exceptions et mécanismes de reprise
- **Gestion d’Environnement** : Configuration flexible pour différents environnements et appareils
- **Mécanismes de Secours** : Gestion automatique des indisponibilités externes (Lab 3)

### Pratiques d’Assurance Qualité

- **Analyse de Couverture de Test** : Couverture fonctionnelle complète
- **Tests de Régression** : Validation automatisée des fonctionnalités existantes
- **Tests d’Intégration** : Validation des workflows bout-en-bout
- **Tests de Sécurité** : Validation authentification et autorisation
- **Surveillance des Performances** : Suivi des temps de réponse et taux d’erreur
- **Validation des Données** : Validation des entrées, champs obligatoires et contraintes

## Exécution des Tests

### Exécution Individuelle par Laboratoire

```bash
# Tests Base de Données - CRUD multi-entités
robot lab1_mongodb/testcases/TestProducts.robot      # Opérations produits
robot lab1_mongodb/testcases/TestOtherEntities.robot # Utilisateurs, commandes, catégories

# Tests Web UI - Workflow CRM complet
robot lab2_ui/testcases/login_test.robot             # Authentification
robot lab2_ui/testcases/add_customer_test.robot      # Gestion client
robot lab2_ui/testcases/testCas.robot                # Vérification page d’accueil

# Tests API - Sandbox eBay avec fallback automatique
robot lab3_api/testcases/ebay_api_tests.robot        # Suite complète API

# Tests Mobiles - Automatisation Android
robot lab4_mobile/tests/login_tests.robot            # Authentification mobile
robot lab4_mobile/tests/product_tests.robot          # Gestion produits
```

### Options d’Exécution Avancées

```bash
# Logs détaillés avec répertoire de sortie personnalisé
robot --loglevel DEBUG --outputdir results lab2_ui/testcases/

# Exécution par tag pour catégories spécifiques
robot --include smoke lab1_mongodb/testcases/         # Tests smoke uniquement
robot --include authentication lab2_ui/testcases/    # Tests d’authentification
robot --include fallback lab3_api/testcases/         # Tests de secours
robot --exclude slow lab4_mobile/tests/              # Exclure les tests lents

# Surcharge de variables pour différents environnements
robot --variable BROWSER:Firefox lab2_ui/testcases/
robot --variable DEVICE_NAME:"Pixel_7_API_34" lab4_mobile/tests/
robot --variable MONGO_URI:votre_chaine_connexion lab1_mongodb/testcases/

# Exécution parallèle (pabot requis)
pip install robotframework-pabot
pabot --processes 4 lab*/testcases/
```

### Exécution en Intégration Continue

```bash
# Exécution CI/CD avec sortie lisible par machine
robot --outputdir ci_results --loglevel INFO --report ci_report.html --log ci_log.html lab*/testcases/

# Générer un XML JUnit pour l’intégration CI
robot --xunit junit_results.xml lab*/testcases/
```

## Rapports de Test et Analyse

### Artéfacts Générés

- **`report.html`** : Résumé exécutif avec statistiques de réussite/échec
- **`log.html`** : Logs détaillés étape par étape avec captures d’écran
- **`output.xml`** : Résultats lisibles par CI/CD
- **Captures d’écran** : Automatique sur échec (UI et Mobile)
- **Logs de Debug** : Informations d’erreur et traces complètes

### Rapports Spécifiques par Laboratoire

```bash
# Rapports Base de Données
open lab1_mongodb/results/report.html              # Résumé MongoDB
open lab1_mongodb/results/log.html                 # Logs transactions

# Rapports Web UI  
open lab2_ui/results/report.html                   # Résumé CRM
open lab2_ui/results/log.html                      # Logs navigateur

# Rapports API
open lab3_api/results/report.html                  # Résumé API avec statut fallback
open lab3_api/results/log.html                     # Logs requêtes HTTP

# Rapports Mobiles
open lab4_mobile/results/report.html               # Résumé mobile
open lab4_mobile/results/log.html                  # Logs interactions mobiles
```

### Commandes d’Analyse de Rapport

```bash
# Ouvrir les rapports transverses
open report.html      # Résumé exécutif tous labs
open log.html         # Traces détaillées

# Générer des rapports consolidés (tous labs)
robot --outputdir consolidated_results lab*/testcases/ lab*/tests/
```

## Bonnes Pratiques Démontrées

### Architecture & Conception

- **Structure Modulaire** : Composants réutilisables sur tous les labs
- **Schémas Cohérents** : Même approche sur Base, Web, API, Mobile
- **Gestion de Configuration** : Paramètres et credentials par environnement
- **Intégration Contrôle de Version** : Structure propre avec .gitignore complet
- **Standards de Documentation** : Documentation bilingue et formatée

### Sécurité & Conformité

- **Gestion des Credentials** : Connexions, tokens et mots de passe sécurisés
- **Isolation d’Environnement** : Configurations sandbox/production séparées
- **Contrôle d’Accès** : Tests d’authentification et autorisation sur toutes plateformes
- **Confidentialité des Données** : Exclusion des infos sensibles du dépôt
- **Sécurité des Tokens** : Bonnes pratiques OAuth 2.0 et refresh

### Maintenance & Scalabilité

- **Localisateurs Centralisés** : Maintenance facilitée des sélecteurs et endpoints
- **Mots-Clés Réutilisables** : Abstraction des fonctionnalités communes
- **Reprise sur Erreur** : Gestion élégante des échecs, timeouts, services externes
- **Support Multi-Plateformes** : Exécution multi-navigateurs, appareils, environnements
- **Mécanismes de Secours** : Gestion robuste des dépendances externes (eBay API)

### Qualité & Standards

- **Couverture de Test** : 100% des fonctionnalités principales
- **Gestion des Erreurs** : Scénarios négatifs complets
- **Surveillance des Performances** : Suivi des temps de réponse et benchmarks
- **Qualité du Code** : Standards et documentation cohérents
- **ROI Automatisation** : Réduction des efforts manuels et fiabilité accrue

## Dépannage

### Problèmes Courants

#### Problèmes d’Environnement

**Connexion Base de Données (Lab 1)** :

```bash
# Vérifier la connectivité MongoDB
python -c "from pymongo import MongoClient; print('PyMongo fonctionne')"
# Vérifier l’accès réseau à MongoDB Atlas
# Valider le format de la chaîne de connexion et les credentials
```

**Problèmes Driver Navigateur (Lab 2)** :

```bash
# Selenium 4.x gère les drivers automatiquement
# Vérifier que Chrome est installé et à jour
# Vider le cache navigateur si besoin
```

**Connectivité API (Lab 3)** :

```bash
# Vérifier le statut du sandbox eBay
# Valider l’expiration du token OAuth
# Tester l’activation du fallback
```

**Configuration Mobile (Lab 4)** :

```bash
# Vérifier que le serveur Appium tourne
appium --port 4723
# Vérifier la connexion appareil/émulateur
adb devices
# Valider le chemin d’installation de l’app
```

#### Dépannage Avancé

```bash
# Logs maximum pour debug complet
robot --loglevel TRACE --outputdir debug_results testcases/

# Debug d’un test unique avec détails
robot --test "Nom du Test" --loglevel DEBUG testcases/

# Analyse performance avec timings
robot --loglevel INFO --timestamping testcases/
```

### Dépannage Spécifique par Laboratoire

- **Lab 1** : Chaînes de connexion, format ObjectId, permissions collections
- **Lab 2** : Localisateurs, compatibilité navigateur, temps de chargement
- **Lab 3** : Expiration token, limitations API, activation fallback
- **Lab 4** : Configuration appareil, installation app, visibilité éléments

### Extension d’un Laboratoire

```bash
# Créer une nouvelle structure (ex : Lab 5 Performance)
mkdir lab5_performance
cd lab5_performance
mkdir {pageobjects,resources,testcases}
touch README.md
# Suivre les schémas des autres labs
```

### Bonnes Pratiques pour Contributeurs

- **Nommage** : Respecter les standards Robot Framework et Python
- **Gestion des Erreurs** : Exceptions et logs complets
- **Documentation** : Docstrings détaillés et README à jour
- **Données de Test** : Données réalistes et nettoyage après test
- **Compatibilité** : Prendre en compte OS et environnements différents
- **Internationalisation** : Support anglais et français

## Support et Ressources

### Liens Officiels

- [Guide Robot Framework](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Documentation Selenium WebDriver](https://selenium-python.readthedocs.io/)
- [Documentation Appium](http://appium.io/docs/en/about-appium/intro/)
- [Guide de test MongoDB](https://docs.mongodb.com/manual/testing/)
- [Documentation RequestsLibrary](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)

### Ressources par Laboratoire

- **Lab 1 (Base de Données)** : Documentation PyMongo, guides MongoDB Atlas
- **Lab 2 (Web UI)** : Bonnes pratiques Selenium, Chrome DevTools
- **Lab 3 (API)** : Documentation eBay Developer, spécifications OAuth 2.0
- **Lab 4 (Mobile)** : Guides Appium, documentation Android SDK

### Support Technique

- **Framework** : Forums Robot Framework et GitHub
- **Connexion Base de Données** : Support MongoDB et documentation Atlas
- **Automatisation Navigateur** : Communauté Selenium et Stack Overflow
- **Intégration API** : Support eBay Developer et bonnes pratiques REST
- **Tests Mobiles** : Forums Appium et ressources Android

## Licence

Cette suite de tests complète est développée à des fins éducatives et professionnelles, illustrant les pratiques d’automatisation QA standard du secteur sur plusieurs domaines de test.

## Résumé Technologies & Frameworks

### Framework Principal

- **Robot Framework** 6.1.1+ (Framework principal d’automatisation)
- **Python** 3.8+ (Langage et écosystème)

### Librairies de Test par Laboratoire

- **Lab 1** : PyMongo 4.6.0+ (Intégration MongoDB)
- **Lab 2** : SeleniumLibrary 6.2.0+ (Automatisation Web UI)
- **Lab 3** : RequestsLibrary (Tests HTTP API et OAuth)  
- **Lab 4** : AppiumLibrary 2.0.0+ (Automatisation mobile)

### Technologies de Support

- **Base de Données** : MongoDB Atlas (Cloud)
- **Navigateurs Web** : Chrome avec gestion automatique du driver
- **Plateformes API** : eBay Sandbox avec OAuth 2.0
- **Plateformes Mobiles** : Android SDK avec UiAutomator2
- **Outils Développement** : Git, Visual Studio Code, Appium Inspector

### Outils & Utilitaires Additionnels

- **Reporting** : Rapports HTML avec captures et logs détaillés
- **Intégration CI/CD** : Sortie XML JUnit et résultats lisibles par machine
- **Gestion d’Environnement** : Python dotenv pour la configuration
- **Exécution Parallèle** : Pabot pour l’exécution concurrente
- **Contrôle de Version** : Git avec .gitignore complet
