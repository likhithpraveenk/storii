import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/utils/filter.dart';
import 'package:storii/abs_api/models/utils/json_converters.dart';

part 'series_request_params.g.dart';
part 'series_request_params.freezed.dart';

@freezed
abstract class SeriesRequestParams with _$SeriesRequestParams {
  const SeriesRequestParams._();

  const factory SeriesRequestParams({
    @Default(0) int limit,
    @Default(0) int page,
    String? sort,
    @BoolBinaryConverter() bool? desc,
    @FilterConverter() Filter? filter,
  }) = _SeriesRequestParams;

  factory SeriesRequestParams.fromJson(Map<String, dynamic> json) =>
      _$SeriesRequestParamsFromJson(json);
}
