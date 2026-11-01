import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/features/downloads/logic/download_engine.dart';
import 'package:storii/features/downloads/logic/downloads_notification_service.dart';
import 'package:storii/features/downloads/logic/throttled_persister.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/local/downloads_store.dart';

class DownloadTask {
  new({
    required this.store,
    required this.engine,
    required this.notifications,
    required this.currentUser,
    required this.useBinary,
  });

  final DownloadsStore store;
  final DownloadEngine engine;
  final DownloadsNotifications notifications;
  final UserDomain? Function() currentUser;
  final bool Function() useBinary;

  Future<void> run(String key) async {
    final item = store.get(key);
    if (item == null) return;

    await notifications.requestPermission();
    await notifications.startForeground(title: item.title);

    final persister = ThrottledPersister(
      store: store,
      onPersist: (item) => notifications.showProgressNotification(
        title: item.title,
        progress: (item.progress * 100).toInt(),
        isComplete: item.isComplete,
        isFailed: item.isFailed,
        isPaused: item.status == .paused,
        totalBytes: item.totalBytes,
        useBinary: useBinary(),
      ),
    );

    try {
      final user = currentUser();
      if (user == null) throw StateError('No current user');

      final stream = engine.downloadItem(item: item, user: user);

      await for (final updated in stream) {
        final inActive = !updated.isActive;
        await persister.update(updated);
        if (inActive) {
          await notifications.stopForeground();
        }
      }

      await persister.flush();
    } catch (e, st) {
      await _flushQuietly(persister);
      final error = AppError.from(e, st);
      LogService.log(
        'Download failed for $key: ${error.message}',
        source: 'DownloadTask',
        level: .error,
        originalError: error.originalError,
        stackTrace: error.stackTrace,
      );
      await _setStatus(key, .failed);

      await notifications.stopForeground();
      await notifications.showProgressNotification(
        title: store.get(key)?.title ?? key,
        progress: 0,
        isComplete: false,
        isFailed: true,
        isPaused: false,
        useBinary: useBinary(),
      );
    }
  }

  Future<void> _flushQuietly(ThrottledPersister persister) async {
    try {
      await persister.flush();
    } catch (e, st) {
      final error = AppError.from(e, st);
      LogService.log(
        'Could not flush download state: ${error.message}',
        source: 'DownloadTask',
        level: .warning,
        originalError: error.originalError,
        stackTrace: error.stackTrace,
      );
    }
  }

  Future<void> _setStatus(String key, DownloadStatus status) async {
    final item = store.get(key);
    if (item == null) return;
    await store.save(item.copyWith(status: status));
  }
}
