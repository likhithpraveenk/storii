import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/image_cache.dart';
import 'package:storii/features/library/logic/cover_url_provider.dart';
import 'package:storii/features/library/ui/placeholder_image.dart';
import 'package:storii/l10n/l10n.dart';

class ImageWidget extends ConsumerWidget {
  const ImageWidget({
    super.key,
    required this.id,
    required this.type,
    this.updatedAt,
  });

  final String id;
  final CoverType type;
  final DateTime? updatedAt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context)!;
    final coverUrl = ref.watch(
      coverUrlProvider(id, type: type, updatedAt: updatedAt, width: 600),
    );
    if (coverUrl == null) {
      return PlaceholderImage(label: l.noImage);
    }
    return CachedNetworkImage(
      cacheManager: imageCacheManager,
      imageUrl: coverUrl,
      fit: .cover,
      placeholder: (_, _) => const PlaceholderImage(),
      errorWidget: (context, url, error) {
        if (kDebugMode) {
          debugPrint('CachedNetworkImage: $error');
        }
        if (error.toString().contains('404')) {
          return PlaceholderImage(label: l.noImage);
        }
        return PlaceholderImage(label: l.errorImage);
      },
    );
  }
}
