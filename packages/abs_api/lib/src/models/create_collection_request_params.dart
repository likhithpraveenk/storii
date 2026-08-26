import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_collection_request_params.freezed.dart';
part 'create_collection_request_params.g.dart';

@freezed
sealed class CreateCollectionRequestParams
    with _$CreateCollectionRequestParams {
  const factory({
    required String libraryId,
    required String name,
    required List<String> books,
  }) = _CreateCollectionRequestParams;

  factory fromJson(Map<String, dynamic> json) =>
      _$CreateCollectionRequestParamsFromJson(json);
}
