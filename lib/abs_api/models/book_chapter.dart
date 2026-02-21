import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/json_converters.dart';

part 'book_chapter.freezed.dart';
part 'book_chapter.g.dart';

@freezed
sealed class BookChapter with _$BookChapter {
  @DurationPreciseSecondsConverter()
  const factory BookChapter({
    required int id,
    required Duration start,
    required Duration end,
    required String title,
  }) = _BookChapter;

  factory BookChapter.fromJson(Map<String, dynamic> json) =>
      _$BookChapterFromJson(json);
}
