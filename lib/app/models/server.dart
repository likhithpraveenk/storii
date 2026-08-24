import 'package:freezed_annotation/freezed_annotation.dart';

part 'server.freezed.dart';
part 'server.g.dart';

@freezed
sealed class Server with _$Server {
  const factory({
    required String id,
    required Uri url,
    @Default({}) Map<String, String> headers,
  }) = _Server;

  factory fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);
}
