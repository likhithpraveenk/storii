import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:intl/intl.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/storage/hive/boxes.dart';

class BackupService {
  static const _format = 'storii-backup';
  static const _version = 1;

  static final List<Box> _boxes = [
    usersBox,
    serversBox,
    appSettingsBox,
    userSettingsBox,
    speedsBox,
    playbackHistoryBox,
  ];

  static dynamic _withoutCurrentUser(dynamic value) {
    if (value is! String) return value;
    try {
      final decoded = (jsonDecode(value) as Map).cast<String, dynamic>();
      decoded['currentUser'] = null;
      return jsonEncode(decoded);
    } catch (_) {
      return value;
    }
  }

  static dynamic _encodeValue(String box, dynamic value) => switch (box) {
    usersBoxName => (value as UserDomain).toJson(),
    serversBoxName => (value as Server).toJson(),
    appSettingsBoxName => _withoutCurrentUser(value),
    speedsBoxName => (value as num).toDouble(),
    _ => value,
  };

  static dynamic _decodeValue(String box, dynamic json) => switch (box) {
    usersBoxName => UserDomain.fromJson(Map<String, dynamic>.from(json)),
    serversBoxName => Server.fromJson(Map<String, dynamic>.from(json)),
    appSettingsBoxName => _withoutCurrentUser(json),
    speedsBoxName => (json as num).toDouble(),
    _ => json,
  };

  static Future<String?> createBackup() async {
    final data = <String, dynamic>{};

    for (final box in _boxes) {
      final entries = <String, dynamic>{};
      for (final key in box.keys) {
        final value = box.get(key);
        if (value != null) {
          entries[key.toString()] = _encodeValue(box.name, value);
        }
      }
      data[box.name] = entries;
    }

    final backup = {
      'format': _format,
      'version': _version,
      'createdAt': DateTime.now().toIso8601String(),
      'data': data,
    };

    final bytes = Uint8List.fromList(utf8.encode(jsonEncode(backup)));
    final stamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());

    return FilePicker.saveFile(
      dialogTitle: 'Save backup',
      fileName: '$_format-$stamp.json',
      bytes: bytes,
      type: .custom,
      allowedExtensions: ['json'],
    );
  }

  static Future<Uint8List> readBackupFile(PlatformFile file) async {
    final chunks = await file.readAsByteStream().toList();
    return Uint8List.fromList(chunks.expand((c) => c).toList());
  }

  static Future<void> restoreBackup(Uint8List bytes) async {
    final decoded = jsonDecode(utf8.decode(bytes));
    if (decoded is! Map || decoded['format'] != _format) {
      throw const FormatException('Unrecognized backup file');
    }

    final data = (decoded['data'] as Map).cast<String, dynamic>();

    for (final box in _boxes) {
      await box.clear();
      final boxData = data[box.name];
      if (boxData is! Map) continue;

      for (final entry in boxData.cast<String, dynamic>().entries) {
        await box.put(entry.key, _decodeValue(box.name, entry.value));
      }
    }
  }
}
