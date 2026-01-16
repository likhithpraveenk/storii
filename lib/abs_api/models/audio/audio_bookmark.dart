import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/utils/json_converters.dart';

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
