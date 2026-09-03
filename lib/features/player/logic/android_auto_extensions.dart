import 'dart:convert';

import 'package:abs_api/abs_api.dart';
import 'package:audio_service/audio_service.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

const _playbackStatusKey = 'android.media.extra.PLAYBACK_STATUS';
const _completionPercentageKey =
    'androidx.media.MediaItem.Extras.COMPLETION_PERCENTAGE';
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

Map<String, dynamic> _styleExtras({required bool playable}) => {
  if (playable)
    AndroidContentStyle.playableHintKey: AndroidContentStyle.gridItemHintValue
  else
    AndroidContentStyle.browsableHintKey: AndroidContentStyle.listItemHintValue,
};

Map<String, dynamic> _completionExtras(MediaProgress? progress) {
  final status = switch (progress) {
    null => 0,
    _ when progress.isFinished == true => 2,
    _ when (progress.progress ?? 0) > 0 => 1,
    _ => 0,
  };
  return {
    _playbackStatusKey: status,
    _completionPercentageKey: progress?.progress ?? 0.0,
  };
}

extension LibraryItemAndroidAutoX on LibraryItem {
  Future<MediaItem> toAndroidAutoMediaItem({
    required Uri? serverUrl,
    required DownloadsFilesystemHelper fsHelper,
    MediaProgress? progress,
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
      extras: {
        ..._styleExtras(playable: isBook),
        ..._completionExtras(progress),
      },
    );
  }
}

extension LibraryItemsShelfAndroidAutoX on LibraryItemsShelf {
  MediaItem toAndroidAutoMediaItem() {
    return MediaItem(
      id: 'shelf:$id',
      title: label,
      playable: false,
      extras: _styleExtras(playable: false),
    );
  }
}

extension PodcastEpisodeAndroidAutoX on PodcastEpisode {
  Future<MediaItem> toAndroidAutoMediaItem({
    required String itemId,
    String? podcastTitle,
    Uri? serverUrl,
    required DownloadsFilesystemHelper helper,
    MediaProgress? progress,
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
      extras: {..._styleExtras(playable: true), ..._completionExtras(progress)},
    );
  }
}
