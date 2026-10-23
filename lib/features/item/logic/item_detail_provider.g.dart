// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ItemDetail)
final itemDetailProvider = ItemDetailFamily._();

final class ItemDetailProvider
    extends $AsyncNotifierProvider<ItemDetail, LibraryItem> {
  ItemDetailProvider._({
    required ItemDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'itemDetailProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemDetailHash();

  @override
  String toString() {
    return r'itemDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ItemDetail create() => ItemDetail();

  @override
  bool operator ==(Object other) {
    return other is ItemDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemDetailHash() => r'552d5c67943d0807a7f91bc36b566968afee6643';

final class ItemDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          ItemDetail,
          AsyncValue<LibraryItem>,
          LibraryItem,
          FutureOr<LibraryItem>,
          String
        > {
  ItemDetailFamily._()
    : super(
        retry: null,
        name: r'itemDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ItemDetailProvider call(String id) =>
      ItemDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'itemDetailProvider';
}

abstract class _$ItemDetail extends $AsyncNotifier<LibraryItem> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<LibraryItem> build(String id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<LibraryItem>, LibraryItem>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LibraryItem>, LibraryItem>,
              AsyncValue<LibraryItem>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(libraryItemUpdated)
final libraryItemUpdatedProvider = LibraryItemUpdatedProvider._();

final class LibraryItemUpdatedProvider
    extends
        $FunctionalProvider<
          AsyncValue<LibraryItem?>,
          LibraryItem?,
          Stream<LibraryItem?>
        >
    with $FutureModifier<LibraryItem?>, $StreamProvider<LibraryItem?> {
  LibraryItemUpdatedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryItemUpdatedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryItemUpdatedHash();

  @$internal
  @override
  $StreamProviderElement<LibraryItem?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<LibraryItem?> create(Ref ref) {
    return libraryItemUpdated(ref);
  }
}

String _$libraryItemUpdatedHash() =>
    r'779dcf90c4173d0fb7b35d1f8524193eb9f8edd4';
