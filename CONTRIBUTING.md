# Contributing to Storii

Thanks for your interest.

## Requirements

- Flutter SDK (stable)
- Access to an Audiobookshelf server for testing

## Setup

1. **[Fork the repo](https://github.com/likhithpraveenk/storii/fork)**

2. **Clone the forked repository**

```bash
git clone https://github.com/[YOUR_USERNAME]/storii.git
cd storii
flutter pub get
```

## Code Generation

Code generation only runs for files in these locations:

- **Models:** `lib/**/models/`
- **Drift:** `lib/storage/drift/`
- **Riverpod Providers:** `lib/app/providers/` or `lib/features/**/logic/`
- **Settings:** update the relevant class in `settings_provider.dart`

Refer to [build.yml](build.yaml) for the exact configuration.

### To run code gen

```bash
dart run build_runner build -d
# or
dart run build_runner watch -d
```

### Before Committing

```bash
dart format .
dart fix --apply
```

- All lint errors and warnings must be fixed
- Lint infos are allowed only for TODOs
