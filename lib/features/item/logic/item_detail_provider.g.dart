// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(itemDetail)
final itemDetailProvider = ItemDetailFamily._();

final class ItemDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<LibraryItem>,
          LibraryItem,
          FutureOr<LibraryItem>
        >
    with $FutureModifier<LibraryItem>, $FutureProvider<LibraryItem> {
  ItemDetailProvider._({
    required ItemDetailFamily super.from,
    required (String, {bool includeProgress, bool isDownloaded}) super.argument,
  }) : super(
         retry: null,
         name: r'itemDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemDetailHash();

  @override
  String toString() {
    return r'itemDetailProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<LibraryItem> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LibraryItem> create(Ref ref) {
    final argument =
        this.argument as (String, {bool includeProgress, bool isDownloaded});
    return itemDetail(
      ref,
      argument.$1,
      includeProgress: argument.includeProgress,
      isDownloaded: argument.isDownloaded,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ItemDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemDetailHash() => r'd84b62f30eb236d379e2cabc6f7251357dc56b3b';

final class ItemDetailFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<LibraryItem>,
          (String, {bool includeProgress, bool isDownloaded})
        > {
  ItemDetailFamily._()
    : super(
        retry: null,
        name: r'itemDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemDetailProvider call(
    String id, {
    bool includeProgress = false,
    bool isDownloaded = false,
  }) => ItemDetailProvider._(
    argument: (
      id,
      includeProgress: includeProgress,
      isDownloaded: isDownloaded,
    ),
    from: this,
  );

  @override
  String toString() => r'itemDetailProvider';
}
