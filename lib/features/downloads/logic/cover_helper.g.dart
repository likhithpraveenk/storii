// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_helper.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(coverHelper)
final coverHelperProvider = CoverHelperProvider._();

final class CoverHelperProvider
    extends $FunctionalProvider<CoverHelper, CoverHelper, CoverHelper>
    with $Provider<CoverHelper> {
  CoverHelperProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coverHelperProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coverHelperHash();

  @$internal
  @override
  $ProviderElement<CoverHelper> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CoverHelper create(Ref ref) {
    return coverHelper(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoverHelper value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoverHelper>(value),
    );
  }
}

String _$coverHelperHash() => r'9368c81b8e851d07ca2d5f9d138b3bc677ce06bc';
