// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentItemNotifier)
final currentItemProvider = CurrentItemNotifierProvider._();

final class CurrentItemNotifierProvider
    extends $StreamNotifierProvider<CurrentItemNotifier, ItemDomain?> {
  CurrentItemNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentItemProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentItemNotifierHash();

  @$internal
  @override
  CurrentItemNotifier create() => CurrentItemNotifier();
}

String _$currentItemNotifierHash() =>
    r'50e0865cda1c8601d648cf54617cdbc7534156e0';

abstract class _$CurrentItemNotifier extends $StreamNotifier<ItemDomain?> {
  Stream<ItemDomain?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ItemDomain?>, ItemDomain?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ItemDomain?>, ItemDomain?>,
              AsyncValue<ItemDomain?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
