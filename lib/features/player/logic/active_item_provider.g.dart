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
    extends $NotifierProvider<ActiveItem, ItemDomain?> {
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
  Override overrideWithValue(ItemDomain? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemDomain?>(value),
    );
  }
}

String _$activeItemHash() => r'a13ca6f541e1b1e14c8ad50da231fbe3fe81cd78';

abstract class _$ActiveItem extends $Notifier<ItemDomain?> {
  ItemDomain? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ItemDomain?, ItemDomain?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ItemDomain?, ItemDomain?>,
              ItemDomain?,
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

String _$currentChapterHash() => r'41618fad4afc1f8b69675b4298985c706c33387b';
