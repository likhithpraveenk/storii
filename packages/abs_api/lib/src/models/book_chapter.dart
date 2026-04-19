import 'package:abs_api/src/models/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
