import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info.freezed.dart';
part 'device_info.g.dart';

@freezed
abstract class DeviceInfo with _$DeviceInfo {
  const factory DeviceInfo({
    String? id,
    String? userId,
    String? deviceId,
    String? ipAddress,
    String? browserName,
    String? browserVersion,
    String? osName,
    String? osVersion,
    String? deviceType,
    String? manufacturer,
    String? model,
    String? sdkVersion,
    String? clientName,
    String? deviceName,
    String? clientVersion,
  }) = _DeviceInfo;

  factory DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoFromJson(json);
}
