import 'package:freezed_annotation/freezed_annotation.dart';

part 'author.freezed.dart';

@freezed
sealed class Author with _$Author {
  const factory Author({
    required String id,
    required String name,
    required String libraryId,
    String? description,
  }) = _Author;
}
