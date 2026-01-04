import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/models/enums.dart';

part 'library.freezed.dart';
part 'library.g.dart';

@freezed
sealed class Library with _$Library {
  const factory Library({
    required String id,
    required Uri serverUrl,
    required String name,
    required MediaContent mediaContent,
  }) = _Library;

  factory Library.fromJson(Map<String, dynamic> json) =>
      _$LibraryFromJson(json);
}
