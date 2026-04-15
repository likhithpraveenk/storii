// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadsNotifier)
final downloadsProvider = DownloadsNotifierProvider._();

final class DownloadsNotifierProvider
    extends $NotifierProvider<DownloadsNotifier, Map<String, DownloadItem>> {
  DownloadsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadsNotifierHash();

  @$internal
  @override
  DownloadsNotifier create() => DownloadsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, DownloadItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, DownloadItem>>(value),
    );
  }
}

String _$downloadsNotifierHash() => r'5fc7f5860057bff695470056e96b56d6960aa569';

abstract class _$DownloadsNotifier
    extends $Notifier<Map<String, DownloadItem>> {
  Map<String, DownloadItem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<Map<String, DownloadItem>, Map<String, DownloadItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, DownloadItem>, Map<String, DownloadItem>>,
              Map<String, DownloadItem>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
