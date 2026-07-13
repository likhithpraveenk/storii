// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_devices.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(castDeviceScanner)
final castDeviceScannerProvider = CastDeviceScannerProvider._();

final class CastDeviceScannerProvider
    extends
        $FunctionalProvider<
          CastDeviceScanner,
          CastDeviceScanner,
          CastDeviceScanner
        >
    with $Provider<CastDeviceScanner> {
  CastDeviceScannerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'castDeviceScannerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$castDeviceScannerHash();

  @$internal
  @override
  $ProviderElement<CastDeviceScanner> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CastDeviceScanner create(Ref ref) {
    return castDeviceScanner(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CastDeviceScanner value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CastDeviceScanner>(value),
    );
  }
}

String _$castDeviceScannerHash() => r'ac0ca37493a1f46330cf52f54379f6cbcd9420c9';

@ProviderFor(CastDevices)
final castDevicesProvider = CastDevicesProvider._();

final class CastDevicesProvider
    extends $StreamNotifierProvider<CastDevices, List<CastDevice>> {
  CastDevicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'castDevicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$castDevicesHash();

  @$internal
  @override
  CastDevices create() => CastDevices();
}

String _$castDevicesHash() => r'ec7bad97d1982d85e4401ef4ce0a53e39e6f6471';

abstract class _$CastDevices extends $StreamNotifier<List<CastDevice>> {
  Stream<List<CastDevice>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<CastDevice>>, List<CastDevice>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<CastDevice>>, List<CastDevice>>,
              AsyncValue<List<CastDevice>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
