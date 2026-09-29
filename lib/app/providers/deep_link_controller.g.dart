// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_link_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deepLinkController)
final deepLinkControllerProvider = DeepLinkControllerProvider._();

final class DeepLinkControllerProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DeepLinkControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deepLinkControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deepLinkControllerHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return deepLinkController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$deepLinkControllerHash() =>
    r'12a6e74537cebd7f4628541007b9ae8ddd8ffdcc';
