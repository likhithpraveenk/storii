// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProgressStore)
final progressStoreProvider = ProgressStoreProvider._();

final class ProgressStoreProvider
    extends $StreamNotifierProvider<ProgressStore, Map<String, MediaProgress>> {
  ProgressStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'progressStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$progressStoreHash();

  @$internal
  @override
  ProgressStore create() => ProgressStore();
}

String _$progressStoreHash() => r'cac76f991844e9eec3ff13b75987e68417883b84';

abstract class _$ProgressStore
    extends $StreamNotifier<Map<String, MediaProgress>> {
  Stream<Map<String, MediaProgress>> build();
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
    return element.handleCreate(ref, build);
  }
}
