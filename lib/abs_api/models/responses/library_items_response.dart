import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/library/library_item.dart';
import 'package:storii/abs_api/models/utils/enums.dart';
import 'package:storii/abs_api/models/utils/filter.dart';
import 'package:storii/abs_api/models/utils/json_converters.dart';

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
