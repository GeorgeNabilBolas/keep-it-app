# KEEP IT. - Anti-Theft Security Alarm

## 📱 Project Overview

**KEEP IT.** is a modern, cross-platform mobile application built with **Flutter** designed to protect your device from unauthorized access and theft. It operates silently in the background using a **Foreground Service** to constantly monitor for security breaches, such as unplugging the charger, unexpected movement, or removing the phone from a pocket.

The application features a clean, intuitive UI with a clear **Onboarding** process and a centralized **Home Screen** for managing all alarm functionalities.

## ✨ Features & Screens

The app provides distinct security alarms and a guided user experience, as illustrated by the screenshots:

| Feature/Screen | Description | Screenshot(s) |
| :--- | :--- | :--- |
| **Welcome/Onboarding** | A visually guided introduction for first-time users, explaining the app's purpose and key features. |<img width="864" height="2016" alt="4" src="https://github.com/user-attachments/assets/ee4cce8f-6bbd-4fe4-a3ac-8eee1459fb1f" />
<img width="864" height="2016" alt="3" src="https://github.com/user-attachments/assets/01002511-cff4-4ef6-b136-a2d105cf7f08" />
<img width="864" height="2016" alt="2" src="https://github.com/user-attachments/assets/87024c11-6102-4a09-a450-cc0bd6bccc1a" />
<img width="864" height="2016" alt="1" src="https://github.com/user-attachments/assets/910342f7-14fc-4cc5-abf1-a12a2f073559" />
<img width="864" height="2016" alt="5" src="https://github.com/user-attachments/assets/885f7ae7-9825-472e-903d-83c219562762" />
|
| **Home Screen** | The central hub where users can view and toggle the status of all alarms. Features a sliding menu for navigation. | `4.png`, `5.png` |
| **Charger Alarm** | Triggers a loud alarm when the device is disconnected from the charging cable. | `4.png` (Top Toggle) |
| **Motion Alarm** | Triggers a loud alarm when the device is moved from its resting position. | `4.png` (Middle Toggle) |
| **Pocket Alarm** | Triggers an alarm when the device is removed from a pocket or bag (likely using the proximity sensor). | `4.png` (Bottom Toggle) |
| **Alarm Activation** | When an alarm is activated (e.g., Charger Alarm is ON), the corresponding card visually changes (e.g., to a red/active state). | `6.png` |
| **Deactivation Prompt** | A full-screen overlay that appears when an alarm is triggered, requiring the user to enter a specific code/pattern to silence the alarm. **(Crucial anti-theft step)**. | `7.png`, `8.png`, `9.png` |
| **Settings/About Screen** | Accessible via the sliding menu, this section allows users to manage app settings, view an 'About' page, or get help. | `10.png` |

## 🛠️ Tech Stack & Dependencies

The project is a standard Flutter application, relying on the following key packages (based on the previous file analysis):

* **Flutter:** Cross-platform mobile development framework.
* **`flutter_bloc`:** State management for predictable and testable application logic.
* **`flutter_foreground_task`:** Essential for running persistent anti-theft monitoring in the device background.
* **`permission_handler`:** To manage and request critical system permissions (e.g., Draw over other apps).
* **`battery_plus`:** To monitor the charging state for the Charger Alarm.
* **`shared_preferences`:** To persist user settings and first-run status.

## ⚙️ Getting Started

### Prerequisites

* Flutter SDK installed and configured.
* Android and/or iOS development environment set up.

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/GeorgeNabilBolas/keep-it-app keep-it-app-main
    cd keep-it-app-main
    ```
2.  Install dependencies:
    ```bash
    flutter pub get
    ```
3.  Run the application:
    ```bash
    flutter run
    ```

### ⚠️ Android Specifics

Due to the nature of a persistent security application, the Android version requires several special permissions:

* **Background Execution (`FOREGROUND_SERVICE`):** To keep the monitoring running indefinitely.
* **Display Over Other Apps (`SYSTEM_ALERT_WINDOW`):** To display the mandatory deactivation screen (`7.png`, `8.png`) over the alarm lock screen.
* **Battery Optimization Ignorance (`REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`):** To prevent the OS from killing the background service.

The app is designed to request these permissions from the user via prompts when they first try to activate an alarm.

## 🚀 Future Development

* Implement the planned **Headset Alarm** feature.
* Add customizable alarm sounds and volume control.
* Implement a secure PIN/Password system for alarm deactivation.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue.

## 📄 License

This project is public for education
