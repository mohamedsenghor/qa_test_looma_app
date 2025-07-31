# Robot Framework Mobile Installation Guide

This guide covers the setup of Robot Framework for mobile automation, including Android Studio, Appium, and related tools.

---

## 1. Install Android Studio

**Purpose:** Official IDE for Android app development.

- **Download:** [Android Studio](https://developer.android.com/studio)

### Key Tools Included

- **apkanalyzer:** Analyze APK composition after build.
- **avdmanager:** Create and manage Android Virtual Devices (AVDs) via command line.
- **lint:** Analyze code for structural quality issues.
- **retrace:** Decode obfuscated stack traces (for R8-compiled apps).
- **sdkmanager:** Manage Android SDK packages (install, update, uninstall).

### Find Android SDK Path

1. In Android Studio, go to `File > Project Structure`.
2. Select **SDK Location** in the left pane.
3. The path is shown under **Android SDK location**.

---

## 2. Install Appium Library for Robot Framework

```sh
pip install robotframework-appiumlibrary
pip show robotframework-appiumlibrary
```

---

## 3. Install Appium Server

**Purpose:** Appium is an open-source tool for automating UI across multiple platforms (mobile, browser, desktop, TV, etc.).

- **Documentation:** [Appium Docs](https://appium.io/docs/en/latest/)
- **Requirements:** [Appium Prerequisites](https://appium.io/docs/en/latest/quickstart/requirements/)
- **Installation:** [Appium Install Guide](https://appium.io/docs/en/latest/quickstart/install/) (via npm)
  - **macOS:** `brew install appium`
  - **Windows:** Follow the official documentation

### 3.1 Install UiAutomator2 Driver

- **Docs:** [UiAutomator2 Driver](https://appium.io/docs/en/latest/quickstart/uiauto2-driver/)
- **Install via Appium CLI:**

    ```sh
    appium driver install uiautomator2
    ```

### 3.2 Install JDK

Ensure Java Development Kit (JDK) is installed and configured.

### 3.3 Verify Installation

```sh
appium driver doctor uiautomator2
```

---

## 4. Install Appium Inspector

**Purpose:** Graphical tool to inspect and interact with the app under test.

- **Download:** [Appium Inspector Releases](https://github.com/appium/appium-desktop/releases)

### Prerequisites

- Set `JAVA_HOME` and `ANDROID_HOME` environment variables.

### Launch & Configure

1. Start Appium Inspector.
2. Configure session:
     - **Remote Host:** `localhost`
     - **Port:** `4723`

---

**You're now ready to automate mobile apps with Robot Framework!**
