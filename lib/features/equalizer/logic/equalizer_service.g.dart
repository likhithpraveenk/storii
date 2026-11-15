// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equalizer_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(equalizerService)
final equalizerServiceProvider = EqualizerServiceProvider._();

final class EqualizerServiceProvider
    extends
        $FunctionalProvider<
          EqualizerService,
          EqualizerService,
          EqualizerService
        >
    with $Provider<EqualizerService> {
  EqualizerServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'equalizerServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$equalizerServiceHash();

  @$internal
  @override
  $ProviderElement<EqualizerService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EqualizerService create(Ref ref) {
    return equalizerService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EqualizerService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EqualizerService>(value),
    );
  }
}

String _$equalizerServiceHash() => r'68c32446b3df1dd7fb7ccfb4f9f84e95280c5be4';

@ProviderFor(equalizerParameters)
final equalizerParametersProvider = EqualizerParametersProvider._();

final class EqualizerParametersProvider
    extends
        $FunctionalProvider<
          AsyncValue<EqualizerParameters?>,
          EqualizerParameters?,
          FutureOr<EqualizerParameters?>
        >
    with
        $FutureModifier<EqualizerParameters?>,
        $FutureProvider<EqualizerParameters?> {
  EqualizerParametersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'equalizerParametersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$equalizerParametersHash();

  @$internal
  @override
  $FutureProviderElement<EqualizerParameters?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EqualizerParameters?> create(Ref ref) {
    return equalizerParameters(ref);
  }
}

String _$equalizerParametersHash() =>
    r'e07a26ef2aabbd35179c440e975e72c09e552b49';
