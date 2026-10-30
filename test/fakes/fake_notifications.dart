import 'package:storii/features/downloads/logic/downloads_notification_service.dart';

typedef RecordedProgressNotification = ({
  String title,
  int progress,
  bool isComplete,
  bool isFailed,
  bool isPaused,
  int? totalBytes,
});

class FakeDownloadsNotifications implements DownloadsNotifications {
  final List<String> events = <String>[];
  final List<RecordedProgressNotification> progressCalls =
      <RecordedProgressNotification>[];
  bool permissionGranted = true;

  int countOf(String event) => events.where((e) => e == event).length;

  @override
  Future<bool> requestPermission() async {
    events.add('requestPermission');
    return permissionGranted;
  }

  @override
  Future<void> startForeground({required String title}) async {
    events.add('startForeground');
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
    events.add('showProgress');
    progressCalls.add((
      title: title,
      progress: progress,
      isComplete: isComplete,
      isFailed: isFailed,
      isPaused: isPaused,
      totalBytes: totalBytes,
    ));
  }

  @override
  Future<void> stopForeground() async {
    events.add('stopForeground');
  }

  @override
  Future<void> dismiss() async {
    events.add('dismiss');
  }
}
