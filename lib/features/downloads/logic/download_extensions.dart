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
      audioFiles.map((file) async {
        final audioTrack = tracks.firstWhere((t) => t.index == file.index);

        final intact = await service.isFileIntact(
          relativePath: relPath,
          trackPath: file.metadata.relPath,
          expectedBytes: file.metadata.size,
        );

        final existingBytes = await service.getBytes(
          relativePath: relPath,
          trackPath: file.metadata.relPath,
        );

        return DownloadTrack(
          audioTrack: audioTrack,
          ino: file.ino,
          status: intact ? .completed : (existingBytes > 0 ? .paused : .queued),
          bytesReceived: existingBytes,
          bytesTotal: file.metadata.size,
          trackPath: file.metadata.relPath,
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
          relativePath: relPath,
        );
    return downloadItem;
  }
}

extension ToEpisodeDownloadItemX on PodcastEpisode {
  Future<DownloadItem> toDownloadItem({
    required String userId,
    required Uri serverUrl,
    required StorageService service,
    required String relativePath,
    DownloadItem? existing,
  }) async {
    final track = audioTrack;
    if (track == null) throw 'No audio track';

    final prev = existing?.tracks.firstWhereOrNull(
      (dt) => dt.ino == audioFile.ino,
    );
    final intact =
        prev?.status == .completed &&
        await service.isFileIntact(
          relativePath: relativePath,
          trackPath: audioFile.metadata.relPath,
          expectedBytes: audioFile.metadata.size,
        );

    final existingBytes = await service.getBytes(
      relativePath: relativePath,
      trackPath: audioFile.metadata.relPath,
    );

    final dTrack = DownloadTrack(
      audioTrack: track,
      ino: audioFile.ino,
      status: intact ? .completed : (existingBytes > 0 ? .paused : .queued),
      bytesReceived: existingBytes,
      bytesTotal: audioFile.metadata.size,
      trackPath: audioFile.metadata.relPath,
    );

    return existing?.copyWith(
          tracks: [dTrack],
          status: .queued,
          startedAt: DateTime.now(),
        ) ??
        DownloadItem(
          libraryItemId: libraryItemId,
          episodeId: id,
          title: title ?? id,
          author: subtitle ?? '',
          tracks: [dTrack],
          mediaType: .podcast,
          startedAt: DateTime.now(),
          serverUrl: serverUrl,
          userId: userId,
          folderPath: service.location.uri,
          relativePath: relativePath,
        );
  }
}
