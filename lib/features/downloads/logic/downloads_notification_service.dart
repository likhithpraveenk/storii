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

  Future<void> startForeground({required String title});

  Future<void> showProgressNotification({
    required String title,
    required int progress,
    required bool isComplete,
    required bool isFailed,
    required bool isPaused,
    int? totalBytes,
    required bool useBinary,
  });

  Future<void> stopForeground();

  Future<void> dismiss();
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

  AndroidFlutterLocalNotificationsPlugin? get _androidPlugin => _plugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  static const channelId = 'com.likhithpraveenk.storii.downloads';
  static final channelName = l10n.downloads;
  static const notificationId = 888;
  // TODO: multiple notifications need multiple ids

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
  Future<void> startForeground({required String title}) async {
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
      id: notificationId,
      title: title,
      body: 'Starting download…',
      notificationDetails: androidDetails,
      foregroundServiceTypes: {.foregroundServiceTypeDataSync},
    );
  }

  @override
  Future<void> showProgressNotification({
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
      id: notificationId,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(android: androidDetails),
      payload: 'downloads',
    );
  }

  @override
  Future<void> stopForeground() async {
    await _androidPlugin?.stopForegroundService();
  }

  @override
  Future<void> dismiss() async {
    await _plugin.cancel(id: notificationId);
  }
}
