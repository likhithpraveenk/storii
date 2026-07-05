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
    r'5e35b54e3d123abb9a8d0ba3f9c16b94d4c9d5b4';

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
    r'e1bb083b65f546156db217ec7518ef959281286d';
