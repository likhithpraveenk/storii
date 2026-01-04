import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/models/utils/filter.dart';
import 'package:storii/api/models/utils/json_converters.dart';
import 'package:storii/api/models/utils/json_helpers.dart';

part 'series_request_params.g.dart';

@requestToJsonRemoveNull
@BoolBinaryConverter()
@FilterConverter()
class SeriesRequestParams {
  final int? limit;
  final int? page;
  final String? sort;
  final bool? desc;
  final Filter? filter;
  final bool? minified;
  @JsonKey(includeToJson: false)
  final bool includeRssFeed;

  const SeriesRequestParams({
    this.limit,
    this.page,
    this.sort,
    this.desc,
    this.filter,
    this.minified,
    this.includeRssFeed = false,
  });

  Map<String, dynamic>? toJson() {
    final json = _$SeriesRequestParamsToJson(this);
    if (includeRssFeed) {
      json['include'] = 'rssfeed';
    }
    return json.nullIfEmpty;
  }
}
