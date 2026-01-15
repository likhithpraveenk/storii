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
    extends $AsyncNotifierProvider<ShelvesNotifier, List<Shelf>> {
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

String _$shelvesNotifierHash() => r'5b69e157a0c2ae67213ea625ccacfd283c8c5433';

abstract class _$ShelvesNotifier extends $AsyncNotifier<List<Shelf>> {
  FutureOr<List<Shelf>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Shelf>>, List<Shelf>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Shelf>>, List<Shelf>>,
              AsyncValue<List<Shelf>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
