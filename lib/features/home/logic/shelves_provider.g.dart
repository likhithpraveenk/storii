// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelves_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shelves)
final shelvesProvider = ShelvesProvider._();

final class ShelvesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Shelf>>,
          List<Shelf>,
          FutureOr<List<Shelf>>
        >
    with $FutureModifier<List<Shelf>>, $FutureProvider<List<Shelf>> {
  ShelvesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shelvesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shelvesHash();

  @$internal
  @override
  $FutureProviderElement<List<Shelf>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Shelf>> create(Ref ref) {
    return shelves(ref);
  }
}

String _$shelvesHash() => r'ca45abb0eb2c2e63ee11fa37a9210d1070f1aa97';
