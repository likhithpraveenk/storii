import 'package:drift/isolate.dart';
import 'package:storii/storage/secure_storage/token_storage.dart';

class SyncConfig {
  final String userId;
  final TokenStorage tokenStorage;
  final String libraryId;
  final Uri serverUrl;
  final DriftIsolate driftIsolate;

  SyncConfig({
    required this.userId,
    required this.tokenStorage,
    required this.libraryId,
    required this.serverUrl,
    required this.driftIsolate,
  });
}
