import 'dart:math' as math;
import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/features/settings/logic/app_cache.dart';

part 'dominant_color.g.dart';

@riverpod
/// getting dominant [Color] of an image via histogram/bucketing approach
Future<Color?> dominantColor(Ref ref, String coverUrl) async {
  final file = await AppImageCacheManager.instance.getSingleFile(coverUrl);
  final bytes = await file.readAsBytes();
  final codec = await instantiateImageCodec(bytes, targetWidth: 100);
  final frame = await codec.getNextFrame();
  final image = frame.image;

  final byteData = await image.toByteData(format: .rawRgba);
  if (byteData == null) return null;

  final pixels = byteData.buffer.asUint8List();

  const bucketSize = 16;
  final buckets = <int, _ColorBucket>{};

  for (int i = 0; i < pixels.length; i += 4) {
    final a = pixels[i + 3];
    if (a < 125) continue;

    final r = pixels[i];
    final g = pixels[i + 1];
    final b = pixels[i + 2];

    final maxC = math.max(r, math.max(g, b));
    final minC = math.min(r, math.min(g, b));
    final lightness = (maxC + minC) / 2 / 255;
    final saturation = maxC == minC
        ? 0.0
        : (maxC - minC) / (255 - (2 * lightness * 255 - 255).abs());
    if (lightness > 0.95 || lightness < 0.05) continue;
    if (saturation < 0.15 && (lightness > 0.9 || lightness < 0.1)) continue;

    final key =
        ((r ~/ bucketSize) << 16) |
        ((g ~/ bucketSize) << 8) |
        (b ~/ bucketSize);

    final bucket = buckets.putIfAbsent(key, _ColorBucket.new);
    bucket.r += r;
    bucket.g += g;
    bucket.b += b;
    bucket.count++;
  }

  if (buckets.isEmpty) return null;

  final dominant = buckets.values.reduce((a, b) => a.count > b.count ? a : b);
  return Color.fromARGB(
    255,
    dominant.r ~/ dominant.count,
    dominant.g ~/ dominant.count,
    dominant.b ~/ dominant.count,
  );
}

class _ColorBucket {
  int r = 0, g = 0, b = 0, count = 0;
}
