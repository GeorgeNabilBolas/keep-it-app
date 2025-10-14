# KEEP IT.

## 📱 Project Overview

**KEEP IT.** is a cross-platform mobile application built with Flutter that functions as an **anti-theft and security alarm system** for your device. It is designed to run silently in the background using a **Foreground Service** and alert you when unauthorized interactions occur with your phone.

The application includes an onboarding experience (`IntroductionPage`) for first-time users and a `HomePage` to manage its security features.

## ✨ Core Features

The app provides several distinct security alarms, manageable from the main screen:

* **Charger Alarm**: Alarms when the charger cable is disconnected.
* **Motion Alarm**: Alarms when the mobile device is moved.
* **Pocket Alarm**: Alarms when the mobile is taken out of a pocket.
* **Headset Alarm**: Planned feature to alarm when the headset is disconnected.

## 🛠️ Tech Stack & Dependencies

The project is a standard Flutter application but utilizes several powerful packages for its core functionality:

| Package | Purpose |
| :--- | :--- |
| **`flutter_bloc`** | State management using Cubits (e.g., `SlidingCubit`, `NavigationbarCubit`, `GenerateFeatureCubit`). |
| **`flutter_foreground_task`** | To run persistent tasks (like monitoring sensors/ports) in the background. |
| **`permission_handler`** | To request necessary system permissions, such as notifications and drawing over other apps. |
| **`battery_plus`** | Used specifically for monitoring the device's battery state (e.g., detecting charger disconnect). |
| **`flutter_svg`** | For rendering SVG assets used throughout the UI (e.g., home page content and dialogs). |
| **`shared_preferences`** | To persist simple data, such as the feature activation status and whether the user is a first-time runner (`isFirstRun`). |

## ⚙️ Getting Started

This project is a starting point for a Flutter application.

### Prerequisites

* Flutter SDK installed and configured.
* Android and iOS development environments set up.

### Installation

1.  Clone the repository:
    ```bash
    git clone [your_repo_url] keep-it-app-main
    cd keep-it-app-main
    ```

2.  Install the necessary dependencies:
    ```bash
    flutter pub get
    ```

3.  Run the application on a connected device or emulator:
    ```bash
    flutter run
    ```

### Important Notes for Android

The application requires several special permissions to function correctly in the background and override the screen:

* `android.permission.FOREGROUND_SERVICE`
* `android.permission.WAKE_LOCK`
* `android.permission.SYSTEM_ALERT_WINDOW` (Draw over other apps)
* `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`
* `android.permission.POST_NOTIFICATIONS` (For Android 13+)

The application will prompt the user to grant these permissions when required.

## 📖 Resources

For help getting started with Flutter development, view the online documentation:

* [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
* [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
* [Flutter online documentation](https://docs.flutter.dev/)
