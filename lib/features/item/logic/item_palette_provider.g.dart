// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_palette_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(itemPalette)
final itemPaletteProvider = ItemPaletteFamily._();

final class ItemPaletteProvider
    extends
        $FunctionalProvider<
          AsyncValue<PaletteGeneratorMaster>,
          PaletteGeneratorMaster,
          FutureOr<PaletteGeneratorMaster>
        >
    with
        $FutureModifier<PaletteGeneratorMaster>,
        $FutureProvider<PaletteGeneratorMaster> {
  ItemPaletteProvider._({
    required ItemPaletteFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'itemPaletteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemPaletteHash();

  @override
  String toString() {
    return r'itemPaletteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PaletteGeneratorMaster> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PaletteGeneratorMaster> create(Ref ref) {
    final argument = this.argument as String;
    return itemPalette(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemPaletteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemPaletteHash() => r'e8da0ef1d875e2953301813d7ec75fc2c837dc8f';

final class ItemPaletteFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PaletteGeneratorMaster>, String> {
  ItemPaletteFamily._()
    : super(
        retry: null,
        name: r'itemPaletteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemPaletteProvider call(String id) =>
      ItemPaletteProvider._(argument: id, from: this);

  @override
  String toString() => r'itemPaletteProvider';
}
