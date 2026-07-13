import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_device_info.freezed.dart';
part 'cast_device_info.g.dart';

@freezed
sealed class CastDeviceInfo with _$CastDeviceInfo {
  const factory CastDeviceInfo({
    required String id,
    required String name,
    required String subtitle,
  }) = GenericDeviceInfo;

  const factory CastDeviceInfo.dlna({
    required String id,
    required String name,
    required String subtitle,
  }) = DlnaDeviceInfo;

  const CastDeviceInfo._();

  factory CastDeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$CastDeviceInfoFromJson(json);
}
