import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/downloads/logic/download_transport.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/app_error.dart';

class TrackTransferResult(final DownloadStatus status, final int bytesReceived);

class TrackTransfer {
  new({required this.transport, this.delay = _delay});

  final DownloadTransport transport;
  final Future<void> Function(Duration) delay;

  static Future<void> _delay(Duration duration) =>
      Future<void>.delayed(duration);

  static const retryDelays = <Duration>[
    Duration(milliseconds: 500),
    Duration(milliseconds: 1000),
    Duration(milliseconds: 2000),
  ];

  Future<TrackTransferResult> transfer({
    required DownloadTrack track,
    required Uri url,
    required String accessToken,
    required StorageService service,
    required String relativePath,
    required DownloadCancelToken cancelToken,
    required Future<void> Function(int bytesReceived) onProgress,
  }) async {
    var received = 0;

    for (var attempt = 0; ; attempt++) {
      if (cancelToken.isCancelled) {
        return TrackTransferResult(.paused, received);
      }

      final stat = await service.stat(
        relativePath: relativePath,
        trackPath: track.trackPath,
      );
      received = stat?.length ?? 0;

      final sink = await service.getSink(
        relativePath: relativePath,
        trackPath: track.trackPath,
        mimeType: track.mimeType,
        resumeOffset: received,
      );

      try {
        final response = await transport.fetch(
          url: url,
          accessToken: accessToken,
          rangeStart: received > 0 ? received : null,
          cancelToken: cancelToken,
        );

        final askedForRange = received > 0;

        if (askedForRange && !response.isPartial) {
          await response.stream.listen((_) {}).cancel();
          await sink.close();
          await service.deleteTrack(
            relativePath: relativePath,
            trackPath: track.trackPath,
          );
          received = 0;
          continue;
        }

        if (!askedForRange && response.isPartial) {
          throw StateError(
            'Server answered with a partial body for ${track.trackPath}',
          );
        }

        await for (final chunk in response.stream) {
          received += chunk.length;
          sink.add(chunk);

          if (cancelToken.isCancelled) {
            await sink.close();
            return TrackTransferResult(.paused, received);
          }

          await onProgress(received);
        }

        await sink.close();
        return TrackTransferResult(.completed, received);
      } catch (e, st) {
        await sink.close();

        if (cancelToken.isCancelled) {
          return TrackTransferResult(.paused, received);
        }

        final error = AppError.from(e, st);

        if (attempt >= retryDelays.length) {
          LogService.log(
            error.message,
            source: 'TrackTransfer',
            level: .error,
            originalError: error.originalError,
            stackTrace: error.stackTrace,
          );
          return TrackTransferResult(.failed, received);
        }

        LogService.log(
          'Track retry $attempt for ${track.ino}',
          source: 'TrackTransfer',
        );
        await delay(retryDelays[attempt]);
      }
    }
  }
}
