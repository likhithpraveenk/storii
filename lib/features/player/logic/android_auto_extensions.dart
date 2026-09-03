import 'dart:convert';

import 'package:abs_api/abs_api.dart';
import 'package:audio_service/audio_service.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

const _coversAuthoritySuffix = '.covers';
String? _cachedCoversAuthority;
Future<String> _coversAuthority() async {
  if (_cachedCoversAuthority != null) return _cachedCoversAuthority!;
  final info = await PackageInfo.fromPlatform();
  _cachedCoversAuthority = '${info.packageName}$_coversAuthoritySuffix';
  return _cachedCoversAuthority!;
}

Future<Uri> wrapContentUri(Uri url) async {
  final encoded = base64Url
      .encode(utf8.encode(url.toString()))
      .replaceAll('=', '');
  return Uri.parse('content://${await _coversAuthority()}/$encoded');
}

extension LibraryItemAndroidAutoX on LibraryItem {
  Future<MediaItem> toAndroidAutoMediaItem({
    required Uri? serverUrl,
    required DownloadsFilesystemHelper fsHelper,
  }) async {
    final Uri? artUri;
    if (serverUrl != null) {
      artUri = await wrapContentUri(serverUrl.resolve(ApiRoutes.itemCover(id)));
    } else {
      final coverPath = isBook
          ? await fsHelper.audiobookCoverPathIfExists(id)
          : await fsHelper.podcastCoverPathIfExists(id);
      artUri = coverPath != null
          ? await wrapContentUri(Uri.file(coverPath))
          : null;
    }

    return MediaItem(
      id: 'item:$id',
      title: title ?? l10n.noTitle,
      artist: authorName ?? l10n.noAuthor,
      playable: isBook,
      artUri: artUri,
      duration: duration,
    );
  }
}

extension LibraryItemsShelfAndroidAutoX on LibraryItemsShelf {
  MediaItem toAndroidAutoMediaItem() {
    return MediaItem(id: 'shelf:$id', title: label, playable: false);
  }
}

extension PodcastEpisodeAndroidAutoX on PodcastEpisode {
  Future<MediaItem> toAndroidAutoMediaItem({
    required String itemId,
    String? podcastTitle,
    Uri? serverUrl,
    required DownloadsFilesystemHelper helper,
  }) async {
    final Uri? coverUri;
    if (serverUrl != null) {
      coverUri = await wrapContentUri(
        serverUrl.resolve(ApiRoutes.itemCover(itemId)),
      );
    } else {
      final coverPath = await helper.podcastCoverPathIfExists(itemId);
      coverUri = coverPath != null
          ? await wrapContentUri(Uri.file(coverPath))
          : null;
    }

    return MediaItem(
      id: 'episode:$itemId:$id',
      title: title ?? l10n.noTitle,
      artist: podcastTitle,
      artUri: coverUri,
      duration: duration ?? Duration.zero,
    );
  }
}
