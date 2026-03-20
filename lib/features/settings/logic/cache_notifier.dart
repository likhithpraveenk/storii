import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/settings/logic/app_cache.dart';

part 'cache_notifier.g.dart';

@riverpod
class CacheSize extends _$CacheSize {
  @override
  Future<int> build() async {
    final results = await Future.wait([
      AppImageCacheManager.instance.sizeInBytes(),
      NetworkCache.instance.sizeInBytes(),
    ]);
    return results[0] + results[1];
  }

  // Future<void> debugAllCacheDirs() async {
  //   final temp = await getTemporaryDirectory();
  //   final docs = await getApplicationDocumentsDirectory();

  //   for (final base in [temp, docs]) {
  //     final dir = Directory(base.path);
  //     await for (final f in dir.list(recursive: true)) {
  //       if (f is File) {q
  //         final size = await (f).length();
  //         log('${f.path} — ${formatBytes(size)}');
  //       }
  //     }
  //   }
  // }

  Future<void> clearCache() async {
    await AppImageCacheManager.instance.clear();
    await NetworkCache.instance.clear();
    ref.invalidateSelf();
  }
}
