import 'package:abs_api/src/models/library.dart';
import 'package:abs_api/src/models/library_filter_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
