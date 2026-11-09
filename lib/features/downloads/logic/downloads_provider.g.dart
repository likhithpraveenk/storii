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
    extends $NotifierProvider<DownloadSortNotifier, DownloadSortState> {
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
  Override overrideWithValue(DownloadSortState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadSortState>(value),
    );
  }
}

String _$downloadSortNotifierHash() =>
    r'4850e9bf8caf52057ae12aed3ec5ff6f9e8035d4';

abstract class _$DownloadSortNotifier extends $Notifier<DownloadSortState> {
  DownloadSortState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DownloadSortState, DownloadSortState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DownloadSortState, DownloadSortState>,
              DownloadSortState,
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
        isAutoDispose: true,
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
    r'18af048d0ade76a2847d241892a5607c24def48f';

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

String _$downloadItemHash() => r'0bc79be41569a3f377c8b909dfb9a6d2f05c7a42';

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

String _$activeDownloadsHash() => r'8dd9ac101c60fecf83c2aa4c0b747e8cf9fc7c10';

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
    r'2ec828809ae06a54580966e7388dcd2cddbc2d8c';

@ProviderFor(downloadQueuePosition)
final downloadQueuePositionProvider = DownloadQueuePositionFamily._();

final class DownloadQueuePositionProvider
    extends $FunctionalProvider<int?, int?, int?>
    with $Provider<int?> {
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
  $ProviderElement<int?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int? create(Ref ref) {
    final argument = this.argument as (String, String?);
    return downloadQueuePosition(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
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
    r'ad1a28b69d241b4053238471160d8e113172ba6e';

final class DownloadQueuePositionFamily extends $Family
    with $FunctionalFamilyOverride<int?, (String, String?)> {
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
    r'95465f4d6b5d3297d18b957c36099bb41863ab28';

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
    r'959159aee2965d95464e32fec86a704091b02cdf';

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

String _$downloadedItemsHash() => r'403a398c13dca78616dacc01a3d84795379192e9';
