// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadSortNotifier)
final downloadSortProvider = DownloadSortNotifierProvider._();

final class DownloadSortNotifierProvider
    extends $NotifierProvider<DownloadSortNotifier, DownloadSort> {
  DownloadSortNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadSortProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadSortNotifierHash();

  @$internal
  @override
  DownloadSortNotifier create() => DownloadSortNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadSort value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadSort>(value),
    );
  }
}

String _$downloadSortNotifierHash() =>
    r'ccabd934a5cb249dadc9c62418a07072a43f2a6a';

abstract class _$DownloadSortNotifier extends $Notifier<DownloadSort> {
  DownloadSort build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DownloadSort, DownloadSort>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DownloadSort, DownloadSort>,
              DownloadSort,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(DownloadSortAsc)
final downloadSortAscProvider = DownloadSortAscProvider._();

final class DownloadSortAscProvider
    extends $NotifierProvider<DownloadSortAsc, bool> {
  DownloadSortAscProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadSortAscProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadSortAscHash();

  @$internal
  @override
  DownloadSortAsc create() => DownloadSortAsc();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$downloadSortAscHash() => r'1147731baddc4777b5046e3531a63e6baf819c86';

abstract class _$DownloadSortAsc extends $Notifier<bool> {
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

@ProviderFor(DownloadSearchQuery)
final downloadSearchQueryProvider = DownloadSearchQueryProvider._();

final class DownloadSearchQueryProvider
    extends $NotifierProvider<DownloadSearchQuery, String> {
  DownloadSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadSearchQueryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadSearchQueryHash();

  @$internal
  @override
  DownloadSearchQuery create() => DownloadSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$downloadSearchQueryHash() =>
    r'f7264f5c22c141df1c8aa17ce40487528ffcc85e';

abstract class _$DownloadSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
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
    r'a4857287e73af72a8c4a2903c505156fd365fc57';

@ProviderFor(sortedActiveDownloads)
final sortedActiveDownloadsProvider = SortedActiveDownloadsProvider._();

final class SortedActiveDownloadsProvider
    extends
        $FunctionalProvider<
          List<DownloadItem>,
          List<DownloadItem>,
          List<DownloadItem>
        >
    with $Provider<List<DownloadItem>> {
  SortedActiveDownloadsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortedActiveDownloadsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortedActiveDownloadsHash();

  @$internal
  @override
  $ProviderElement<List<DownloadItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<DownloadItem> create(Ref ref) {
    return sortedActiveDownloads(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DownloadItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DownloadItem>>(value),
    );
  }
}

String _$sortedActiveDownloadsHash() =>
    r'8a40ac1209ce6a5ccfb91810a811a8d7555d368e';

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
