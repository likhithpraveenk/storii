import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/filter.dart';
import 'package:storii/abs_api/models/json_converters.dart';

part 'library_items_request_params.freezed.dart';
part 'library_items_request_params.g.dart';

@freezed
abstract class LibraryItemsRequestParams with _$LibraryItemsRequestParams {
  const LibraryItemsRequestParams._();

  const factory LibraryItemsRequestParams({
    @Default(0) int limit,
    @Default(0) int page,
    String? sort,
    @BoolBinaryConverter() bool? desc,
    @FilterConverter() Filter? filter,
    @JsonKey(name: 'collapseseries') bool? collapseSeries,
  }) = _LibraryItemsRequestParams;

  factory LibraryItemsRequestParams.fromJson(Map<String, dynamic> json) =>
      _$LibraryItemsRequestParamsFromJson(json);
}
