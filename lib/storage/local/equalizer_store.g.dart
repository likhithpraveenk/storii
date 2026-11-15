// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equalizer_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(equalizerStore)
final equalizerStoreProvider = EqualizerStoreProvider._();

final class EqualizerStoreProvider
    extends $FunctionalProvider<EqualizerStore, EqualizerStore, EqualizerStore>
    with $Provider<EqualizerStore> {
  EqualizerStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'equalizerStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$equalizerStoreHash();

  @$internal
  @override
  $ProviderElement<EqualizerStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EqualizerStore create(Ref ref) {
    return equalizerStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EqualizerStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EqualizerStore>(value),
    );
  }
}

String _$equalizerStoreHash() => r'0cb68d0fe43aaebdb04c11a9e5f7574897c300f1';

@ProviderFor(storedEqualizerPresets)
final storedEqualizerPresetsProvider = StoredEqualizerPresetsProvider._();

final class StoredEqualizerPresetsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<EqualizerPreset>>,
          List<EqualizerPreset>,
          Stream<List<EqualizerPreset>>
        >
    with
        $FutureModifier<List<EqualizerPreset>>,
        $StreamProvider<List<EqualizerPreset>> {
  StoredEqualizerPresetsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storedEqualizerPresetsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storedEqualizerPresetsHash();

  @$internal
  @override
  $StreamProviderElement<List<EqualizerPreset>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<EqualizerPreset>> create(Ref ref) {
    return storedEqualizerPresets(ref);
  }
}

String _$storedEqualizerPresetsHash() =>
    r'010a02d09992d5b3c5a5e3c03cb699b3c0fc47c6';
