// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadSortTypeNotifier)
final downloadSortTypeProvider = DownloadSortTypeNotifierProvider._();

final class DownloadSortTypeNotifierProvider
    extends $NotifierProvider<DownloadSortTypeNotifier, DownloadSortType> {
  DownloadSortTypeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadSortTypeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadSortTypeNotifierHash();

  @$internal
  @override
  DownloadSortTypeNotifier create() => DownloadSortTypeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadSortType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadSortType>(value),
    );
  }
}

String _$downloadSortTypeNotifierHash() =>
    r'575726cfdfdf345f7d5afc01e4d86c856981c2cb';

abstract class _$DownloadSortTypeNotifier extends $Notifier<DownloadSortType> {
  DownloadSortType build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DownloadSortType, DownloadSortType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DownloadSortType, DownloadSortType>,
              DownloadSortType,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(DownloadSortAscending)
final downloadSortAscendingProvider = DownloadSortAscendingProvider._();

final class DownloadSortAscendingProvider
    extends $NotifierProvider<DownloadSortAscending, bool> {
  DownloadSortAscendingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadSortAscendingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadSortAscendingHash();

  @$internal
  @override
  DownloadSortAscending create() => DownloadSortAscending();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$downloadSortAscendingHash() =>
    r'8dd255862e907b40a1469e11164b49c4c60b4c80';

abstract class _$DownloadSortAscending extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

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
        isAutoDispose: false,
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

String _$downloadsHash() => r'62cd18e91b41c5412085b1e894abeb9ba4e4d97f';

@ProviderFor(downloadItem)
final downloadItemProvider = DownloadItemFamily._();

final class DownloadItemProvider
    extends $FunctionalProvider<DownloadItem?, DownloadItem?, DownloadItem?>
    with $Provider<DownloadItem?> {
  DownloadItemProvider._({
    required DownloadItemFamily super.from,
    required (String, String?) super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<DownloadItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DownloadItem? create(Ref ref) {
    final argument = this.argument as (String, String?);
    return downloadItem(ref, argument.$1, argument.$2);
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

String _$downloadItemHash() => r'c5e510e3296111b95c91030dd93e4b3c30f6ee44';

final class DownloadItemFamily extends $Family
    with $FunctionalFamilyOverride<DownloadItem?, (String, String?)> {
  DownloadItemFamily._()
    : super(
        retry: null,
        name: r'downloadItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DownloadItemProvider call(String libraryItemId, [String? episodeId]) =>
      DownloadItemProvider._(argument: (libraryItemId, episodeId), from: this);

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

String _$activeDownloadsHash() => r'b21c671d3f9f0343759aff0786e2a78229ee50aa';

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

@ProviderFor(downloadQueuePosition)
final downloadQueuePositionProvider = DownloadQueuePositionFamily._();

final class DownloadQueuePositionProvider
    extends $FunctionalProvider<AsyncValue<int?>, int?, FutureOr<int?>>
    with $FutureModifier<int?>, $FutureProvider<int?> {
  DownloadQueuePositionProvider._({
    required DownloadQueuePositionFamily super.from,
    required (String, String?) super.argument,
  }) : super(
         retry: null,
         name: r'downloadQueuePositionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$downloadQueuePositionHash();

  @override
  String toString() {
    return r'downloadQueuePositionProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<int?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int?> create(Ref ref) {
    final argument = this.argument as (String, String?);
    return downloadQueuePosition(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadQueuePositionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$downloadQueuePositionHash() =>
    r'839c2b9d6667063ecf4e4ec664a3f078068cf90d';

final class DownloadQueuePositionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<int?>, (String, String?)> {
  DownloadQueuePositionFamily._()
    : super(
        retry: null,
        name: r'downloadQueuePositionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DownloadQueuePositionProvider call(
    String libraryItemId, [
    String? episodeId,
  ]) => DownloadQueuePositionProvider._(
    argument: (libraryItemId, episodeId),
    from: this,
  );

  @override
  String toString() => r'downloadQueuePositionProvider';
}

@ProviderFor(sortedCompletedDownloads)
final sortedCompletedDownloadsProvider = SortedCompletedDownloadsProvider._();

final class SortedCompletedDownloadsProvider
    extends
        $FunctionalProvider<
          List<DownloadItem>,
          List<DownloadItem>,
          List<DownloadItem>
        >
    with $Provider<List<DownloadItem>> {
  SortedCompletedDownloadsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortedCompletedDownloadsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortedCompletedDownloadsHash();

  @$internal
  @override
  $ProviderElement<List<DownloadItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<DownloadItem> create(Ref ref) {
    return sortedCompletedDownloads(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DownloadItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DownloadItem>>(value),
    );
  }
}

String _$sortedCompletedDownloadsHash() =>
    r'2a391cd3faf87a3bc77a0bed99e69e351870a252';

@ProviderFor(downloadedItems)
final downloadedItemsProvider = DownloadedItemsProvider._();

final class DownloadedItemsProvider
    extends
        $FunctionalProvider<
          List<LibraryItem>,
          List<LibraryItem>,
          List<LibraryItem>
        >
    with $Provider<List<LibraryItem>> {
  DownloadedItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadedItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadedItemsHash();

  @$internal
  @override
  $ProviderElement<List<LibraryItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<LibraryItem> create(Ref ref) {
    return downloadedItems(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LibraryItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LibraryItem>>(value),
    );
  }
}

String _$downloadedItemsHash() => r'57f65289cdefded306de0c797ace17822209a19c';
