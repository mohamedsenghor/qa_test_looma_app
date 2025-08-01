import os
from dotenv import load_dotenv

load_dotenv(dotenv_path=os.path.join(os.path.dirname(__file__), '..', '.env'))

# Appium Configuration
APPIUM_SERVER_URL = os.getenv("APPIUM_SERVER_URL")
PLATFORM_NAME = os.getenv("PLATFORM_NAME", "Android")
PLATFORM_VERSION = os.getenv("PLATFORM_VERSION", "16")
DEVICE_NAME = os.getenv("DEVICE_NAME", "Medium Phone API 36")
AUTOMATION_NAME = os.getenv("AUTOMATION_NAME", "UiAutomator2")
APP_PACKAGE = os.getenv("APP_PACKAGE", "sn.sonatel.dsi.moussa.wade.moussawade")
APP_ACTIVITY = os.getenv("APP_ACTIVITY", ".MainActivity")
APK_PATH = os.getenv("APK_PATH")
NO_RESET = os.getenv("NO_RESET", "False").lower() == "true"
DEFAULT_WAIT_TIME = os.getenv("DEFAULT_WAIT_TIME", "10s")

# User Credentials
VALID_USERNAME = os.getenv("VALID_USERNAME")
VALID_PASSWORD = os.getenv("VALID_PASSWORD")

INVALID_USERNAME = os.getenv("INVALID_USERNAME", "wrong_user")
INVALID_PASSWORD = os.getenv("INVALID_PASSWORD", "wrong_password")

# Product Data
PRODUCT_TITLE = "DANVOUY Womens T Shirt Casual Cotton Short"
PRODUCT_PRICE = 12.99
PRODUCT_DESCRIPTION = "95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter."
PRODUCT_CATEGORY = "women's clothing"
PRODUCT_IMAGE_URL = "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg"
