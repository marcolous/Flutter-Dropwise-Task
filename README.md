# 🗺️ Farm Map App

A Flutter application that displays a map with farm locations across Tunisia using Google Maps, GetX state management, and custom markers.

## 📱 Features

- 🧭 Interactive Google Map
- 📍 Custom farm markers with icon
- ➕➖ Zoom controls
- 📌 Show farm info (governorate & delegation)

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_maps_flutter: ^2.5.0
  get: ^4.6.5
```

## 🗂️ Project Structure

```
lib/
├── controllers/
│   └── farm_controller.dart     # GetX controller for map & markers
├── models/
│   └── farm_model.dart          # Data model for farm
├── views/
│   └── farm_map_page.dart       # UI and Google Map widget
└── main.dart
assets/
└── farmer.png               # Custom marker icon
```

## 🛠 Setup Instructions

1. Clone this repo:
   ```bash
   git clone https://github.com/marcolous/Flutter-Dropwise-Task.git
   cd farm-map-app
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Add Google Maps API Key:
   - For **Android**: add key to `android/app/src/main/AndroidManifest.xml`

4. Run the app:
   ```bash
   flutter run
   ```

## 📃 License

MIT License. Free for personal and commercial use.

---

Built with ❤️ using Flutter & GetX