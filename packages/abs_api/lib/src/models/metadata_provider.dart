import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata_provider.freezed.dart';
part 'metadata_provider.g.dart';

@freezed
sealed class MetadataProvider with _$MetadataProvider {
  const factory({required String value, required String text}) =
      _MetadataProvider;

  factory fromJson(Map<String, dynamic> json) =>
      _$MetadataProviderFromJson(json);
}
