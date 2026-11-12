// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_delete_exclusion_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(autoDeleteExclusionStore)
final autoDeleteExclusionStoreProvider = AutoDeleteExclusionStoreProvider._();

final class AutoDeleteExclusionStoreProvider
    extends
        $FunctionalProvider<
          AutoDeleteExclusionStore,
          AutoDeleteExclusionStore,
          AutoDeleteExclusionStore
        >
    with $Provider<AutoDeleteExclusionStore> {
  AutoDeleteExclusionStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autoDeleteExclusionStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autoDeleteExclusionStoreHash();

  @$internal
  @override
  $ProviderElement<AutoDeleteExclusionStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AutoDeleteExclusionStore create(Ref ref) {
    return autoDeleteExclusionStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AutoDeleteExclusionStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AutoDeleteExclusionStore>(value),
    );
  }
}

String _$autoDeleteExclusionStoreHash() =>
    r'ad10fe76ccc4f8b1e9a6c9a9cf60877e91c3fcb3';

@ProviderFor(autoDeleteExclusions)
final autoDeleteExclusionsProvider = AutoDeleteExclusionsProvider._();

final class AutoDeleteExclusionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Set<String>>,
          Set<String>,
          Stream<Set<String>>
        >
    with $FutureModifier<Set<String>>, $StreamProvider<Set<String>> {
  AutoDeleteExclusionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autoDeleteExclusionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autoDeleteExclusionsHash();

  @$internal
  @override
  $StreamProviderElement<Set<String>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Set<String>> create(Ref ref) {
    return autoDeleteExclusions(ref);
  }
}

String _$autoDeleteExclusionsHash() =>
    r'4e05011e99780c6ccc681d2257216dd1f1202471';
