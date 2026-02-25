// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ActiveItem)
final activeItemProvider = ActiveItemProvider._();

final class ActiveItemProvider
    extends $NotifierProvider<ActiveItem, LibraryItem?> {
  ActiveItemProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeItemProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeItemHash();

  @$internal
  @override
  ActiveItem create() => ActiveItem();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LibraryItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LibraryItem?>(value),
    );
  }
}

String _$activeItemHash() => r'b9c5ae682dd919df06cad4e54d7501dee1b01c8c';

abstract class _$ActiveItem extends $Notifier<LibraryItem?> {
  LibraryItem? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<LibraryItem?, LibraryItem?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LibraryItem?, LibraryItem?>,
              LibraryItem?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(currentChapter)
final currentChapterProvider = CurrentChapterProvider._();

final class CurrentChapterProvider
    extends $FunctionalProvider<BookChapter?, BookChapter?, BookChapter?>
    with $Provider<BookChapter?> {
  CurrentChapterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentChapterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentChapterHash();

  @$internal
  @override
  $ProviderElement<BookChapter?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BookChapter? create(Ref ref) {
    return currentChapter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookChapter? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookChapter?>(value),
    );
  }
}

String _$currentChapterHash() => r'b7da905d490971030376434e48e160811f34d0fc';
