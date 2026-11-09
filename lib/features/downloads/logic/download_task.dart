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
  });

  final DownloadsStore store;
  final DownloadEngine engine;
  final DownloadsNotifications notifications;
  final UserDomain? Function() currentUser;

  Future<void> run(String key) async {
    final item = store.get(key);
    if (item == null || !item.isActive) return;

    await notifications.start(key);

    final persister = ThrottledPersister(
      store: store,
      onPersist: (item) => notifications.update(key, item),
    );

    try {
      final user = currentUser();
      if (user == null) throw StateError('No current user');

      await engine.download(
        item: item,
        user: user,
        onProgress: persister.update,
      );

      await persister.flush();
      await notifications.finish(key);
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

      await notifications.finish(key);
      final failedItem = store.get(key);
      if (failedItem != null) {
        await notifications.update(key, failedItem);
      }
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
