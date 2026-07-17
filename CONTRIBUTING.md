# Contributing to Storii

Thanks for your interest.

## Reporting Issues

You do **not** need to write code to contribute. If you spot any text errors (typos, grammar, or unclear wording) or any bugs, please [open an issue](https://github.com/likhithpraveenk/storii/issues/new?template=bug_report.md).

## Requirements

- Flutter SDK (stable)
- Access to an Audiobookshelf server for testing

## Setup

1. **[Fork the repo](https://github.com/likhithpraveenk/storii/fork)**

2. **Clone the forked repository**

```bash
git clone https://github.com/YOUR_USERNAME/storii.git
cd storii
flutter pub get
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
