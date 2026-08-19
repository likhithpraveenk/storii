// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadsStore)
final downloadsStoreProvider = DownloadsStoreProvider._();

final class DownloadsStoreProvider
    extends $StreamNotifierProvider<DownloadsStore, Map<String, DownloadItem>> {
  DownloadsStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadsStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadsStoreHash();

  @$internal
  @override
  DownloadsStore create() => DownloadsStore();
}

String _$downloadsStoreHash() => r'8967a460ddfac37e120fcc7a7de0286bed9453b5';

abstract class _$DownloadsStore
    extends $StreamNotifier<Map<String, DownloadItem>> {
  Stream<Map<String, DownloadItem>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, DownloadItem>>,
              Map<String, DownloadItem>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, DownloadItem>>,
                Map<String, DownloadItem>
              >,
              AsyncValue<Map<String, DownloadItem>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
