import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/app/config/router.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/features/downloads/ui/downloads_screen.dart';
import 'package:storii/shared/helpers/helpers.dart';

part 'downloads_notification_service.g.dart';

abstract class DownloadsNotifications {
  Future<void> init();

  Future<void> start(String key);

  Future<void> update(String key, DownloadItem item);

  Future<void> finish(String key);

  Future<void> dismiss(String key);
}

@Riverpod(keepAlive: true)
DownloadsNotifications downloadsNotifications(Ref ref) {
  return DownloadsNotificationService(
    getRouter: () => ref.read(routerProvider),
    useBinary: () => ref.read(useBinaryBytesProvider),
  );
}

class DownloadsNotificationService implements DownloadsNotifications {
  final GoRouter Function() getRouter;
  final bool Function() useBinary;

  new({required this.getRouter, required this.useBinary});
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

  Future<bool> requestPermission() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }

  @override
  Future<void> start(String key) async {
    await requestPermission();
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
  Future<void> finish(String key) async {
    if (_foreground.remove(key) && _foreground.isEmpty) {
      await _androidPlugin?.stopForegroundService();
    }
  }

  @override
  Future<void> update(String key, DownloadItem item) async {
    final isComplete = item.status == .completed;
    final isFailed = item.status == .failed;
    final isPaused = item.status == .paused;
    final isTerminal = isComplete || isFailed || isPaused;

    var body = '${(item.progress * 100).toInt()}%';
    if (isComplete) {
      body = l10n.completed;
    } else if (isFailed) {
      body = l10n.failed;
    } else if (isPaused) {
      body = l10n.paused;
    }
    final totalStr = formatBytes(item.totalBytes, useBinary: useBinary());
    final receivedStr = formatBytes(item.receivedBytes, useBinary: useBinary());
    body = '$body $kSmallDot $receivedStr / $totalStr';

    final id = _notificationIds.putIfAbsent(key, () => _nextId++);
    final androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: 'Shows download progress',
      importance: .low,
      priority: .low,
      showProgress: !isTerminal,
      maxProgress: 100,
      progress: (item.progress * 100).toInt(),
      ongoing: !isTerminal,
      onlyAlertOnce: true,
    );

    await _plugin.show(
      id: id,
      title: item.title,
      body: body,
      notificationDetails: NotificationDetails(android: androidDetails),
      payload: 'downloads',
    );
  }

  @override
  Future<void> dismiss(String key) async {
    await finish(key);
    final id = _notificationIds.remove(key);
    if (id != null) {
      await _plugin.cancel(id: id);
    }
  }
}
