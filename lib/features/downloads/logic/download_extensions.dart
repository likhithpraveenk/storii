import 'package:abs_api/abs_api.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/downloads/logic/downloads_filesystem_helper.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';

extension ToDownloadItemX on LibraryItem {
  Future<DownloadItem> toDownloadItem({
    required String userId,
    required Uri serverUrl,
    required DownloadsFilesystemHelper fs,
    DownloadItem? existing,
  }) async {
    final downloadTracks = await Future.wait(
      tracks.map((track) async {
        final path = await fs.audiobookTrackPath(
          id,
          track.metadata?.filename ?? track.index.toString(),
        );
        final prev = existing?.tracks.firstWhereOrNull(
          (dt) => dt.audioTrack.index == track.index,
        );

        final intact =
            prev?.status == .completed &&
            await fs.fileIntact(path, expectedBytes: track.metadata?.size ?? 0);

        final existingBytes = await fs.existingBytes(path);

        final audioFile = audioFiles.firstWhere((f) => f.index == track.index);
        return DownloadTrack(
          audioTrack: track,
          localPath: path,
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
          mediaType: .audiobook,
          startedAt: DateTime.now(),
          serverUrl: serverUrl,
          userId: userId,
        );
    return downloadItem;
  }
}

extension ToEpisodeDownloadItemX on PodcastEpisode {
  Future<DownloadItem> toDownloadItem({
    required String userId,
    required Uri serverUrl,
    required DownloadsFilesystemHelper fs,
    DownloadItem? existing,
    required String itemTitle,
  }) async {
    if (audioTrack == null) throw 'No audio track';

    final path = await fs.podcastTrackPath(
      libraryItemId,
      id,
      audioTrack!.metadata?.filename ?? id,
    );

    final prev = existing?.tracks.firstWhereOrNull(
      (dt) => dt.ino == audioFile.ino,
    );
    final intact =
        prev?.status == .completed &&
        await fs.fileIntact(path, expectedBytes: audioFile.metadata.size);
    final existingBytes = await fs.existingBytes(path);

    final track = DownloadTrack(
      audioTrack: audioTrack!,
      localPath: path,
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
          title: title ?? id,
          author: '',
          tracks: [track],
          mediaType: .podcast,
          startedAt: DateTime.now(),
          serverUrl: serverUrl,
          userId: userId,
          episodeId: id,
        );
  }
}
