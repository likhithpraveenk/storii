import 'package:freezed_annotation/freezed_annotation.dart';

part 'server.freezed.dart';

@freezed
sealed class Server with _$Server {
  const factory Server({required Uri url}) = _Server;
}
