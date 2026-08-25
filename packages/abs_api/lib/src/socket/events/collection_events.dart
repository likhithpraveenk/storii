import 'package:abs_api/src/models/models.dart';
import 'package:abs_api/src/socket/events/socket_events.dart';

class CollectionEvents extends SocketEvents {
  new(super.socket);

  Stream<Collection> _onCollectionEvent(String event) => onJson(
    'collection_$event',
    (json) => fromJson(json, Collection.fromJson),
  );

  Stream<Collection> get onCollectionAdded => _onCollectionEvent('added');

  Stream<Collection> get onCollectionUpdated => _onCollectionEvent('updated');

  Stream<Collection> get onCollectionRemoved => _onCollectionEvent('removed');
}
