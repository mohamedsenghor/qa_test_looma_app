# Looma QA Automation Tests

Ce projet contient les tests automatisés pour différentes fonctionnalités de Looma, organisés selon la convention Page Object Model (POM).

## Structure du projet

### Lab 1 - MongoDB Tests
```
lab1_mongodb/
├── pageobjects/
│   ├── variables.py
│   └── locators.py
├── resources/
│   └── mongodb_keywords.robot
├── testcases/
│   └── mongodb_tests.robot
└── results/
```

### Lab 2 - UI Tests (Customer Service)
```
lab2_ui/
├── pageobjects/
│   ├── variables.py
│   └── locators.py
├── resources/
│   └── ui_keywords.robot
├── testcases/
│   └── customer_service_tests.robot
└── results/
```

### Lab 3 - API Tests (eBay)
```
lab3_api/
├── pageobjects/
│   ├── variables.py
│   └── locators.py
├── resources/
│   └── api_keywords.robot
├── testcases/
│   └── ebay_api_tests.robot
└── results/
```

### Lab 4 - Mobile Tests (Looma App)
```
lab4_mobile/
├── pageobjects/
│   ├── variables.py
│   └── locators.py
├── resources/
│   └── mobile_keywords.robot
├── testcases/
│   └── looma_app_tests.robot
└── results/
```

## Installation

1. Installez les dépendances nécessaires :
```bash
pip install -r requirements.txt
```

2. Configurez les variables d'environnement nécessaires dans chaque fichier variables.py :
- MongoDB URI
- eBay API Token
- Appium Configuration

## Exécution des tests

Pour exécuter les tests d'un laboratoire spécifique :
```bash
robot lab1_mongodb/testcases/mongodb_tests.robot
robot lab2_ui/testcases/customer_service_tests.robot
robot lab3_api/testcases/ebay_api_tests.robot
robot lab4_mobile/testcases/looma_app_tests.robot
```

Pour exécuter tous les tests :
```bash
robot lab*/testcases/*.robot
```

Les résultats seront stockés dans les dossiers `results/` de chaque laboratoire.
