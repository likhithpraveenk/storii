import 'package:abs_api/src/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_bookmark.freezed.dart';
part 'audio_bookmark.g.dart';

@freezed
sealed class AudioBookmark with _$AudioBookmark {
  @DateTimeEpochConverter()
  const factory AudioBookmark({
    required String libraryItemId,
    required String title,
    @DurationSecConverter() required Duration time,
    required DateTime createdAt,
  }) = _AudioBookmark;

  factory AudioBookmark.fromJson(Map<String, dynamic> json) =>
      _$AudioBookmarkFromJson(json);
}
