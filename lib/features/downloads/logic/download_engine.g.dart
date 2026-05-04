// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_engine.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadEngine)
final downloadEngineProvider = DownloadEngineProvider._();

final class DownloadEngineProvider
    extends $NotifierProvider<DownloadEngine, void> {
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
  DownloadEngine create() => DownloadEngine();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$downloadEngineHash() => r'1ec9a064dab8f5eb17418c65cb606c1587b2614a';

abstract class _$DownloadEngine extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
