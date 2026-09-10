import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/models/storage_location.dart';

part 'cover_helper.g.dart';

@Riverpod(keepAlive: true)
CoverHelper coverHelper(Ref ref) => const CoverHelper();

class CoverHelper {
  const new();

  Future<String> _coverFolder(
    String libraryItemId, {
    required bool isPodcast,
  }) async {
    final base = await getApplicationDocumentsDirectory();
    final location = isPodcast
        ? defaultInternalPodcasts
        : defaultInternalAudiobooks;
    return p.join(base.path, location.uri, libraryItemId);
  }

  Future<String?> coverPathIfExists(
    String libraryItemId, {
    required bool isPodcast,
  }) async {
    final folder = await _coverFolder(libraryItemId, isPodcast: isPodcast);
    final path = p.join(folder, coverName);

    final exists = await File(path).exists();
    return exists ? path : null;
  }

  Future<void> saveCover(
    String libraryItemId, {
    required List<int> data,
    required bool isPodcast,
  }) async {
    final folder = await _coverFolder(libraryItemId, isPodcast: isPodcast);
    await Directory(folder).create(recursive: true);

    final path = p.join(folder, coverName);
    await File(path).writeAsBytes(data);
  }
}
