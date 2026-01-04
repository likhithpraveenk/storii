import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/models/utils/filter.dart';
import 'package:storii/api/models/utils/json_converters.dart';
import 'package:storii/api/models/utils/json_helpers.dart';

part 'library_items_request_params.g.dart';

@requestToJsonRemoveNull
@BoolBinaryConverter()
@FilterConverter()
class LibraryItemsRequestParams {
  final int? limit;
  final int? page;
  final String? sort;
  final bool? desc;
  final Filter? filter;
  final bool? minified;
  @JsonKey(name: 'collapseseries')
  final bool? collapseSeries;

  const LibraryItemsRequestParams({
    this.limit,
    this.page,
    this.sort,
    this.desc,
    this.filter,
    this.minified,
    this.collapseSeries,
  });

  Map<String, dynamic>? toJson() {
    final json = _$LibraryItemsRequestParamsToJson(this);
    return json.nullIfEmpty;
  }
}
