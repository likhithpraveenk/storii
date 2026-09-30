// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Collections)
final collectionsProvider = CollectionsProvider._();

final class CollectionsProvider
    extends $AsyncNotifierProvider<Collections, List<Collection>> {
  CollectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionsHash();

  @$internal
  @override
  Collections create() => Collections();
}

String _$collectionsHash() => r'4965b7590d0be56c4e64d8fd96a4672468e7e82e';

abstract class _$Collections extends $AsyncNotifier<List<Collection>> {
  FutureOr<List<Collection>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Collection>>, List<Collection>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Collection>>, List<Collection>>,
              AsyncValue<List<Collection>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(CollectionDetail)
final collectionDetailProvider = CollectionDetailFamily._();

final class CollectionDetailProvider
    extends $AsyncNotifierProvider<CollectionDetail, Collection> {
  CollectionDetailProvider._({
    required CollectionDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'collectionDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$collectionDetailHash();

  @override
  String toString() {
    return r'collectionDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CollectionDetail create() => CollectionDetail();

  @override
  bool operator ==(Object other) {
    return other is CollectionDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$collectionDetailHash() => r'e223f741cf04eff26d14f7b33db8624b7946f196';

final class CollectionDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          CollectionDetail,
          AsyncValue<Collection>,
          Collection,
          FutureOr<Collection>,
          String
        > {
  CollectionDetailFamily._()
    : super(
        retry: null,
        name: r'collectionDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CollectionDetailProvider call(String id) =>
      CollectionDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'collectionDetailProvider';
}

abstract class _$CollectionDetail extends $AsyncNotifier<Collection> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<Collection> build(String id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Collection>, Collection>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Collection>, Collection>,
              AsyncValue<Collection>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
