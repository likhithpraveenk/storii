import 'package:abs_api/src/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
sealed class Bookmark with _$Bookmark {
  const factory Bookmark({
    required String libraryItemId,
    required String title,
    @DurationSecConverter() required Duration time,
    @DateTimeEpochConverter() required DateTime createdAt,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFromJson(json);
}
