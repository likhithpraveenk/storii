import 'package:abs_api/src/models/models.dart';
import 'package:abs_api/src/socket/events/socket_events.dart';

class UserSocketEvents extends SocketEvents {
  UserSocketEvents(super.socket);

  Stream<User> get onUserUpdated =>
      onJson('user_updated', (json) => fromJson(json, User.fromJson));

  Stream<UserItemProgressUpdatedEvent> get onProgressUpdate => onJson(
    'user_item_progress_updated',
    (json) => fromJson(json, UserItemProgressUpdatedEvent.fromJson),
  );
}
