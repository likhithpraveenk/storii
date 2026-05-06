// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadsNotifier)
final downloadsProvider = DownloadsNotifierProvider._();

final class DownloadsNotifierProvider
    extends
        $StreamNotifierProvider<DownloadsNotifier, Map<String, DownloadItem>> {
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
}

String _$downloadsNotifierHash() => r'bf984ac73f85e36471a554f664a74584a76fa320';

abstract class _$DownloadsNotifier
    extends $StreamNotifier<Map<String, DownloadItem>> {
  Stream<Map<String, DownloadItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
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
    element.handleCreate(ref, build);
  }
}

@ProviderFor(downloadItem)
final downloadItemProvider = DownloadItemFamily._();

final class DownloadItemProvider
    extends $FunctionalProvider<DownloadItem?, DownloadItem?, DownloadItem?>
    with $Provider<DownloadItem?> {
  DownloadItemProvider._({
    required DownloadItemFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'downloadItemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$downloadItemHash();

  @override
  String toString() {
    return r'downloadItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<DownloadItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DownloadItem? create(Ref ref) {
    final argument = this.argument as String;
    return downloadItem(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$downloadItemHash() => r'499beb39a7cbd2cf65e9518a2dac476c16938e06';

final class DownloadItemFamily extends $Family
    with $FunctionalFamilyOverride<DownloadItem?, String> {
  DownloadItemFamily._()
    : super(
        retry: null,
        name: r'downloadItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DownloadItemProvider call(String libraryItemId) =>
      DownloadItemProvider._(argument: libraryItemId, from: this);

  @override
  String toString() => r'downloadItemProvider';
}

@ProviderFor(activeDownloads)
final activeDownloadsProvider = ActiveDownloadsProvider._();

final class ActiveDownloadsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DownloadItem>>,
          List<DownloadItem>,
          Stream<List<DownloadItem>>
        >
    with
        $FutureModifier<List<DownloadItem>>,
        $StreamProvider<List<DownloadItem>> {
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
  $StreamProviderElement<List<DownloadItem>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<DownloadItem>> create(Ref ref) {
    return activeDownloads(ref);
  }
}

String _$activeDownloadsHash() => r'c8d98c227c5fb6b021f66faca42d3eebdfe10485';

@ProviderFor(completedDownloads)
final completedDownloadsProvider = CompletedDownloadsProvider._();

final class CompletedDownloadsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DownloadItem>>,
          List<DownloadItem>,
          Stream<List<DownloadItem>>
        >
    with
        $FutureModifier<List<DownloadItem>>,
        $StreamProvider<List<DownloadItem>> {
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
  $StreamProviderElement<List<DownloadItem>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<DownloadItem>> create(Ref ref) {
    return completedDownloads(ref);
  }
}

String _$completedDownloadsHash() =>
    r'17580ae18ebbffb94e3e65c5bfc405ea6b07a15f';
