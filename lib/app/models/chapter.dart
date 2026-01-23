import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
sealed class ChapterDomain with _$ChapterDomain {
  const factory ChapterDomain({
    required int id,
    required Duration start,
    required Duration end,
    required String title,
  }) = _ChapterDomain;

  factory ChapterDomain.fromJson(Map<String, dynamic> json) =>
      _$ChapterDomainFromJson(json);
}
