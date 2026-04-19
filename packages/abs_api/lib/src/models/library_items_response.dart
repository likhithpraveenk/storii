import 'package:abs_api/src/models/enums.dart';
import 'package:abs_api/src/models/filter.dart';
import 'package:abs_api/src/models/json_converters.dart';
import 'package:abs_api/src/models/library_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_items_response.freezed.dart';
part 'library_items_response.g.dart';

@freezed
sealed class LibraryItemsResponse with _$LibraryItemsResponse {
  @FilterConverter()
  const factory LibraryItemsResponse({
    required List<LibraryItem> results,
    required int total,
    required int limit,
    required int page,
    String? sortBy,
    required bool sortDesc,
    Filter? filterBy,
    required MediaType mediaType,
    required bool minified,
    @JsonKey(name: 'collapseseries') required bool collapseSeries,
    required String include,
  }) = _LibraryItemsResponse;

  factory LibraryItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$LibraryItemsResponseFromJson(json);
}
