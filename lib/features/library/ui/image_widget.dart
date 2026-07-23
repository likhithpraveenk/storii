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

class ImageWidget extends ConsumerStatefulWidget {
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
  ConsumerState<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends ConsumerState<ImageWidget> {
  Future<String?>? _localPathFuture;
  String? _lastDownloadId;

  @override
  void initState() {
    super.initState();
    _initLocalPathCheck();
  }

  @override
  void didUpdateWidget(covariant ImageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.id != widget.id) {
      _initLocalPathCheck();
    }
  }

  void _initLocalPathCheck() {
    final download = ref.read(downloadItemProvider(widget.id));
    if (download != null) {
      _lastDownloadId = download.libraryItemId;
      final helper = ref.read(downloadsFsHelperProvider);

      _localPathFuture = download.mediaType == .podcast
          ? helper.podcastCoverPathIfExists(download.libraryItemId)
          : helper.audiobookCoverPathIfExists(download.libraryItemId);
    } else {
      _localPathFuture = null;
      _lastDownloadId = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final download = ref.watch(downloadItemProvider(widget.id));
    final coverUrl = ref.watch(
      coverUrlProvider(
        widget.id,
        type: widget.type,
        updatedAt: widget.updatedAt,
        width: 600,
        raw: widget.isRaw,
      ),
    );

    if (download?.libraryItemId != _lastDownloadId) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(_initLocalPathCheck);
      });
    }

    if (download != null && _localPathFuture != null) {
      return FutureBuilder<String?>(
        future: _localPathFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Image.file(
              File(snapshot.data!),
              fit: .cover,
              errorBuilder: (context, _, _) => _buildNetworkImage(coverUrl),
            );
          }
          return _buildNetworkImage(coverUrl);
        },
      );
    }

    return _buildNetworkImage(coverUrl);
  }

  Widget _buildNetworkImage(String? coverUrl) {
    if (coverUrl == null) return PlaceholderImage(label: l10n.noImage);

    return CachedNetworkImage(
      cacheManager: AppImageCacheManager.instance,
      imageUrl: coverUrl,
      fit: .cover,
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
