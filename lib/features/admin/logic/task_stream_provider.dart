import 'dart:async';

import 'package:abs_api/abs_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';

part 'task_stream_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<Task> taskStart(Ref ref) async* {
  final user = await ref.watch(authenticatedUserProvider.future);
  final socket = await ref.watch(socketApiProvider(user).future);
  yield* socket.taskEvents.onTaskStart;
}

@Riverpod(keepAlive: true)
Stream<Task> taskUpdate(Ref ref) async* {
  final user = await ref.watch(authenticatedUserProvider.future);
  final socket = await ref.watch(socketApiProvider(user).future);
  yield* socket.taskEvents.onTaskUpdate;
}

@Riverpod(keepAlive: true)
Stream<Task> taskComplete(Ref ref) async* {
  final user = await ref.watch(authenticatedUserProvider.future);
  final socket = await ref.watch(socketApiProvider(user).future);
  yield* socket.taskEvents.onTaskComplete;
}
