import 'package:abs_api/abs_api.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';

extension ToDownloadItemX on LibraryItem {
  Future<DownloadItem> toDownloadItem({
    required String userId,
    required Uri serverUrl,
    required StorageService service,
    DownloadItem? existing,
  }) async {
    final downloadTracks = await Future.wait(
      tracks.map((track) async {
        final audioFile = audioFiles.firstWhere((f) => f.index == track.index);
        final filename = track.metadata?.filename;

        final intact = await service.fileIntact(
          libraryItemId: id,
          filename: filename ?? '',
          expectedBytes: track.metadata?.size ?? 0,
        );

        final existingBytes = await service.existingBytes(
          libraryItemId: id,
          filename: filename ?? '',
        );

        return DownloadTrack(
          audioTrack: track,
          ino: audioFile.ino,
          status: intact ? .completed : (existingBytes > 0 ? .paused : .queued),
          bytesReceived: existingBytes,
          bytesTotal: audioFile.metadata.size,
        );
      }),
    );

    final downloadItem =
        existing?.copyWith(
          tracks: downloadTracks,
          status: .queued,
          startedAt: DateTime.now(),
        ) ??
        DownloadItem(
          libraryItemId: id,
          title: title ?? id,
          author: authorName ?? l10n.noAuthor,
          tracks: downloadTracks,
          startedAt: DateTime.now(),
          serverUrl: serverUrl,
          userId: userId,
          folderPath: service.location.uri,
        );
    return downloadItem;
  }
}

extension ToEpisodeDownloadItemX on PodcastEpisode {
  Future<DownloadItem> toDownloadItem({
    required String userId,
    required Uri serverUrl,
    required StorageService service,
    DownloadItem? existing,
  }) async {
    if (audioTrack == null) throw 'No audio track';

    final prev = existing?.tracks.firstWhereOrNull(
      (dt) => dt.ino == audioFile.ino,
    );
    final intact =
        prev?.status == .completed &&
        await service.fileIntact(
          libraryItemId: libraryItemId,
          episodeId: id,
          filename: prev?.filename ?? '',
          expectedBytes: audioFile.metadata.size,
        );

    final existingBytes = await service.existingBytes(
      libraryItemId: libraryItemId,
      episodeId: id,
      filename: prev?.filename ?? '',
    );

    final track = DownloadTrack(
      audioTrack: audioTrack!,
      ino: audioFile.ino,
      status: intact ? .completed : (existingBytes > 0 ? .paused : .queued),
      bytesReceived: existingBytes,
      bytesTotal: audioFile.metadata.size,
    );

    return existing?.copyWith(
          tracks: [track],
          status: .queued,
          startedAt: DateTime.now(),
        ) ??
        DownloadItem(
          libraryItemId: libraryItemId,
          episodeId: id,
          title: title ?? id,
          author: subtitle ?? '',
          tracks: [track],
          mediaType: .podcast,
          startedAt: DateTime.now(),
          serverUrl: serverUrl,
          userId: userId,
          folderPath: service.location.uri,
        );
  }
}
