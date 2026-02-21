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
    extends $AsyncNotifierProvider<LibraryItemsNotifier, List<ItemDomain>> {
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
    r'001f81129d04785c0bd824beee49b4e902addf0d';

abstract class _$LibraryItemsNotifier extends $AsyncNotifier<List<ItemDomain>> {
  FutureOr<List<ItemDomain>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ItemDomain>>, List<ItemDomain>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ItemDomain>>, List<ItemDomain>>,
              AsyncValue<List<ItemDomain>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
