import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/library.dart';
import 'package:storii/abs_api/models/library_filter_data.dart';

part 'library_response.freezed.dart';
part 'library_response.g.dart';

@freezed
abstract class LibraryResponse with _$LibraryResponse {
  const factory LibraryResponse({
    @JsonKey(name: 'filterdata') required LibraryFilterData filterData,
    required int issues,
    required int numUserPlaylists,
    required Library library,
  }) = _LibraryResponse;

  factory LibraryResponse.fromJson(Map<String, dynamic> json) =>
      _$LibraryResponseFromJson(json);
}
