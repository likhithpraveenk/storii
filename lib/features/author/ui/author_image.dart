import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/config/app_styles.dart';
import 'package:storii/app/config/image_cache.dart';
import 'package:storii/app/models/author.dart';
import 'package:storii/features/library/logic/cover_url_provider.dart';
import 'package:storii/features/library/ui/placeholder_image.dart';
import 'package:storii/l10n/l10n.dart';

class AuthorImage extends ConsumerWidget {
  const AuthorImage(this.author, {super.key});
  final Author author;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coverUrl = ref.read(
      coverUrlProvider(
        author.id,
        type: .author,
        updatedAt: author.updatedAt,
        raw: true,
      ),
    );
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l = AppLocalizations.of(context)!;
    final size = MediaQuery.sizeOf(context);

    return Column(
      mainAxisAlignment: .end,
      children: [
        SizedBox(
          width: (size.width * 0.7).clamp(0.0, 300),
          child: AspectRatio(
            aspectRatio: 4 / 5,
            child: ClipRRect(
              borderRadius: AppStyles.circularRadius,
              child: coverUrl == null
                  ? PlaceholderImage(label: l.noImage)
                  : CachedNetworkImage(
                      cacheManager: imageCacheManager,
                      imageUrl: coverUrl,
                      fit: BoxFit.fitHeight,
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
                    ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: size.height * 0.1),
          child: SingleChildScrollView(
            child: Text(
              author.name,
              style: textTheme.titleLarge?.copyWith(
                shadows: [
                  Shadow(
                    color: scheme.onSurfaceVariant.withValues(alpha: 0.25),
                    blurRadius: 4,
                  ),
                ],
              ),
              textAlign: .center,
            ),
          ),
        ),
      ],
    );
  }
}
