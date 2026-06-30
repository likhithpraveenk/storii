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
    DownloadItem? existing,
  }) async {
    final filesystem = DownloadsFilesystemHelper();
    final downloadTracks = await Future.wait(
      tracks.map((track) async {
        final path = await filesystem.trackPath(
          itemTitle: title ?? id,
          filename: track.metadata?.filename ?? track.index.toString(),
        );
        final prev = existing?.tracks.firstWhereOrNull(
          (dt) => dt.audioTrack.index == track.index,
        );

        final intact =
            prev?.status == .completed && await filesystem.fileIntact(path);

        final existingBytes = await filesystem.existingBytes(path);

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
        existing?.copyWith(tracks: downloadTracks, status: .queued) ??
        DownloadItem(
          libraryItemId: id,
          title: title ?? id,
          author: authorName ?? l10n.noAuthor,
          tracks: downloadTracks,
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
    DownloadItem? existing,
    required String itemTitle,
  }) async {
    if (audioTrack == null) throw 'No audio track';

    final filesystem = DownloadsFilesystemHelper();
    final path = await filesystem.trackPath(
      itemTitle: itemTitle,
      filename: audioFile.metadata.filename,
    );

    final prev = existing?.tracks.firstWhereOrNull(
      (dt) => dt.ino == audioFile.ino,
    );
    final intact =
        prev?.status == .completed && await filesystem.fileIntact(path);
    final existingBytes = await filesystem.existingBytes(path);

    final track = DownloadTrack(
      audioTrack: audioTrack!,
      localPath: path,
      ino: audioFile.ino,
      status: intact ? .completed : (existingBytes > 0 ? .paused : .queued),
      bytesReceived: existingBytes,
      bytesTotal: audioFile.metadata.size,
    );

    return existing?.copyWith(tracks: [track], status: .queued) ??
        DownloadItem(
          libraryItemId: libraryItemId,
          title: title ?? id,
          author: '',
          tracks: [track],
          startedAt: DateTime.now(),
          serverUrl: serverUrl,
          userId: userId,
          episodeId: id,
        );
  }
}
