import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/features/downloads/ui/downloads_screen.dart';
import 'package:storii/shared/helpers/helpers.dart';

part 'downloads_notification_service.g.dart';

abstract class DownloadsNotifications {
  Future<void> init();

  Future<bool> requestPermission();

  Future<void> startNotification({required String key});

  Future<void> release({required String key});

  Future<void> showProgressNotification({
    required String key,
    required String title,
    required int progress,
    required bool isComplete,
    required bool isFailed,
    required bool isPaused,
    int? totalBytes,
    required bool useBinary,
  });

  Future<void> dismiss({String? key});
}

@Riverpod(keepAlive: true)
DownloadsNotifications downloadsNotifications(Ref ref) {
  return DownloadsNotificationService(
    getRouter: () => ref.read(routerProvider),
  );
}

class DownloadsNotificationService implements DownloadsNotifications {
  final GoRouter Function() getRouter;

  new({required this.getRouter});
  final _plugin = FlutterLocalNotificationsPlugin();

  int _nextId = 1000;
  final _foreground = <String>{};
  final _notificationIds = <String, int>{};

  AndroidFlutterLocalNotificationsPlugin? get _androidPlugin => _plugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  static const channelId = 'com.likhithpraveenk.storii.downloads';
  static final channelName = l10n.downloads;

  @override
  Future<void> init() async {
    const androidInit = AndroidInitializationSettings(
      'drawable/ic_notification',
    );
    const iosInit = IOSInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );
    await _plugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (details) {
        final payload = details.payload;
        if (payload != null && payload.startsWith('downloads')) {
          getRouter().push(
            AppRoute.downloads.path,
            extra: DownloadsScreenTab.active,
          );
        }
      },
    );
  }

  @override
  Future<bool> requestPermission() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }

  @override
  Future<void> startNotification({required String key}) async {
    if (!_foreground.add(key)) return;
    if (_foreground.length == 1) {
      final androidDetails = AndroidNotificationDetails(
        channelId,
        channelName,
        channelDescription: 'Shows download progress',
        importance: .low,
        priority: .low,
        ongoing: true,
        onlyAlertOnce: true,
      );
      await _androidPlugin?.startForegroundService(
        id: _nextId,
        title: l10n.downloads,
        body: l10n.startingDownload,
        notificationDetails: androidDetails,
        foregroundServiceTypes: {.foregroundServiceTypeDataSync},
      );
    }
    _notificationIds.putIfAbsent(key, () => _nextId++);
  }

  @override
  Future<void> release({required String key}) async {
    if (_foreground.remove(key) && _foreground.isEmpty) {
      await _androidPlugin?.stopForegroundService();
    }
  }

  @override
  Future<void> showProgressNotification({
    required String key,
    required String title,
    required int progress,
    required bool isComplete,
    required bool isFailed,
    required bool isPaused,
    int? totalBytes,
    required bool useBinary,
  }) async {
    String body = '$progress%';
    if (isComplete) {
      body = l10n.completed;
    } else if (isFailed) {
      body = l10n.failed;
    } else if (isPaused) {
      body = l10n.paused;
    }
    if (totalBytes != null) {
      body = '$body - ${formatBytes(totalBytes, useBinary: useBinary)}';
    }

    final id = _notificationIds.putIfAbsent(key, () => _nextId++);
    final androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: 'Shows download progress',
      importance: .low,
      priority: .low,
      showProgress: !isComplete && !isFailed && !isPaused,
      maxProgress: 100,
      progress: progress,
      ongoing: !isComplete && !isFailed && !isPaused,
      onlyAlertOnce: true,
    );

    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(android: androidDetails),
      payload: 'downloads',
    );
  }

  @override
  Future<void> dismiss({String? key}) async {
    if (key != null) {
      final id = _notificationIds.remove(key);
      if (id != null) {
        await _plugin.cancel(id: id);
      }
    } else {
      for (final id in _notificationIds.values) {
        await _plugin.cancel(id: id);
      }
      _notificationIds.clear();
    }
  }
}
