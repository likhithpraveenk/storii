// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equalizer_presets.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(equalizerPresets)
final equalizerPresetsProvider = EqualizerPresetsProvider._();

final class EqualizerPresetsProvider
    extends
        $FunctionalProvider<
          List<EqualizerPreset>,
          List<EqualizerPreset>,
          List<EqualizerPreset>
        >
    with $Provider<List<EqualizerPreset>> {
  EqualizerPresetsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'equalizerPresetsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$equalizerPresetsHash();

  @$internal
  @override
  $ProviderElement<List<EqualizerPreset>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<EqualizerPreset> create(Ref ref) {
    return equalizerPresets(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<EqualizerPreset> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<EqualizerPreset>>(value),
    );
  }
}

String _$equalizerPresetsHash() => r'7d3eed587edca671df85e8099fff4a9c657550fe';

@ProviderFor(currentEqualizerPreset)
final currentEqualizerPresetProvider = CurrentEqualizerPresetProvider._();

final class CurrentEqualizerPresetProvider
    extends
        $FunctionalProvider<EqualizerPreset, EqualizerPreset, EqualizerPreset>
    with $Provider<EqualizerPreset> {
  CurrentEqualizerPresetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentEqualizerPresetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentEqualizerPresetHash();

  @$internal
  @override
  $ProviderElement<EqualizerPreset> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EqualizerPreset create(Ref ref) {
    return currentEqualizerPreset(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EqualizerPreset value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EqualizerPreset>(value),
    );
  }
}

String _$currentEqualizerPresetHash() =>
    r'acc80e1a134b371904595b7cc34812cb76b93972';
