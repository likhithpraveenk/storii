import 'package:flutter_cache_manager/flutter_cache_manager.dart';

final imageCacheManager = CacheManager(
  Config(
    'libCachedImageData',
    stalePeriod: const Duration(days: 7),
    maxNrOfCacheObjects: 5000,
  ),
);
