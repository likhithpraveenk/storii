// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_palette_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ItemPaletteNotifier)
final itemPaletteProvider = ItemPaletteNotifierFamily._();

final class ItemPaletteNotifierProvider
    extends
        $AsyncNotifierProvider<ItemPaletteNotifier, PaletteGeneratorMaster> {
  ItemPaletteNotifierProvider._({
    required ItemPaletteNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'itemPaletteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemPaletteNotifierHash();

  @override
  String toString() {
    return r'itemPaletteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ItemPaletteNotifier create() => ItemPaletteNotifier();

  @override
  bool operator ==(Object other) {
    return other is ItemPaletteNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemPaletteNotifierHash() =>
    r'69e3a26d37c3255e3407fdeec22b3f733bcdc24c';

final class ItemPaletteNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ItemPaletteNotifier,
          AsyncValue<PaletteGeneratorMaster>,
          PaletteGeneratorMaster,
          FutureOr<PaletteGeneratorMaster>,
          String
        > {
  ItemPaletteNotifierFamily._()
    : super(
        retry: null,
        name: r'itemPaletteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemPaletteNotifierProvider call(String id) =>
      ItemPaletteNotifierProvider._(argument: id, from: this);

  @override
  String toString() => r'itemPaletteProvider';
}

abstract class _$ItemPaletteNotifier
    extends $AsyncNotifier<PaletteGeneratorMaster> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<PaletteGeneratorMaster> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<PaletteGeneratorMaster>, PaletteGeneratorMaster>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PaletteGeneratorMaster>,
                PaletteGeneratorMaster
              >,
              AsyncValue<PaletteGeneratorMaster>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
