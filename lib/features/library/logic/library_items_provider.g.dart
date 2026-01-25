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
    extends $AsyncNotifierProvider<LibraryItemsNotifier, LibraryItemsState> {
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
    r'd6b817d5fa5cde8ff2d61069bfdaf49d729d5be2';

abstract class _$LibraryItemsNotifier
    extends $AsyncNotifier<LibraryItemsState> {
  FutureOr<LibraryItemsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<LibraryItemsState>, LibraryItemsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LibraryItemsState>, LibraryItemsState>,
              AsyncValue<LibraryItemsState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
