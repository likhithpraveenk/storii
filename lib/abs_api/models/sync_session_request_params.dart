import 'package:storii/abs_api/models/json_converters.dart';

part 'sync_session_request_params.g.dart';

@requestToJson
class SyncSessionRequestParams {
  final Duration currentTime;
  final Duration timeListened;

  const SyncSessionRequestParams({
    required this.currentTime,
    required this.timeListened,
  });

  Map<String, dynamic>? toJson() => _$SyncSessionRequestParamsToJson(this);
}
