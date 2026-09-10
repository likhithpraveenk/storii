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
