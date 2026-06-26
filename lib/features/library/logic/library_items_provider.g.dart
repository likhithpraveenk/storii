// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(libraryItems)
final libraryItemsProvider = LibraryItemsProvider._();

final class LibraryItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LibraryItem>>,
          List<LibraryItem>,
          FutureOr<List<LibraryItem>>
        >
    with
        $FutureModifier<List<LibraryItem>>,
        $FutureProvider<List<LibraryItem>> {
  LibraryItemsProvider._()
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
  String debugGetCreateSourceHash() => _$libraryItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<LibraryItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LibraryItem>> create(Ref ref) {
    return libraryItems(ref);
  }
}

String _$libraryItemsHash() => r'35de169c2ded80235c24d2518d9e0e2e1cb97613';

@ProviderFor(rawLibraryItems)
final rawLibraryItemsProvider = RawLibraryItemsProvider._();

final class RawLibraryItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LibraryItem>>,
          List<LibraryItem>,
          FutureOr<List<LibraryItem>>
        >
    with
        $FutureModifier<List<LibraryItem>>,
        $FutureProvider<List<LibraryItem>> {
  RawLibraryItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawLibraryItemsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawLibraryItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<LibraryItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LibraryItem>> create(Ref ref) {
    return rawLibraryItems(ref);
  }
}

String _$rawLibraryItemsHash() => r'62440470c92f35d83e2b505f4b2b39cbccf6958c';
