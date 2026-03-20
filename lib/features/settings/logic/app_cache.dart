import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:storii/storage/hive/boxes.dart';

class NetworkCache {
  NetworkCache._();

  static final NetworkCache instance = NetworkCache._();

  Future<int> sizeInBytes() async {
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(base.path, networkCacheDir));

    if (!await dir.exists()) return 0;

    int total = 0;
    await for (final f in dir.list(recursive: true)) {
      if (f is File) total += await f.length();
    }

    return total;
  }

  Future<void> clear() async {
    await networkCacheStore.clean();
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(base.path, networkCacheDir));
    if (await dir.exists()) await dir.delete(recursive: true);
  }
}

class AppImageCacheManager extends CacheManager with ImageCacheManager {
  static const _key = 'appImageCache';

  static final AppImageCacheManager instance = AppImageCacheManager._();

  AppImageCacheManager._()
    : super(
        Config(
          _key,
          stalePeriod: const Duration(days: 30),
          maxNrOfCacheObjects: 5000,
          fileService: HttpFileService(),
        ),
      );

  Future<void> clear() async {
    await emptyCache();
    final dir = Directory(p.join((await getTemporaryDirectory()).path, _key));
    if (await dir.exists()) await dir.delete(recursive: true);
  }

  Future<int> sizeInBytes() async {
    final dir = Directory(p.join((await getTemporaryDirectory()).path, _key));

    if (!await dir.exists()) return 0;

    int total = 0;
    await for (final f in dir.list(recursive: true)) {
      if (f is File) total += await f.length();
    }
    return total;
  }
}
