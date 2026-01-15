import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/models/utils/filter.dart';
import 'package:storii/api/models/utils/json_converters.dart';
import 'package:storii/api/models/utils/json_helpers.dart';
import 'package:storii/api/models/utils/sort.dart';

part 'library_items_request_params.g.dart';
part 'library_items_request_params.freezed.dart';

@freezed
@requestToJsonRemoveNull
@BoolBinaryConverter()
abstract class LibraryItemsRequestParams with _$LibraryItemsRequestParams {
  const LibraryItemsRequestParams._();

  const factory LibraryItemsRequestParams({
    int? limit,
    int? page,
    @SortConverter() LibraryItemSort? sort,
    @BoolBinaryConverter() bool? desc,
    @FilterConverter() Filter? filter,
    @JsonKey(name: 'collapseseries') bool? collapseSeries,
  }) = _LibraryItemsRequestParams;

  Map<String, dynamic>? toJson() {
    final json = _$LibraryItemsRequestParamsToJson(this);
    return json.nullIfEmpty;
  }
}
