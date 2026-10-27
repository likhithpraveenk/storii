// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_locations_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageLocationsByType)
final storageLocationsByTypeProvider = StorageLocationsByTypeFamily._();

final class StorageLocationsByTypeProvider
    extends
        $FunctionalProvider<
          List<StorageLocation>,
          List<StorageLocation>,
          List<StorageLocation>
        >
    with $Provider<List<StorageLocation>> {
  StorageLocationsByTypeProvider._({
    required StorageLocationsByTypeFamily super.from,
    required MediaType super.argument,
  }) : super(
         retry: null,
         name: r'storageLocationsByTypeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storageLocationsByTypeHash();

  @override
  String toString() {
    return r'storageLocationsByTypeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<StorageLocation>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<StorageLocation> create(Ref ref) {
    final argument = this.argument as MediaType;
    return storageLocationsByType(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<StorageLocation> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<StorageLocation>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StorageLocationsByTypeProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storageLocationsByTypeHash() =>
    r'e7ca092cddacb2b351eb6355dee2a2251ae72914';

final class StorageLocationsByTypeFamily extends $Family
    with $FunctionalFamilyOverride<List<StorageLocation>, MediaType> {
  StorageLocationsByTypeFamily._()
    : super(
        retry: null,
        name: r'storageLocationsByTypeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StorageLocationsByTypeProvider call(MediaType mediaType) =>
      StorageLocationsByTypeProvider._(argument: mediaType, from: this);

  @override
  String toString() => r'storageLocationsByTypeProvider';
}

@ProviderFor(storageSpaceByType)
final storageSpaceByTypeProvider = StorageSpaceByTypeFamily._();

final class StorageSpaceByTypeProvider
    extends
        $FunctionalProvider<
          ({int count, int size}),
          ({int count, int size}),
          ({int count, int size})
        >
    with $Provider<({int count, int size})> {
  StorageSpaceByTypeProvider._({
    required StorageSpaceByTypeFamily super.from,
    required DownloadMediaType super.argument,
  }) : super(
         retry: null,
         name: r'storageSpaceByTypeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storageSpaceByTypeHash();

  @override
  String toString() {
    return r'storageSpaceByTypeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<({int count, int size})> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ({int count, int size}) create(Ref ref) {
    final argument = this.argument as DownloadMediaType;
    return storageSpaceByType(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(({int count, int size}) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<({int count, int size})>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StorageSpaceByTypeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storageSpaceByTypeHash() =>
    r'63c721a80afef6ff26fa2011d34332a5955cd352';

final class StorageSpaceByTypeFamily extends $Family
    with $FunctionalFamilyOverride<({int count, int size}), DownloadMediaType> {
  StorageSpaceByTypeFamily._()
    : super(
        retry: null,
        name: r'storageSpaceByTypeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StorageSpaceByTypeProvider call(DownloadMediaType mediaType) =>
      StorageSpaceByTypeProvider._(argument: mediaType, from: this);

  @override
  String toString() => r'storageSpaceByTypeProvider';
}

@ProviderFor(storageBytesByLocation)
final storageBytesByLocationProvider = StorageBytesByLocationFamily._();

final class StorageBytesByLocationProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  StorageBytesByLocationProvider._({
    required StorageBytesByLocationFamily super.from,
    required StorageLocation super.argument,
  }) : super(
         retry: null,
         name: r'storageBytesByLocationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storageBytesByLocationHash();

  @override
  String toString() {
    return r'storageBytesByLocationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as StorageLocation;
    return storageBytesByLocation(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StorageBytesByLocationProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storageBytesByLocationHash() =>
    r'7a506298e337e9be6e93c8229904cd747803a5be';

final class StorageBytesByLocationFamily extends $Family
    with $FunctionalFamilyOverride<int, StorageLocation> {
  StorageBytesByLocationFamily._()
    : super(
        retry: null,
        name: r'storageBytesByLocationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StorageBytesByLocationProvider call(StorageLocation location) =>
      StorageBytesByLocationProvider._(argument: location, from: this);

  @override
  String toString() => r'storageBytesByLocationProvider';
}
