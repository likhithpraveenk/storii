import 'package:abs_api/src/models/metadata_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata_providers_response.freezed.dart';
part 'metadata_providers_response.g.dart';

@freezed
sealed class MetadataProvidersResponse with _$MetadataProvidersResponse {
  const factory MetadataProvidersResponse({
    @Default([]) List<MetadataProvider> books,
    @Default([]) List<MetadataProvider> booksCovers,
    @Default([]) List<MetadataProvider> podcasts,
  }) = _MetadataProvidersResponse;

  factory MetadataProvidersResponse.fromJson(Map<String, dynamic> json) =>
      _$MetadataProvidersResponseFromJson(json);
}
