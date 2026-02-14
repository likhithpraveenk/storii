import 'dart:io';

import 'package:flutter/painting.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/image_cache.dart';

part 'cache_notifier.g.dart';

@riverpod
class CacheSize extends _$CacheSize {
  static const _cacheKey = 'libCachedImageData';

  @override
  Future<String> build() async {
    return _calculateSize();
  }

  Future<String> _calculateSize() async {
    double totalSize = 0;
    try {
      final tempDir = await getTemporaryDirectory();
      final cachePath = p.join(tempDir.path, _cacheKey);
      final cacheDir = Directory(cachePath);

      if (await cacheDir.exists()) {
        final files = cacheDir.listSync(recursive: true);
        for (final file in files) {
          if (file is File) {
            totalSize += file.lengthSync();
          }
        }
      }
    } catch (e) {
      return '0.00 MB';
    }
    return '${(totalSize / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  Future<void> clearCache() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await imageCacheManager.emptyCache();
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
      return _calculateSize();
    });
  }
}
