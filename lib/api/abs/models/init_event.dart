import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/user.dart';

part 'init_event.freezed.dart';
part 'init_event.g.dart';

@freezed
sealed class InitEvent with _$InitEvent {
  const factory({
    required String userId,
    required String username,
    @Default([]) List<UserMinimal> usersOnline,
  }) = _InitEvent;

  factory fromJson(Map<String, dynamic> json) => _$InitEventFromJson(json);
}
