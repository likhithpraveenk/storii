// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_auto_delete.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadAutoDeleteWatcher)
final downloadAutoDeleteWatcherProvider = DownloadAutoDeleteWatcherProvider._();

final class DownloadAutoDeleteWatcherProvider
    extends $NotifierProvider<DownloadAutoDeleteWatcher, void> {
  DownloadAutoDeleteWatcherProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadAutoDeleteWatcherProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadAutoDeleteWatcherHash();

  @$internal
  @override
  DownloadAutoDeleteWatcher create() => DownloadAutoDeleteWatcher();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$downloadAutoDeleteWatcherHash() =>
    r'2278ef3dcc643096ff437eca1ebd1a3aed8f0e0c';

abstract class _$DownloadAutoDeleteWatcher extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
