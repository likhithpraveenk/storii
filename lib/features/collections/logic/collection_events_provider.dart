import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';

part 'collection_events_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<Collection> collectionAdded(Ref ref) async* {
  final user = await ref.watch(authenticatedUserProvider.future);
  final socket = await ref.watch(socketApiProvider(user).future);
  yield* socket.collectionEvents.onCollectionAdded;
}

@Riverpod(keepAlive: true)
Stream<Collection> collectionUpdated(Ref ref) async* {
  final user = await ref.watch(authenticatedUserProvider.future);
  final socket = await ref.watch(socketApiProvider(user).future);
  yield* socket.collectionEvents.onCollectionUpdated;
}

@Riverpod(keepAlive: true)
Stream<Collection> collectionRemoved(Ref ref) async* {
  final user = await ref.watch(authenticatedUserProvider.future);
  final socket = await ref.watch(socketApiProvider(user).future);
  yield* socket.collectionEvents.onCollectionRemoved;
}
