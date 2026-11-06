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
  Future<void> init() async {
    events.add('init');
  }

  @override
  Future<bool> requestPermission() async {
    events.add('requestPermission');
    return permissionGranted;
  }

  @override
  Future<void> startNotification({required String key}) async {
    events.add('acquire');
  }

  @override
  Future<void> release({required String key}) async {
    events.add('release');
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
  Future<void> dismiss({String? key}) async {
    events.add('dismiss');
  }
}
