// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(downloadsStore)
final downloadsStoreProvider = DownloadsStoreProvider._();

final class DownloadsStoreProvider
    extends $FunctionalProvider<DownloadsStore, DownloadsStore, DownloadsStore>
    with $Provider<DownloadsStore> {
  DownloadsStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadsStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadsStoreHash();

  @$internal
  @override
  $ProviderElement<DownloadsStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DownloadsStore create(Ref ref) {
    return downloadsStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadsStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadsStore>(value),
    );
  }
}

String _$downloadsStoreHash() => r'bbad505dc26a49547cfd5b5f38d4b3af8059cba0';

@ProviderFor(downloads)
final downloadsProvider = DownloadsProvider._();

final class DownloadsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, DownloadItem>>,
          Map<String, DownloadItem>,
          Stream<Map<String, DownloadItem>>
        >
    with
        $FutureModifier<Map<String, DownloadItem>>,
        $StreamProvider<Map<String, DownloadItem>> {
  DownloadsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadsHash();

  @$internal
  @override
  $StreamProviderElement<Map<String, DownloadItem>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, DownloadItem>> create(Ref ref) {
    return downloads(ref);
  }
}

String _$downloadsHash() => r'4ddce7893039daa9b359fe13626fbb84a0c2e705';
