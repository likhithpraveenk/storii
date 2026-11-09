import 'package:storii/features/downloads/logic/downloads_notification_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';

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
  Future<void> start(String key) async {
    events.add('acquire');
  }

  @override
  Future<void> update(String key, DownloadItem item) async {
    events.add('showProgress');
    progressCalls.add((
      title: item.title,
      progress: (item.progress * 100).toInt(),
      isComplete: item.status == .completed,
      isFailed: item.status == .failed,
      isPaused: item.status == .paused,
      totalBytes: item.totalBytes,
    ));
  }

  @override
  Future<void> finish(String key) async {
    events.add('release');
  }

  @override
  Future<void> dismiss(String key) async {
    events.add('dismiss');
  }
}
