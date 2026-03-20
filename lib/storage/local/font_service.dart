import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:ttf_metadata/ttf_metadata.dart';

class FontService {
  static const _folderName = 'fonts';

  static Future<Directory> _getFontsDirectory() async {
    final baseDir = await getApplicationDocumentsDirectory();
    final fontsDir = Directory(p.join(baseDir.path, _folderName));

    if (!await fontsDir.exists()) {
      await fontsDir.create(recursive: true);
    }
    return fontsDir;
  }

  static Future<void> importFonts() async {
    final result = await FilePicker.platform.pickFiles(
      type: .custom,
      allowedExtensions: ['ttf', 'otf'],
      allowMultiple: true,
    );

    if (result == null || result.files.isEmpty) return;

    final fontsDir = await _getFontsDirectory();
    final existing = await _listFontFiles();
    final existingNames = existing.map((f) => _fontFamily(f.path)).toSet();
    existingNames.add('AtkinsonHyperlegibleNext');

    for (final picked in result.files) {
      if (picked.path == null) continue;

      final source = File(picked.path!);
      final fontName = _fontFamily(source.path);

      if (existingNames.contains(fontName)) continue;

      final ext = p.extension(source.path);
      final target = File(p.join(fontsDir.path, '$fontName$ext'));
      await source.copy(target.path);
      existingNames.add(fontName);
    }

    await loadFonts();
  }

  static Future<List<File>> _listFontFiles() async {
    final dir = await _getFontsDirectory();

    final files = <File>[];

    await for (final entity in dir.list()) {
      if (entity is File) {
        final path = entity.path.toLowerCase();
        if (path.endsWith('.ttf') || path.endsWith('.otf')) {
          files.add(entity);
        }
      }
    }

    return files;
  }

  static Future<Map<String, List<File>>> groupByFamily() async {
    final fontFiles = await _listFontFiles();
    final families = <String, List<File>>{};

    for (final file in fontFiles) {
      final familyName = _fontFamily(file.path);

      families.putIfAbsent(familyName, () => []).add(file);
    }

    return families;
  }

  static Future<void> loadFonts() async {
    final families = await groupByFamily();

    await Future.wait(
      families.entries.map((entry) async {
        try {
          final loader = FontLoader(entry.key);

          for (final file in entry.value) {
            loader.addFont(
              file.readAsBytes().then((b) => ByteData.view(b.buffer)),
            );
          }

          await loader.load();
        } catch (e, st) {
          LogService.log(
            'Failed to load font: ${entry.key}: $e',
            source: 'FontService',
            stackTrace: st,
          );
        }
      }),
    );
  }

  static Future<void> clearFonts() async {
    final fontsDir = await _getFontsDirectory();
    await fontsDir.delete(recursive: true);
    await fontsDir.create();
  }
}

String _fontFamily(String path) {
  String fontName;
  try {
    final font = TtfMetadata(TtfFileSource(path: path));
    final name = font.fontName;

    if (name.isEmpty) {
      throw Exception('Empty font name');
    }

    fontName = name;
  } catch (_) {
    fontName = p.basenameWithoutExtension(path);
  }
  return fontName.split('-').first;
}
