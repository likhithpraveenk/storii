import 'package:abs_api/src/models/filter.dart';
import 'package:abs_api/src/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_request_params.freezed.dart';
part 'series_request_params.g.dart';

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
