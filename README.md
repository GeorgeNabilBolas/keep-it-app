# KEEP IT. - Anti-Theft Security Alarm

## 📱 Project Overview

**KEEP IT.** is a modern, cross-platform mobile application built with **Flutter** designed to protect your device from unauthorized access and theft. It operates silently in the background using a **Foreground Service** to constantly monitor for security breaches, such as unplugging the charger, unexpected movement, or removing the phone from a pocket.

The application features a clean, intuitive UI with a clear **Onboarding** process and a centralized **Home Screen** for managing all alarm functionalities.

## ✨ Features & Screens

The app provides distinct security alarms and a guided user experience, as illustrated by the screenshots:

| Feature/Screen | Description |
| :--- | :---|
| **Welcome/Onboarding** | A visually guided introduction for first-time users, explaining the app's purpose and key features.
| **Home Screen** | The central hub where users can view and toggle the status of all alarms. Features a sliding menu for navigation.
| **Charger Alarm** | Triggers a loud alarm when the device is disconnected from the charging cable.
| **Motion Alarm** | Triggers a loud alarm when the device is moved from its resting position. 
| **Pocket Alarm** | Triggers an alarm when the device is removed from a pocket or bag (likely using the proximity sensor).
| **Alarm Activation** | When an alarm is activated (e.g., Charger Alarm is ON), the corresponding card visually changes (e.g., to a red/active state).
| **Deactivation Prompt** | A full-screen overlay that appears when an alarm is triggered, requiring the user to enter a specific code/pattern to silence the alarm. **(Crucial anti-theft step)**. 
| **Settings/About Screen** | Accessible via the sliding menu, this section allows users to manage app settings, view an 'About' page, or get help. 

## 📱 Screenshots

<img width="864" height="2016" alt="1" src="https://github.com/user-attachments/assets/b64083bc-48af-433d-854a-77940c621d1f" />
<img width="864" height="2016" alt="2" src="https://github.com/user-attachments/assets/fbd7103a-94a3-4eef-bb96-9e100a75620c" />
<img width="864" height="2016" alt="3" src="https://github.com/user-attachments/assets/5d45ecc3-34d8-4b21-a7e7-ebb865bbedf5" />
<img width="864" height="2016" alt="4" src="https://github.com/user-attachments/assets/f6de075e-e444-4399-9bf4-ad3bc4c2db3c" />
<img width="864" height="2016" alt="5" src="https://github.com/user-attachments/assets/ae0f4a80-d497-4da6-b1ba-a8d164d77576" />
<img width="864" height="2016" alt="6" src="https://github.com/user-attachments/assets/087fce69-e97a-48ad-a4ab-06e4414f7df2" />
<img width="864" height="2016" alt="7" src="https://github.com/user-attachments/assets/0aee97e4-edc1-4278-8ced-06b3ae538d62" />
<img width="864" height="2016" alt="8" src="https://github.com/user-attachments/assets/40f78851-258c-455b-9efd-69f7bb8e4d78" />
<img width="864" height="2016" alt="9" src="https://github.com/user-attachments/assets/4f5ccb02-5db9-43e3-a0c0-ca6cf7464131" />
<img width="864" height="2016" alt="10" src="https://github.com/user-attachments/assets/892b32c5-8560-46fb-8d95-c6c03811aaea" />
<img width="864" height="2016" alt="11" src="https://github.com/user-attachments/assets/08ba5b85-1ea0-428f-b8c5-62163906f7c0" />
<img width="864" height="2016" alt="12" src="https://github.com/user-attachments/assets/1ab0b3f4-1cf1-49e8-93ac-6ba810b59aa2" />
<img width="864" height="2016" alt="13" src="https://github.com/user-attachments/assets/adc804c2-1f98-406f-9431-81d20a57ad2e" />


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
    git clone [your_repo_url] keep-it-app-main
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

\[Insert your project's license here, e.g., MIT License]
