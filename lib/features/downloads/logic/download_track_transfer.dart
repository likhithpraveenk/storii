import 'dart:async';

import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/downloads/logic/download_transport.dart';
import 'package:storii/features/downloads/logic/storage_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/app_error.dart';

sealed class TrackTransferEvent {
  const new();
}

final class TrackProgress extends TrackTransferEvent {
  const new(this.bytesReceived);

  final int bytesReceived;
}

final class TrackOutcome extends TrackTransferEvent {
  const new({required this.status, required this.bytesReceived, this.error});

  final DownloadStatus status;
  final int bytesReceived;
  final String? error;
}

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

  Stream<TrackTransferEvent> transfer({
    required DownloadTrack track,
    required Uri url,
    required String accessToken,
    required StorageService service,
    required String relativePath,
    required DownloadCancelToken cancelToken,
    required bool Function() isCancelled,
  }) async* {
    var received = 0;

    for (var attempt = 0; attempt <= retryDelays.length; attempt++) {
      if (isCancelled() || cancelToken.isCancelled) {
        yield TrackOutcome(status: .paused, bytesReceived: received);
        return;
      }

      received = await service.getBytes(
        relativePath: relativePath,
        trackPath: track.trackPath,
      );

      final sink = await service.getSink(
        relativePath: relativePath,
        trackPath: track.trackPath,
        mimeType: track.mimeType,
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

          if (isCancelled() || cancelToken.isCancelled) {
            await sink.close();
            yield TrackOutcome(status: .paused, bytesReceived: received);
            return;
          }

          yield TrackProgress(received);
        }

        await sink.close();
        yield TrackOutcome(status: .completed, bytesReceived: received);
        return;
      } catch (e, st) {
        await sink.close();

        if (isCancelled() || cancelToken.isCancelled) {
          yield TrackOutcome(status: .paused, bytesReceived: received);
          return;
        }

        final error = AppError.from(e, st);

        if (attempt == retryDelays.length) {
          LogService.log(
            error.message,
            source: 'TrackTransfer',
            level: .error,
            originalError: error.originalError,
            stackTrace: error.stackTrace,
          );
          yield TrackOutcome(
            status: .failed,
            bytesReceived: received,
            error: error.message,
          );
          return;
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
