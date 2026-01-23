// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentItem)
final currentItemProvider = CurrentItemProvider._();

final class CurrentItemProvider
    extends
        $FunctionalProvider<
          AsyncValue<ItemDomain?>,
          ItemDomain?,
          FutureOr<ItemDomain?>
        >
    with $FutureModifier<ItemDomain?>, $FutureProvider<ItemDomain?> {
  CurrentItemProvider._()
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
  String debugGetCreateSourceHash() => _$currentItemHash();

  @$internal
  @override
  $FutureProviderElement<ItemDomain?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ItemDomain?> create(Ref ref) {
    return currentItem(ref);
  }
}

String _$currentItemHash() => r'70735b4667045dc33b8474c54f82ef0da9d15c02';
