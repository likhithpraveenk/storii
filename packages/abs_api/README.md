# ABS API

A lightweight, type-safe dart API client for Audiobookshelf

## Features

- **Dio**: Networking with `QueuedInterceptors` for automated token management
- **Type-Safe Models**: Immutable data structures using `Freezed` and custom JSON converters
- **Modular API**: Clean separation of concerns for `Auth`, `Library`, `Author`, `Items`, and `Sessions`
- **Socket Support**: Real-time event handling via `SocketApi`
- **Error Handling**: Unified `ApiException` system for clear failure reporting

## Quick Start

```dart
final api = ApiClient(
  baseUrl: Uri.parse('https://your-server.com'),
  getAccessToken: () => storage.read('token'),
  getRefreshToken: () => storage.read('refresh'),
  onTokensUpdated: (access, refresh) => storage.save(access, refresh),
);

// Access specific endpoints
final libraryApi = LibraryApi(api);
final libraries = await libraryApi.getAll();
```

## Code gen

```bash
dart run build_runner build -d
```

## Acknowledgements

Adapted and extended from the original [audiobookshelf_api](https://github.com/audiobookshelf-flutter/audiobookshelf_api), which provided the initial API structure.
Extended by migrating from http to Dio, adding interceptors and improved error handling.
Full credit to the original contributors for the foundation.

## License

[GPL-3.0 License](LICENSE.txt)
