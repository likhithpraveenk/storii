import 'package:abs_api/src/models/library_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_item_response.freezed.dart';
part 'match_item_response.g.dart';

@freezed
sealed class MatchItemResponse with _$MatchItemResponse {
  const factory MatchItemResponse({
    required bool updated,
    required LibraryItem libraryItem,
  }) = _MatchItemResponse;

  factory MatchItemResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchItemResponseFromJson(json);
}
