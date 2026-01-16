import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/app/models/enums.dart';

part 'library.freezed.dart';
part 'library.g.dart';

@freezed
sealed class LibraryDomain with _$LibraryDomain {
  const factory LibraryDomain({
    required String id,
    required Uri serverUrl,
    required String name,
    required MediaContent mediaContent,
  }) = _Library;

  factory LibraryDomain.fromJson(Map<String, dynamic> json) =>
      _$LibraryDomainFromJson(json);
}
