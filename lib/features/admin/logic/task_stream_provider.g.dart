// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_stream_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(taskStart)
final taskStartProvider = TaskStartProvider._();

final class TaskStartProvider
    extends $FunctionalProvider<AsyncValue<Task>, Task, Stream<Task>>
    with $FutureModifier<Task>, $StreamProvider<Task> {
  TaskStartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskStartProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskStartHash();

  @$internal
  @override
  $StreamProviderElement<Task> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Task> create(Ref ref) {
    return taskStart(ref);
  }
}

String _$taskStartHash() => r'1598ce469d0dbd18f2c48176678c2246e2ca7c48';

@ProviderFor(taskUpdate)
final taskUpdateProvider = TaskUpdateProvider._();

final class TaskUpdateProvider
    extends $FunctionalProvider<AsyncValue<Task>, Task, Stream<Task>>
    with $FutureModifier<Task>, $StreamProvider<Task> {
  TaskUpdateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskUpdateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskUpdateHash();

  @$internal
  @override
  $StreamProviderElement<Task> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Task> create(Ref ref) {
    return taskUpdate(ref);
  }
}

String _$taskUpdateHash() => r'dbed17bd78f647db4939d71b16f9b528b2362562';

@ProviderFor(taskComplete)
final taskCompleteProvider = TaskCompleteProvider._();

final class TaskCompleteProvider
    extends $FunctionalProvider<AsyncValue<Task>, Task, Stream<Task>>
    with $FutureModifier<Task>, $StreamProvider<Task> {
  TaskCompleteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskCompleteProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskCompleteHash();

  @$internal
  @override
  $StreamProviderElement<Task> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Task> create(Ref ref) {
    return taskComplete(ref);
  }
}

String _$taskCompleteHash() => r'3ad3c8e0469f99bf06c71b0e7931e654fe72b3f4';
