import 'package:storii/abs_api/models/models.dart';
import 'package:storii/abs_api/socket/events/socket_events.dart';

class UserSocketEvents extends SocketEvents {
  UserSocketEvents(super.socket);

  Stream<UserItemProgressUpdatedEvent> get onProgressUpdate => onJson(
    'user_item_progress_updated',
    (json) => fromJson(json, UserItemProgressUpdatedEvent.fromJson),
  );
}
