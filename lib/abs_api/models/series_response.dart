import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/filter.dart';
import 'package:storii/abs_api/models/json_converters.dart';
import 'package:storii/abs_api/models/series.dart';

part 'series_response.freezed.dart';
part 'series_response.g.dart';

@freezed
sealed class SeriesResponse with _$SeriesResponse {
  @FilterConverter()
  const factory SeriesResponse({
    required List<Series> results,
    required int total,
    required int limit,
    required int page,
    String? sortBy,
    required bool sortDesc,
    Filter? filterBy,
    required bool minified,
    required String include,
  }) = _SeriesResponse;

  factory SeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$SeriesResponseFromJson(json);
}
