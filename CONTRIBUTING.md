# Contributing to Storii

Thanks for your interest.

## Reporting Issues

You do **not** need to write code to contribute. If you spot any text errors (typos, grammar, or unclear wording) or any bugs, please [open an issue](https://github.com/likhithpraveenk/storii/issues/new?template=bug_report.md).

## Requirements

- Flutter SDK (pinned version in [pubspec.yaml](pubspec.yaml))
  > you can use `fvm` to manage versions
- An Audiobookshelf server for testing
- Android emulator or a real device (Android 7-17 supported)

## Setup

1. **[Fork the repo](https://github.com/likhithpraveenk/storii/fork)**

2. **Clone the forked repository**

```bash
git clone https://github.com/YOUR_USERNAME/storii.git
cd storii
(cd packages/abs_api && dart pub get && dart run build_runner build)
flutter pub get
dart run build_runner build
```

## Running the app

```bash
flutter run
```

For a release build

```bash
flutter build apk --split-per-abi
flutter install
```

## Code Generation

Code generation only runs for files in these locations:

- **Models:** `lib/**/models/` or `lib/features/**/models/`
- **Riverpod Providers:** `lib/app/providers/` or `lib/features/**/logic/`
- **Settings:** add parameters in `app_settings.dart` or `user_settings.dart`

Refer to [build.yml](build.yaml) for the exact configuration.

### To run code gen

```bash
dart run build_runner build
# or
dart run build_runner watch
```

### Before Committing

```bash
dart format .
dart fix --apply
flutter analyze
flutter test
```
