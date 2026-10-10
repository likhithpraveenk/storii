import 'package:abs_api/src/models/models.dart';
import 'package:abs_api/src/socket/events/socket_events.dart';

class ItemEvents extends SocketEvents {
  new(super.socket);

  Stream<LibraryItem> _onItemEvent(String event) =>
      onJson('item_$event', (json) => fromJson(json, LibraryItem.fromJson));

  // Stream<LibraryItem> get onItemAdded => _onItemEvent('added');

  Stream<LibraryItem> get onItemUpdated => _onItemEvent('updated');
}
