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

  Future<void> clearCache() async {
    await AppImageCacheManager.instance.clear();
    await NetworkCache.instance.clear();
    ref.invalidateSelf();
  }
}
