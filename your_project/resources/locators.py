# Login Page
LOGIN_TITLE = "//android.view.View[@content-desc=\"Connexion\"]"
USERNAME_INPUT = "//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]"  # Replace with actual ID/accessibility ID
PASSWORD_INPUT = "//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]"  # Replace with actual ID/accessibility ID
LOGIN_BUTTON = "//android.widget.Button[@content-desc=\"Se connecter\"]"

# Login Error Modal
ERROR_MODAL_TITLE = '//android.view.View[@content-desc="Erreur de connexion"]'
ERROR_MODAL_MESSAGE = "//android.view.View[@content-desc=\"Vérifiez vos identifiants.\"]"
ERROR_MODAL_OK_BUTTON = "//android.widget.Button[@content-desc=\"OK\"]"

# Product Creation Page
PRODUCT_CREATION_TITLE = '//android.view.View[@content-desc="Ajouter un produit"]'

PRODUCT_TITLE_INPUT = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[1]'
PRODUCT_TITLE_INPUT_ERROR='xpath=(//android.view.View[@content-desc="Obligatoire"])[1]'

PRODUCT_PRICE_INPUT = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[2]'
PRODUCT_PRICE_INPUT_ERROR='xpath=(//android.view.View[@content-desc="Obligatoire"])[2]'

PRODUCT_DESCRIPTION_INPUT = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[3]'
PRODUCT_DESCRIPTION_INPUT_ERROR='xpath=(//android.view.View[@content-desc="Obligatoire"])[3]'

PRODUCT_CATEGORY_INPUT = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[4]'
PRODUCT_CATEGORY_INPUT_ERROR='xpath=(//android.view.View[@content-desc="Obligatoire"])[4]'

PRODUCT_IMAGE_URL_INPUT = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[5]'
PRODUCT_IMAGE_URL_INPUT_ERROR='xpath=(//android.view.View[@content-desc="Obligatoire"])[5]'

ADD_PRODUCT_BUTTON = '//android.widget.Button[@content-desc="Ajouter"]'

# Common
BACK_BUTTON = '//android.widget.Button[@content-desc="Back"]'  # Or a more specific locator if available
