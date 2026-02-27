// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activeItem)
final activeItemProvider = ActiveItemProvider._();

final class ActiveItemProvider
    extends
        $FunctionalProvider<
          AsyncValue<LibraryItem?>,
          LibraryItem?,
          FutureOr<LibraryItem?>
        >
    with $FutureModifier<LibraryItem?>, $FutureProvider<LibraryItem?> {
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
  $FutureProviderElement<LibraryItem?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LibraryItem?> create(Ref ref) {
    return activeItem(ref);
  }
}

String _$activeItemHash() => r'523bb70e53c88ee69bccd6b6a57e63c89052430d';

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

String _$currentChapterHash() => r'b606ddf0f70afa3c955c9d202e67d845564168f0';
