// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageService)
final storageServiceProvider = StorageServiceFamily._();

final class StorageServiceProvider
    extends $FunctionalProvider<StorageService, StorageService, StorageService>
    with $Provider<StorageService> {
  StorageServiceProvider._({
    required StorageServiceFamily super.from,
    required StorageLocation super.argument,
  }) : super(
         retry: null,
         name: r'storageServiceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storageServiceHash();

  @override
  String toString() {
    return r'storageServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<StorageService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StorageService create(Ref ref) {
    final argument = this.argument as StorageLocation;
    return storageService(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StorageService>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StorageServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storageServiceHash() => r'3fbbb0c40088bb3c6e26972466dfcdbe46ab853f';

final class StorageServiceFamily extends $Family
    with $FunctionalFamilyOverride<StorageService, StorageLocation> {
  StorageServiceFamily._()
    : super(
        retry: null,
        name: r'storageServiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StorageServiceProvider call(StorageLocation location) =>
      StorageServiceProvider._(argument: location, from: this);

  @override
  String toString() => r'storageServiceProvider';
}

@ProviderFor(storageServiceForItem)
final storageServiceForItemProvider = StorageServiceForItemFamily._();

final class StorageServiceForItemProvider
    extends
        $FunctionalProvider<StorageService?, StorageService?, StorageService?>
    with $Provider<StorageService?> {
  StorageServiceForItemProvider._({
    required StorageServiceForItemFamily super.from,
    required DownloadItem? super.argument,
  }) : super(
         retry: null,
         name: r'storageServiceForItemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storageServiceForItemHash();

  @override
  String toString() {
    return r'storageServiceForItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<StorageService?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StorageService? create(Ref ref) {
    final argument = this.argument as DownloadItem?;
    return storageServiceForItem(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StorageService? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StorageService?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StorageServiceForItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storageServiceForItemHash() =>
    r'292e954b05c40644b56313f97c7e5576596afc20';

final class StorageServiceForItemFamily extends $Family
    with $FunctionalFamilyOverride<StorageService?, DownloadItem?> {
  StorageServiceForItemFamily._()
    : super(
        retry: null,
        name: r'storageServiceForItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StorageServiceForItemProvider call(DownloadItem? item) =>
      StorageServiceForItemProvider._(argument: item, from: this);

  @override
  String toString() => r'storageServiceForItemProvider';
}
