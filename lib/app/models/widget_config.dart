import 'package:freezed_annotation/freezed_annotation.dart';

part 'widget_config.freezed.dart';
part 'widget_config.g.dart';

@freezed
sealed class WidgetConfig with _$WidgetConfig {
  const factory({
    required int widgetId,
    required String itemId,
    String? episodeId,
    required DateTime updatedAt,
    String? coverPath,
    double? progress,
  }) = _WidgetConfig;

  factory fromJson(Map<String, dynamic> json) => _$WidgetConfigFromJson(json);
}
