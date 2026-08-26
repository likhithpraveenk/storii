// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(effectiveNavTargets)
final effectiveNavTargetsProvider = EffectiveNavTargetsProvider._();

final class EffectiveNavTargetsProvider
    extends
        $FunctionalProvider<List<NavTarget>, List<NavTarget>, List<NavTarget>>
    with $Provider<List<NavTarget>> {
  EffectiveNavTargetsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'effectiveNavTargetsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$effectiveNavTargetsHash();

  @$internal
  @override
  $ProviderElement<List<NavTarget>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<NavTarget> create(Ref ref) {
    return effectiveNavTargets(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<NavTarget> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<NavTarget>>(value),
    );
  }
}

String _$effectiveNavTargetsHash() =>
    r'df1ba5978e50f9e23a209818e6da8d840e4a40e8';

@ProviderFor(remainingNavTargets)
final remainingNavTargetsProvider = RemainingNavTargetsProvider._();

final class RemainingNavTargetsProvider
    extends
        $FunctionalProvider<List<NavTarget>, List<NavTarget>, List<NavTarget>>
    with $Provider<List<NavTarget>> {
  RemainingNavTargetsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remainingNavTargetsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remainingNavTargetsHash();

  @$internal
  @override
  $ProviderElement<List<NavTarget>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<NavTarget> create(Ref ref) {
    return remainingNavTargets(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<NavTarget> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<NavTarget>>(value),
    );
  }
}

String _$remainingNavTargetsHash() =>
    r'76a1ea27ceb3d0c609139fe4f87190d6999da8ef';
