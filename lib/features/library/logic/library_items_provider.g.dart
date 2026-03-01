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

String _$libraryItemsHash() => r'2bb9709b337626569d0d82dfd77c9e0f530973bf';
