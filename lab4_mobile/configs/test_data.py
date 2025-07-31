# Test Data
CREDENTIALS = {
    "valid": {"username": "johnd", "password": "m38rmF$"},
    "invalid": {"username": "invaliduser", "password": "wrongpass"},
    "empty": {"username": "", "password": ""}
}

PRODUCTS = {
    "valid": {
        "name": "Rain Jacket Women Windbreaker",
        "price": "99.99",
        "description": "Waterproof rain jacket for women"
    },
    "invalid": {
        "name": "Invalid Product",
        "price": "abc",
        "description": "Invalid description"
    }
}

# Appium Configuration
APPIUM_CONFIG = {
    "platformName": "Android",
    "platformVersion": "16",
    "deviceName": "Medium Phone API 36",
    "automationName": "UiAutomator2",
    "app": "app-looma.apk",
    "noReset": False,
    "appPackage": "sn.sonatel.dsi.moussa.wade.moussawade",
    "appActivity": ".MainActivity",
    "url": "http://localhost:4723"
}
