import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/storage/secure_storage/token_storage.dart';

part 'token_provider.g.dart';

@Riverpod(keepAlive: true)
TokenStorage token(Ref ref) {
  const storage = FlutterSecureStorage();

  return TokenStorage(storage);
}
