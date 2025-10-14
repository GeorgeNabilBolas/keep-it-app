# Keep It

A Flutter application designed to manage persistent tasks, permissions, and foreground services. It appears to focus on keeping the app active in the background (e.g., for notifications, battery optimization, and overlays), with features like an introduction slider, home screen for permission management, and alert functionality. Built with Flutter Bloc for state management and supports multiple platforms including Android, iOS, web, Windows, macOS, and Linux.

## Features

- **Splash Screen**: Initial loading screen with animated title and subtitle.
- **Introduction Slider**: Onboarding screens with SVG illustrations, titles, subtitles, and navigation buttons (Next, Skip, Go).
- **Home Page**: 
  - Bottom navigation bar for switching features.
  - Permission management for notifications, battery optimizations, and draw overlays.
  - Dialogs and list tiles for user interactions (e.g., feature selection, permissions setup).
- **Alert Page**: Dedicated screen for alerts or notifications.
- **Foreground Task Support**: Integration with `flutter_foreground_task` for running tasks in the background.
- **Permissions Handling**: Uses `permission_handler` for requesting and managing system permissions.
- **Custom UI**: 
  - SVG images for icons and illustrations.
  - Custom fonts (IntroRust family).
  - Themed colors, paddings, radii, and text styles.
- **State Management**: Powered by Flutter Bloc with cubits for navigation, permissions, and features.
- **Multi-Platform**: Configured for Android, iOS, web, Windows, macOS, and Linux with platform-specific setups (e.g., launch icons, splash screens).

## Screenshots

*(Add screenshots here if available. For example:)*
- Splash Screen: ![Splash](path/to/splash.png)
- Introduction Slider: ![Intro](path/to/intro.png)
- Home Page: ![Home](path/to/home.png)
- Permissions Dialog: ![Permissions](path/to/permissions.png)

## Getting Started

### Prerequisites

- Flutter SDK (version 3.0.3 or higher): [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK (included with Flutter)
- Android Studio / Xcode for platform-specific builds (optional for emulators/simulators)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/GeorgeNabilBolas/keep-it-app.git
   cd keep-it-app
   ```

2. Install dependencies:
   ```
   flutter pub get
   ```

3. Generate launcher icons and splash screens (if needed):
   ```
   flutter pub run flutter_launcher_icons:main
   flutter pub run flutter_native_splash:create
   ```

4. Run the app:
   - On Android/iOS emulator: `flutter run`
   - On web: `flutter run -d chrome`
   - On desktop (Windows/macOS/Linux): `flutter run -d windows` (or respective platform)

### Building for Release

- Android: `flutter build apk --release`
- iOS: `flutter build ios --release`
- Web: `flutter build web`
- Windows: `flutter build windows`
- macOS: `flutter build macos`
- Linux: `flutter build linux`

## Usage

1. Launch the app to see the splash screen.
2. Navigate through the introduction slides.
3. On the home page, grant necessary permissions (notifications, battery optimization, overlays) via dialogs.
4. Use the bottom navigation to switch between features.
5. The app may run a foreground service to "keep" tasks active (e.g., persistent notifications).

Note: On Android, ensure permissions like `FOREGROUND_SERVICE`, `SYSTEM_ALERT_WINDOW`, and `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` are granted.

## Dependencies

- `app_settings: ^5.0.0` - For opening system settings.
- `battery_plus: ^4.0.2` - Battery information and optimizations.
- `flutter_bloc: ^8.1.3` - State management.
- `flutter_foreground_task: ^6.0.0+1` - Foreground services.
- `flutter_native_splash: ^2.3.2` - Custom splash screens.
- `flutter_svg: ^2.0.7` - SVG rendering.
- `permission_handler: ^10.4.3` - Permission requests.
- `shared_preferences: ^2.2.0` - Local storage.
- Dev: `flutter_launcher_icons`, `flutter_lints`, `flutter_test`.

For full details, see [pubspec.yaml](pubspec.yaml).

## Project Structure

- `lib/core/`: Utility classes (e.g., colors, styles, widgets like typewriter animated text).
- `lib/features/`: Feature modules (alert, home, introduction, splash).
- `assets/`: Fonts, images (SVGs for home, intro), icons.
- Platform-specific folders: `android/`, `ios/`, `web/`, `windows/`, etc., with configs for icons, manifests, and entitlements.

## Contributing

Contributions are welcome! Please fork the repo and submit a pull request.

1. Fork the project.
2. Create a feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details (if available; otherwise, assume open-source under MIT).

## Acknowledgments

- Built with [Flutter](https://flutter.dev/).
- Icons and SVGs from custom assets.
- Inspired by standard Flutter templates with foreground task examples.

For help getting started with Flutter, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.
