import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
sealed class Chapter with _$Chapter {
  const Chapter._();

  const factory Chapter({
    required Duration start,
    required Duration end,
    required String title,
    @Default(false) bool fromTracks,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  Duration get duration => end - start;
}
