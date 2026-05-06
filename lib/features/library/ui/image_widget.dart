import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/logic/downloads_provider.dart';
import 'package:storii/features/library/logic/cover_url_provider.dart';
import 'package:storii/features/settings/logic/app_cache.dart';
import 'package:storii/shared/widgets/placeholder_image.dart';

class ImageWidget extends ConsumerWidget {
  const ImageWidget({
    super.key,
    required this.id,
    required this.type,
    this.updatedAt,
    this.isRaw = false,
  });

  final String id;
  final CoverType type;
  final DateTime? updatedAt;
  final bool isRaw;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final download = ref.watch(downloadItemProvider(id));
    if (download != null) {
      return FutureBuilder<String?>(
        future: ref
            .read(downloadsFsHelperProvider)
            .coverPathIfExists(download.title),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Image.file(
              File(snapshot.data!),
              fit: BoxFit.cover,
              errorBuilder: (context, _, _) => _buildNetworkImage(context, ref),
            );
          }
          return _buildNetworkImage(context, ref);
        },
      );
    }

    return _buildNetworkImage(context, ref);
  }

  Widget _buildNetworkImage(BuildContext context, WidgetRef ref) {
    final coverUrl = ref.watch(
      coverUrlProvider(
        id,
        type: type,
        updatedAt: updatedAt,
        width: 600,
        raw: isRaw,
      ),
    );
    if (coverUrl == null) return PlaceholderImage(label: l10n.noImage);

    return CachedNetworkImage(
      cacheManager: AppImageCacheManager.instance,
      imageUrl: coverUrl,
      fit: BoxFit.cover,
      placeholder: (_, _) => const PlaceholderImage(),
      errorWidget: (context, url, error) {
        final error404 = error.toString().contains('404');
        if (!error404) {
          log('$error', name: 'CachedNetworkImage');
        }
        return PlaceholderImage(
          label: error404 ? l10n.noImage : l10n.errorImage,
        );
      },
    );
  }
}
