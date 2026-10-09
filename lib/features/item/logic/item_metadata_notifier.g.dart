// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_metadata_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ItemMetadataNotifier)
final itemMetadataProvider = ItemMetadataNotifierFamily._();

final class ItemMetadataNotifierProvider
    extends $AsyncNotifierProvider<ItemMetadataNotifier, EditorState> {
  ItemMetadataNotifierProvider._({
    required ItemMetadataNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'itemMetadataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemMetadataNotifierHash();

  @override
  String toString() {
    return r'itemMetadataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ItemMetadataNotifier create() => ItemMetadataNotifier();

  @override
  bool operator ==(Object other) {
    return other is ItemMetadataNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemMetadataNotifierHash() =>
    r'668cc0b20194f56b95ab2e0ee22712f5f1828bd4';

final class ItemMetadataNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ItemMetadataNotifier,
          AsyncValue<EditorState>,
          EditorState,
          FutureOr<EditorState>,
          String
        > {
  ItemMetadataNotifierFamily._()
    : super(
        retry: null,
        name: r'itemMetadataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemMetadataNotifierProvider call(String id) =>
      ItemMetadataNotifierProvider._(argument: id, from: this);

  @override
  String toString() => r'itemMetadataProvider';
}

abstract class _$ItemMetadataNotifier extends $AsyncNotifier<EditorState> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<EditorState> build(String id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<EditorState>, EditorState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<EditorState>, EditorState>,
              AsyncValue<EditorState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
