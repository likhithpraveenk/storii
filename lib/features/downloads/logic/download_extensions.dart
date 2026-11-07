import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

class _TrackSpec {
  new({
    required this.audioTrack,
    required this.ino,
    required this.trackPath,
    required this.bytesTotal,
  });

  final AudioTrack audioTrack;
  final String ino;
  final String trackPath;
  final int bytesTotal;
}

extension ToDownloadItemX on LibraryItem {
  Future<DownloadItem> toDownloadItem({
    required String userId,
    required Uri serverUrl,
    required StorageService service,
    String? episodeId,
    DownloadItem? existing,
  }) async {
    final List<_TrackSpec> specs;
    final String itemTitle;
    final String itemAuthor;
    final DownloadMediaType mediaType;
    final String? resolvedEpisodeId;

    if (isPodcast) {
      final episode = episodes.firstWhere((e) => e.id == episodeId);
      final audioTrack = episode.audioTrack;
      if (audioTrack == null) throw 'No audio track';

      specs = [
        _TrackSpec(
          audioTrack: audioTrack,
          ino: episode.audioFile.ino,
          bytesTotal: episode.audioFile.metadata.size,
          trackPath: episode.audioFile.metadata.relPath,
        ),
      ];
      itemTitle = episode.title ?? id;
      itemAuthor = episode.subtitle ?? '';
      mediaType = .podcast;
      resolvedEpisodeId = episode.id;
    } else {
      specs = [
        for (final file in audioFiles)
          _TrackSpec(
            audioTrack: tracks.firstWhere((t) => t.index == file.index),
            ino: file.ino,
            bytesTotal: file.metadata.size,
            trackPath: file.metadata.relPath,
          ),
      ];
      itemTitle = title ?? id;
      itemAuthor = authorName ?? l10n.noAuthor;
      mediaType = .audiobook;
      resolvedEpisodeId = null;
    }

    final downloadTracks = <DownloadTrack>[];
    for (final spec in specs) {
      final stat = await service.stat(
        relativePath: relPath,
        trackPath: spec.trackPath,
      );
      final bytes = stat?.length ?? 0;
      downloadTracks.add(
        DownloadTrack(
          audioTrack: spec.audioTrack,
          ino: spec.ino,
          status: stat?.isIntact(spec.bytesTotal) == true
              ? .completed
              : (bytes > 0 ? .paused : .queued),
          bytesReceived: bytes,
          bytesTotal: spec.bytesTotal,
          trackPath: spec.trackPath,
        ),
      );
    }

    return existing?.copyWith(tracks: downloadTracks, status: .queued) ??
        DownloadItem(
          libraryItemId: id,
          episodeId: resolvedEpisodeId,
          title: itemTitle,
          author: itemAuthor,
          tracks: downloadTracks,
          mediaType: mediaType,
          startedAt: DateTime.now(),
          serverUrl: serverUrl,
          userId: userId,
          folderPath: service.location.uri,
          relativePath: relPath,
        );
  }
}
