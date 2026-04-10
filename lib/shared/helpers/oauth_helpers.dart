import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

/// Generates a random code verifier
String generateRandom({int length = 43}) {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';
  final rand = Random.secure();
  return String.fromCharCodes(
    List.generate(length, (_) => chars.codeUnitAt(rand.nextInt(chars.length))),
  );
}

/// Generates S256 code challenge from a verifier
String generateCodeChallenge(String verifier) {
  final bytes = utf8.encode(verifier);
  final digest = sha256.convert(bytes);
  return base64Url.encode(digest.bytes).replaceAll('=', '');
}
