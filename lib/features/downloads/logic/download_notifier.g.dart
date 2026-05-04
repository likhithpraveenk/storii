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

String _$downloadsNotifierHash() => r'36bd5557fe1d9e48ffe7cc777f426c85f480b90d';

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

@ProviderFor(activeDownloads)
final activeDownloadsProvider = ActiveDownloadsProvider._();

final class ActiveDownloadsProvider
    extends
        $FunctionalProvider<
          List<DownloadItem>,
          List<DownloadItem>,
          List<DownloadItem>
        >
    with $Provider<List<DownloadItem>> {
  ActiveDownloadsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeDownloadsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeDownloadsHash();

  @$internal
  @override
  $ProviderElement<List<DownloadItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<DownloadItem> create(Ref ref) {
    return activeDownloads(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DownloadItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DownloadItem>>(value),
    );
  }
}

String _$activeDownloadsHash() => r'e078818e1f12a071f285c36e63eed3ae3cd7a097';

@ProviderFor(completedDownloads)
final completedDownloadsProvider = CompletedDownloadsProvider._();

final class CompletedDownloadsProvider
    extends
        $FunctionalProvider<
          List<DownloadItem>,
          List<DownloadItem>,
          List<DownloadItem>
        >
    with $Provider<List<DownloadItem>> {
  CompletedDownloadsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'completedDownloadsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$completedDownloadsHash();

  @$internal
  @override
  $ProviderElement<List<DownloadItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<DownloadItem> create(Ref ref) {
    return completedDownloads(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DownloadItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DownloadItem>>(value),
    );
  }
}

String _$completedDownloadsHash() =>
    r'0321fbf308e310273dffb4ce118480598c750645';
