PLATFORM_NAME = "Android"
PLATFORM_VERSION = 16
DEVICE_NAME = "Medium Phone API 36"
AUTOMATION_NAME = "UiAutomator2"
APP_PACKAGE = "sn.sonatel.dsi.moussa.wade.moussawade"
APP_ACTIVITY = ".MainActivity"
APK_PATH = "/home/mohamed/Documents/ISI_Courses/QA_Test/EXAMEN_QA_TEST/lab4_mobile/app-looma.apk"
NO_RESET = False
APPIUM_SERVER_URL = "http://localhost:4723"

DEFAULT_WAIT_TIME = "10s"

# Credentials
VALID_CREDENTIALS = {
    "username": "johnd",
    "password": "m38rmF$"
}

INVALID_CREDENTIALS = {
    "username": "invalid_user",
    "password": "wrong_pass"
}

EMPTY_CREDENTIALS = {
    "username": "",
    "password": ""
}

# Product Data
PRODUCT_DATA = {
    "name": "Rain Jacket Women Windbreaker",
    "price": 99.99,
    "description": "Waterproof rain jacket for women"
}

INVALID_PRODUCT_DATA = {
    "name": "Invalid Product",
    "price": "abc",
    "description": "Invalid description"
}
