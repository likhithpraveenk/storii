import 'package:abs_api/src/models/filter.dart';
import 'package:abs_api/src/models/json_converters.dart';
import 'package:abs_api/src/models/series.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
