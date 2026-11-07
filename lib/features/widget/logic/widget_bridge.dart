import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'widget_bridge.g.dart';

class WidgetBridge {
  new() : _channel = const MethodChannel(WidgetBridge.channelName);

  static const channelName = 'com.likhithpraveenk.storii/widget';

  final MethodChannel _channel;

  Future<List<int>> installedWidgetIds() async {
    try {
      return await _channel.invokeListMethod<int>('getInstalledWidgets') ??
          const [];
    } on PlatformException {
      return const [];
    }
  }

  Future<String?> readData(String key) async {
    try {
      return await _channel.invokeMethod<String>('getWidgetData', {'key': key});
    } on PlatformException {
      return null;
    }
  }

  Future<void> saveData(String key, String? value) async {
    try {
      await _channel.invokeMethod('saveWidgetData', {
        'key': key,
        'value': value,
      });
    } on PlatformException catch (_) {}
  }

  Future<void> updateWidgetsUI() async {
    try {
      await _channel.invokeMethod('updateWidget');
    } on PlatformException catch (_) {}
  }

  Future<String?> pendingPlay() async {
    try {
      return await _channel.invokeMethod<String>('getPendingPlay');
    } on PlatformException {
      return null;
    }
  }

  Future<void> clearPendingPlay() async {
    try {
      await _channel.invokeMethod('clearPendingPlay');
    } on PlatformException catch (_) {}
  }

  void setPendingPlayListener(Future<void> Function() onQueued) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'pendingPlayQueued') await onQueued();
      return null;
    });
  }

  void clearPendingPlayListener() {
    _channel.setMethodCallHandler(null);
  }
}

@riverpod
WidgetBridge widgetBridge(Ref ref) => WidgetBridge();
