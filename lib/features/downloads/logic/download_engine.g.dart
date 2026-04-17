// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_engine.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(downloadEngine)
final downloadEngineProvider = DownloadEngineProvider._();

final class DownloadEngineProvider
    extends $FunctionalProvider<DownloadEngine, DownloadEngine, DownloadEngine>
    with $Provider<DownloadEngine> {
  DownloadEngineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadEngineProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadEngineHash();

  @$internal
  @override
  $ProviderElement<DownloadEngine> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DownloadEngine create(Ref ref) {
    return downloadEngine(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadEngine value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadEngine>(value),
    );
  }
}

String _$downloadEngineHash() => r'231467fbaf9adf182a56e166766d37a308f1b91b';
