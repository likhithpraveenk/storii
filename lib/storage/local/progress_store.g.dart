// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProgressStore)
final progressStoreProvider = ProgressStoreFamily._();

final class ProgressStoreProvider
    extends $StreamNotifierProvider<ProgressStore, Map<String, MediaProgress>> {
  ProgressStoreProvider._({
    required ProgressStoreFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'progressStoreProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$progressStoreHash();

  @override
  String toString() {
    return r'progressStoreProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProgressStore create() => ProgressStore();

  @override
  bool operator ==(Object other) {
    return other is ProgressStoreProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$progressStoreHash() => r'cf8d623a573ac6aab56ee03c819cef9172f461dd';

final class ProgressStoreFamily extends $Family
    with
        $ClassFamilyOverride<
          ProgressStore,
          AsyncValue<Map<String, MediaProgress>>,
          Map<String, MediaProgress>,
          Stream<Map<String, MediaProgress>>,
          String
        > {
  ProgressStoreFamily._()
    : super(
        retry: null,
        name: r'progressStoreProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ProgressStoreProvider call(String userId) =>
      ProgressStoreProvider._(argument: userId, from: this);

  @override
  String toString() => r'progressStoreProvider';
}

abstract class _$ProgressStore
    extends $StreamNotifier<Map<String, MediaProgress>> {
  late final _$args = ref.$arg as String;
  String get userId => _$args;

  Stream<Map<String, MediaProgress>> build(String userId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, MediaProgress>>,
              Map<String, MediaProgress>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, MediaProgress>>,
                Map<String, MediaProgress>
              >,
              AsyncValue<Map<String, MediaProgress>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
