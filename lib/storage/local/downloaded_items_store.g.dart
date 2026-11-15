// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_items_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(downloadedItemsStore)
final downloadedItemsStoreProvider = DownloadedItemsStoreProvider._();

final class DownloadedItemsStoreProvider
    extends
        $FunctionalProvider<
          DownloadedItemsStore,
          DownloadedItemsStore,
          DownloadedItemsStore
        >
    with $Provider<DownloadedItemsStore> {
  DownloadedItemsStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadedItemsStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadedItemsStoreHash();

  @$internal
  @override
  $ProviderElement<DownloadedItemsStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DownloadedItemsStore create(Ref ref) {
    return downloadedItemsStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadedItemsStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadedItemsStore>(value),
    );
  }
}

String _$downloadedItemsStoreHash() =>
    r'190817872d3214a8015f857d96a790fd8990ede9';

@ProviderFor(downloadedItem)
final downloadedItemProvider = DownloadedItemFamily._();

final class DownloadedItemProvider
    extends
        $FunctionalProvider<
          AsyncValue<LibraryItem?>,
          LibraryItem?,
          FutureOr<LibraryItem?>
        >
    with $FutureModifier<LibraryItem?>, $FutureProvider<LibraryItem?> {
  DownloadedItemProvider._({
    required DownloadedItemFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'downloadedItemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$downloadedItemHash();

  @override
  String toString() {
    return r'downloadedItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LibraryItem?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LibraryItem?> create(Ref ref) {
    final argument = this.argument as String;
    return downloadedItem(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadedItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$downloadedItemHash() => r'e65b4f4fd570f297773eccf9df6432c5db7f0e0b';

final class DownloadedItemFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LibraryItem?>, String> {
  DownloadedItemFamily._()
    : super(
        retry: null,
        name: r'downloadedItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DownloadedItemProvider call(String id) =>
      DownloadedItemProvider._(argument: id, from: this);

  @override
  String toString() => r'downloadedItemProvider';
}
