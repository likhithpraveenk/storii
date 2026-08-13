import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata_provider.freezed.dart';
part 'metadata_provider.g.dart';

@freezed
sealed class MetadataProvider with _$MetadataProvider {
  const factory MetadataProvider({
    required String value,
    required String text,
  }) = _MetadataProvider;

  factory MetadataProvider.fromJson(Map<String, dynamic> json) =>
      _$MetadataProviderFromJson(json);
}
