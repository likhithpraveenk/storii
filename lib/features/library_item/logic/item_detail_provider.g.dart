// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(itemDetail)
final itemDetailProvider = ItemDetailFamily._();

final class ItemDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<LibraryItem>,
          LibraryItem,
          FutureOr<LibraryItem>
        >
    with $FutureModifier<LibraryItem>, $FutureProvider<LibraryItem> {
  ItemDetailProvider._({
    required ItemDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'itemDetailProvider',
         isAutoDispose: true,
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
  $FutureProviderElement<LibraryItem> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LibraryItem> create(Ref ref) {
    final argument = this.argument as String;
    return itemDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemDetailHash() => r'b75485fa93d80ab7276590e1fb90efea6c8e55cf';

final class ItemDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LibraryItem>, String> {
  ItemDetailFamily._()
    : super(
        retry: null,
        name: r'itemDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemDetailProvider call(String id) =>
      ItemDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'itemDetailProvider';
}

@ProviderFor(item)
final itemProvider = ItemFamily._();

final class ItemProvider
    extends
        $FunctionalProvider<
          AsyncValue<LibraryItem>,
          LibraryItem,
          FutureOr<LibraryItem>
        >
    with $FutureModifier<LibraryItem>, $FutureProvider<LibraryItem> {
  ItemProvider._({
    required ItemFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'itemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemHash();

  @override
  String toString() {
    return r'itemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LibraryItem> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LibraryItem> create(Ref ref) {
    final argument = this.argument as String;
    return item(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemHash() => r'3dd5766b686f17c8788bb3d4a1c8904469cb5da1';

final class ItemFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LibraryItem>, String> {
  ItemFamily._()
    : super(
        retry: null,
        name: r'itemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemProvider call(String id) => ItemProvider._(argument: id, from: this);

  @override
  String toString() => r'itemProvider';
}
