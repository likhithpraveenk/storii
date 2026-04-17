// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(downloadStorage)
final downloadStorageProvider = DownloadStorageProvider._();

final class DownloadStorageProvider
    extends
        $FunctionalProvider<DownloadStorage, DownloadStorage, DownloadStorage>
    with $Provider<DownloadStorage> {
  DownloadStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadStorageHash();

  @$internal
  @override
  $ProviderElement<DownloadStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DownloadStorage create(Ref ref) {
    return downloadStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadStorage>(value),
    );
  }
}

String _$downloadStorageHash() => r'4ff3220c2deca50847ee28b0ab7b0f3b54d68c4e';
