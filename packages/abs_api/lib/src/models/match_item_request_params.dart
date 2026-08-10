import 'package:abs_api/src/models/metadata_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_item_request_params.freezed.dart';
part 'match_item_request_params.g.dart';

@freezed
sealed class MatchItemRequestParams with _$MatchItemRequestParams {
  const factory MatchItemRequestParams({
    required MetadataProvider provider,
    String? title,
    String? author,
    @Default(false) bool overrideDefaults,
    String? isbn,
    String? asin,
  }) = _MatchItemRequestParams;

  factory MatchItemRequestParams.fromJson(Map<String, dynamic> json) =>
      _$MatchItemRequestParamsFromJson(json);
}
