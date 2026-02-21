import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/filter.dart';
import 'package:storii/abs_api/models/json_converters.dart';

part 'authors_request_params.freezed.dart';
part 'authors_request_params.g.dart';

@freezed
abstract class AuthorsRequestParams with _$AuthorsRequestParams {
  const AuthorsRequestParams._();

  const factory AuthorsRequestParams({
    String? sort,
    @BoolBinaryConverter() bool? desc,
    @FilterConverter() Filter? filter,
  }) = _AuthorsRequestParams;

  factory AuthorsRequestParams.fromJson(Map<String, dynamic> json) =>
      _$AuthorsRequestParamsFromJson(json);
}
