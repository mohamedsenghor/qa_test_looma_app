class LoginLocators:
    USERNAME = "//android.widget.EditText[1]"  # Simplified XPath
    PASSWORD = "//android.widget.EditText[2]"
    LOGIN_BUTTON = "//android.widget.Button[@content-desc='Se connecter']"
    SCREEN_TITLE = "//android.view.View[@content-desc='Connexion']"
    ERROR_MESSAGE = "//android.view.View[@content-desc='Vérifiez vos identifiants']"
    ERROR_OK_BUTTON = "//android.widget.Button[@content-desc='OK']"

class ProductLocators:
    NAME = "//android.widget.EditText[@resource-id='productName']"
    PRICE = "//android.widget.EditText[@resource-id='productPrice']"
    DESCRIPTION = "//android.widget.EditText[@resource-id='productDescription']"
    SAVE_BUTTON = "//android.widget.Button[@content-desc='Ajouter']"
    SUCCESS_MESSAGE = "//*[contains(@text, 'created successfully')]"
    SCREEN_TITLE = "//android.view.View[@content-desc='Ajouter un produit']"
