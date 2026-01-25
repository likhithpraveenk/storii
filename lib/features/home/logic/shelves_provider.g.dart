// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelves_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShelvesNotifier)
final shelvesProvider = ShelvesNotifierProvider._();

final class ShelvesNotifierProvider
    extends $AsyncNotifierProvider<ShelvesNotifier, List<ShelfDomain>> {
  ShelvesNotifierProvider._()
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
  String debugGetCreateSourceHash() => _$shelvesNotifierHash();

  @$internal
  @override
  ShelvesNotifier create() => ShelvesNotifier();
}

String _$shelvesNotifierHash() => r'ae2c96295c1cd24beab88e0bab67ef93876aefc2';

abstract class _$ShelvesNotifier extends $AsyncNotifier<List<ShelfDomain>> {
  FutureOr<List<ShelfDomain>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ShelfDomain>>, List<ShelfDomain>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ShelfDomain>>, List<ShelfDomain>>,
              AsyncValue<List<ShelfDomain>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
