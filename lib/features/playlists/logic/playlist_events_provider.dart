import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';

part 'playlist_events_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<Playlist> playlistAdded(Ref ref) async* {
  final user = await ref.watch(authenticatedUserProvider.future);
  final socket = await ref.watch(socketApiProvider(user).future);
  yield* socket.playlistEvents.onPlaylistAdded;
}

@Riverpod(keepAlive: true)
Stream<Playlist> playlistUpdated(Ref ref) async* {
  final user = await ref.watch(authenticatedUserProvider.future);
  final socket = await ref.watch(socketApiProvider(user).future);
  yield* socket.playlistEvents.onPlaylistUpdated;
}

@Riverpod(keepAlive: true)
Stream<Playlist> playlistRemoved(Ref ref) async* {
  final user = await ref.watch(authenticatedUserProvider.future);
  final socket = await ref.watch(socketApiProvider(user).future);
  yield* socket.playlistEvents.onPlaylistRemoved;
}
