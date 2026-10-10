import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/widget_config.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'widget_store.g.dart';

@Riverpod(keepAlive: true)
class WidgetStore extends _$WidgetStore {
  @override
  void build() {}

  WidgetConfig? getConfig(int widgetId) {
    final json = widgetConfigBox.get('widget_$widgetId');
    if (json == null) return null;
    return WidgetConfig.fromJson(jsonDecode(json));
  }

  Future<void> saveConfig(WidgetConfig config) async {
    await widgetConfigBox.put('widget_${config.widgetId}', jsonEncode(config));
  }

  Future<void> clearConfig(int widgetId) async {
    await widgetConfigBox.delete('widget_$widgetId');
  }

  Future<void> clearAll() async {
    await widgetConfigBox.clear();
  }

  List<WidgetConfig> getAllConfigs() {
    return widgetConfigBox.values
        .map((json) => WidgetConfig.fromJson(jsonDecode(json)))
        .toList();
  }
}
