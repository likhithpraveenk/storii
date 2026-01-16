import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/abs_api/models/users/media_progress.dart';

part 'user_item_progress_updated_event.freezed.dart';
part 'user_item_progress_updated_event.g.dart';

@freezed
abstract class UserItemProgressUpdatedEvent
    with _$UserItemProgressUpdatedEvent {
  const factory UserItemProgressUpdatedEvent({
    required String id,
    required MediaProgress data,
  }) = _UserItemProgressUpdatedEvent;

  factory UserItemProgressUpdatedEvent.fromJson(Map<String, dynamic> json) =>
      _$UserItemProgressUpdatedEventFromJson(json);
}
