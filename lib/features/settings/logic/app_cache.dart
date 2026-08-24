import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:storii/storage/hive/boxes.dart';

class NetworkCache {
  new _();

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

class AppImageCacheManager extends DefaultCacheManager {
  static const _key = 'cached_network_image_ce';

  static final AppImageCacheManager instance = AppImageCacheManager._();

  new _() : super(maxNrOfCacheObjects: 5000);

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

  Future<Uint8List?> getCachedBytes(String url) async {
    await for (final response in getFileStream(url)) {
      if (response is FileInfo) {
        return response.file.readAsBytes();
      }
    }

    return null;
  }
}
