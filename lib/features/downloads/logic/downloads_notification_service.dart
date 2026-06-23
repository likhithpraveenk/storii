import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:storii/app/config/constants.dart';
import 'package:storii/shared/helpers/helpers.dart';

const isolatePortName = 'downloads_action';

class DownloadsNotificationService {
  DownloadsNotificationService._();
  static final instance = DownloadsNotificationService._();

  final _plugin = FlutterLocalNotificationsPlugin();

  AndroidFlutterLocalNotificationsPlugin? get _androidPlugin => _plugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  static const channelId = 'com.likhithpraveenk.storii.downloads';
  static const channelName = 'Downloads';
  static const actionPause = 'action_pause';
  static const actionResume = 'action_resume';
  static const actionCancel = 'action_cancel';
  static const notificationId = 888;

  Future<void> init() async {
    const androidInit = AndroidInitializationSettings(
      'drawable/ic_notification',
    );
    const iosInit = IOSInitializationSettings();
    const macOsInit = DarwinInitializationSettings();
    const windowsInit = WindowsInitializationSettings(
      appName: appName,
      appUserModelId: 'com.likhithpraveenk.storii',
      guid: 'download_notification',
    );
    const linuxInit = LinuxInitializationSettings(defaultActionName: 'Open');
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
      macOS: macOsInit,
      windows: windowsInit,
      linux: linuxInit,
    );
    await _plugin.initialize(settings: initSettings);
  }

  Future<bool> requestPermission() async {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return true;
    }

    final status = await Permission.notification.request();
    return status.isGranted;
  }

  Future<void> startForeground({required String title}) async {
    const androidDetails = AndroidNotificationDetails(
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
      body: 'Starting download...',
      notificationDetails: androidDetails,
      foregroundServiceTypes: {.foregroundServiceTypeDataSync},
    );
  }

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
      body = 'Download complete';
    } else if (isFailed) {
      body = 'Download failed';
    } else if (isPaused) {
      body = 'Download paused';
    }
    if (totalBytes != null) {
      body = '$body - ${formatBytes(totalBytes, useBinary: useBinary)}';
    }

    // final actions = <AndroidNotificationAction>[
    //   if (!isComplete && !isFailed && !isPaused)
    //     const AndroidNotificationAction(
    //       actionPause,
    //       'Pause',
    //       showsUserInterface: false,
    //       cancelNotification: false,
    //     ),
    //   if (isPaused)
    //     const AndroidNotificationAction(
    //       actionResume,
    //       'Resume',
    //       showsUserInterface: false,
    //       cancelNotification: false,
    //     ),
    //   if (!isComplete && !isFailed)
    //     const AndroidNotificationAction(
    //       actionCancel,
    //       'Cancel',
    //       showsUserInterface: false,
    //       cancelNotification: false,
    //     ),
    // ];

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
    );
  }

  Future<void> stopForeground() async {
    await _androidPlugin?.stopForegroundService();
  }

  // TODO: Add cancel method to dismiss notification when download is deleted
}
