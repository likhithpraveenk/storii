// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(packageInfo)
final packageInfoProvider = PackageInfoProvider._();

final class PackageInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<PackageInfo>,
          PackageInfo,
          FutureOr<PackageInfo>
        >
    with $FutureModifier<PackageInfo>, $FutureProvider<PackageInfo> {
  PackageInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packageInfoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packageInfoHash();

  @$internal
  @override
  $FutureProviderElement<PackageInfo> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PackageInfo> create(Ref ref) {
    return packageInfo(ref);
  }
}

String _$packageInfoHash() => r'f1c17d5174896e536210506ee5ade32f9766a6b9';

@ProviderFor(deviceInfo)
final deviceInfoProvider = DeviceInfoProvider._();

final class DeviceInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<BaseDeviceInfo>,
          BaseDeviceInfo,
          FutureOr<BaseDeviceInfo>
        >
    with $FutureModifier<BaseDeviceInfo>, $FutureProvider<BaseDeviceInfo> {
  DeviceInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceInfoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceInfoHash();

  @$internal
  @override
  $FutureProviderElement<BaseDeviceInfo> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BaseDeviceInfo> create(Ref ref) {
    return deviceInfo(ref);
  }
}

String _$deviceInfoHash() => r'e496c35b2be10cf5ffa498bb25c3ea6d31d0b571';

@ProviderFor(deviceInfoString)
final deviceInfoStringProvider = DeviceInfoStringProvider._();

final class DeviceInfoStringProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  DeviceInfoStringProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceInfoStringProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceInfoStringHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return deviceInfoString(ref);
  }
}

String _$deviceInfoStringHash() => r'3d0e661db3caf0310ae28307b46dc6c871412340';
