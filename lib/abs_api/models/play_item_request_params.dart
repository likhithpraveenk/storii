import 'package:storii/abs_api/models/json_converters.dart';
import 'package:storii/abs_api/models/json_helpers.dart';

part 'play_item_request_params.g.dart';

@requestToJsonRemoveNull
class PlayItemRequestParams {
  static const defaults = {
    'forceDirectPlay': false,
    'forceTranscode': false,
    'mediaPlayer': 'unknown',
  };

  final ClientDeviceInfo? deviceInfo;
  final bool forceDirectPlay;
  final bool forceTranscode;
  final List<String>? supportedMimeTypes;
  final String mediaPlayer;

  const PlayItemRequestParams({
    this.deviceInfo,
    this.forceDirectPlay = false,
    this.forceTranscode = false,
    this.supportedMimeTypes,
    this.mediaPlayer = 'unknown',
  });

  Map<String, dynamic>? toJson() =>
      _$PlayItemRequestParamsToJson(this).removeDefaults(defaults);
}

@requestToJsonRemoveNull
class ClientDeviceInfo {
  final String? deviceId;
  final String? clientName;
  final String? deviceName;
  final String? clientVersion;
  final String? manufacturer;
  final String? model;
  final String? sdkVersion;

  const ClientDeviceInfo({
    this.deviceId,
    this.clientName,
    this.deviceName,
    this.clientVersion,
    this.manufacturer,
    this.model,
    this.sdkVersion,
  });

  Map<String, dynamic>? toJson() => _$ClientDeviceInfoToJson(this).nullIfEmpty;
}
