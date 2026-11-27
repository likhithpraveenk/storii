// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelves_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Shelves)
final shelvesProvider = ShelvesProvider._();

final class ShelvesProvider
    extends $AsyncNotifierProvider<Shelves, List<Shelf>> {
  ShelvesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shelvesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shelvesHash();

  @$internal
  @override
  Shelves create() => Shelves();
}

String _$shelvesHash() => r'b320b457af6ae97cca8f8c5b8cc16083870e2045';

abstract class _$Shelves extends $AsyncNotifier<List<Shelf>> {
  FutureOr<List<Shelf>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Shelf>>, List<Shelf>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Shelf>>, List<Shelf>>,
              AsyncValue<List<Shelf>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(sortedShelves)
final sortedShelvesProvider = SortedShelvesProvider._();

final class SortedShelvesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Shelf>>,
          List<Shelf>,
          FutureOr<List<Shelf>>
        >
    with $FutureModifier<List<Shelf>>, $FutureProvider<List<Shelf>> {
  SortedShelvesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortedShelvesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortedShelvesHash();

  @$internal
  @override
  $FutureProviderElement<List<Shelf>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Shelf>> create(Ref ref) {
    return sortedShelves(ref);
  }
}

String _$sortedShelvesHash() => r'e05d25266d3f6f8228c9027beca4080d54b28521';

@ProviderFor(rawShelves)
final rawShelvesProvider = RawShelvesProvider._();

final class RawShelvesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Shelf>>,
          List<Shelf>,
          FutureOr<List<Shelf>>
        >
    with $FutureModifier<List<Shelf>>, $FutureProvider<List<Shelf>> {
  RawShelvesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawShelvesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawShelvesHash();

  @$internal
  @override
  $FutureProviderElement<List<Shelf>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Shelf>> create(Ref ref) {
    return rawShelves(ref);
  }
}

String _$rawShelvesHash() => r'3ccbfe96f0906603f771d61f076a48b44f4c6c76';
