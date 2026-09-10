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

@ProviderFor(isItemFullyDownloaded)
final isItemFullyDownloadedProvider = IsItemFullyDownloadedFamily._();

final class IsItemFullyDownloadedProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  IsItemFullyDownloadedProvider._({
    required IsItemFullyDownloadedFamily super.from,
    required DownloadItem super.argument,
  }) : super(
         retry: null,
         name: r'isItemFullyDownloadedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isItemFullyDownloadedHash();

  @override
  String toString() {
    return r'isItemFullyDownloadedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as DownloadItem;
    return isItemFullyDownloaded(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IsItemFullyDownloadedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isItemFullyDownloadedHash() =>
    r'c1424052a6ed5eb3166bd14e559b046841796cb7';

final class IsItemFullyDownloadedFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, DownloadItem> {
  IsItemFullyDownloadedFamily._()
    : super(
        retry: null,
        name: r'isItemFullyDownloadedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsItemFullyDownloadedProvider call(DownloadItem item) =>
      IsItemFullyDownloadedProvider._(argument: item, from: this);

  @override
  String toString() => r'isItemFullyDownloadedProvider';
}

@ProviderFor(resolveLocalPaths)
final resolveLocalPathsProvider = ResolveLocalPathsFamily._();

final class ResolveLocalPathsProvider
    extends
        $FunctionalProvider<
          AsyncValue<(Map<int, String>, String?)>,
          (Map<int, String>, String?),
          FutureOr<(Map<int, String>, String?)>
        >
    with
        $FutureModifier<(Map<int, String>, String?)>,
        $FutureProvider<(Map<int, String>, String?)> {
  ResolveLocalPathsProvider._({
    required ResolveLocalPathsFamily super.from,
    required PlaybackSession super.argument,
  }) : super(
         retry: null,
         name: r'resolveLocalPathsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$resolveLocalPathsHash();

  @override
  String toString() {
    return r'resolveLocalPathsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<(Map<int, String>, String?)> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<(Map<int, String>, String?)> create(Ref ref) {
    final argument = this.argument as PlaybackSession;
    return resolveLocalPaths(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ResolveLocalPathsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$resolveLocalPathsHash() => r'df1a1e6f26f8509bb2d0514e42808c8ddc90842f';

final class ResolveLocalPathsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<(Map<int, String>, String?)>,
          PlaybackSession
        > {
  ResolveLocalPathsFamily._()
    : super(
        retry: null,
        name: r'resolveLocalPathsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ResolveLocalPathsProvider call(PlaybackSession session) =>
      ResolveLocalPathsProvider._(argument: session, from: this);

  @override
  String toString() => r'resolveLocalPathsProvider';
}
