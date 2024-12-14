# Rive Animation Flutter App

This Flutter app demonstrates how to integrate Rive animations with simple control mechanisms.

## Overview

- **What is Rive?**  
  Rive is a tool for creating real-time animations that can be used in apps, games, and more. Learn more at [rive.app](https://rive.app).

- **Purpose of this App:**  
  Display a spinning gears animation with controls to toggle between animations and play/pause.

## Setup Instructions

1. **Download the Animation Asset:**  
   Download the `.riv` file used in this app from [Spinning Gears Animation](https://rive.app/community/files/2359-4685-spinning-gears/).  
   Place it in the `assets/` folder of the project.

2. **Configure Assets in `pubspec.yaml`:**  
   Add the following to your `pubspec.yaml` file:
   ```yaml
   flutter:
     assets:
       - assets/animgears.riv
   ```

3. **Install Dependencies:**  
   Run the following command to install the Rive package:
   ```sh
   flutter pub get
   ```

4. **Run the App:**  
   Launch the app with:
   ```sh
   flutter run
   ```

## Controls

- **Floating Action Button:** Pause or play the animation.
- **Tap on Animation:** Toggle between two gear animations.

## Dependencies

- Flutter SDK  
- [Rive Package](https://pub.dev/packages/rive)

Enjoy creating dynamic and interactive animations! 🎨✨
