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
    extends $AsyncNotifierProvider<LibraryItemsNotifier, List<LibraryItem>> {
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
    r'd437aa6240f355fa366efd53e4d4fa6ca4a11a8f';

abstract class _$LibraryItemsNotifier
    extends $AsyncNotifier<List<LibraryItem>> {
  FutureOr<List<LibraryItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<LibraryItem>>, List<LibraryItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<LibraryItem>>, List<LibraryItem>>,
              AsyncValue<List<LibraryItem>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
