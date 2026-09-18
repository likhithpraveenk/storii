// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LibraryItemsNotifier)
final libraryItemsProvider = LibraryItemsNotifierProvider._();

final class LibraryItemsNotifierProvider
    extends
        $AsyncNotifierProvider<LibraryItemsNotifier, PaginatedLibraryItems> {
  LibraryItemsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryItemsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryItemsNotifierHash();

  @$internal
  @override
  LibraryItemsNotifier create() => LibraryItemsNotifier();
}

String _$libraryItemsNotifierHash() =>
    r'00fc7315e057bcded81bcdd7ccbc8c1bd43a2730';

abstract class _$LibraryItemsNotifier
    extends $AsyncNotifier<PaginatedLibraryItems> {
  FutureOr<PaginatedLibraryItems> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<PaginatedLibraryItems>, PaginatedLibraryItems>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PaginatedLibraryItems>,
                PaginatedLibraryItems
              >,
              AsyncValue<PaginatedLibraryItems>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(allLibraryItems)
final allLibraryItemsProvider = AllLibraryItemsProvider._();

final class AllLibraryItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LibraryItem>>,
          List<LibraryItem>,
          FutureOr<List<LibraryItem>>
        >
    with
        $FutureModifier<List<LibraryItem>>,
        $FutureProvider<List<LibraryItem>> {
  AllLibraryItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allLibraryItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allLibraryItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<LibraryItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LibraryItem>> create(Ref ref) {
    return allLibraryItems(ref);
  }
}

String _$allLibraryItemsHash() => r'10460b530ecc85e965928d5455cdca5417cfc7e4';
