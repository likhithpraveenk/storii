// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CastController)
final castControllerProvider = CastControllerProvider._();

final class CastControllerProvider
    extends $NotifierProvider<CastController, CastSession> {
  CastControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'castControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$castControllerHash();

  @$internal
  @override
  CastController create() => CastController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CastSession value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CastSession>(value),
    );
  }
}

String _$castControllerHash() => r'747113b5107a12f9305ce38cfb8c2019c10701cf';

abstract class _$CastController extends $Notifier<CastSession> {
  CastSession build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CastSession, CastSession>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CastSession, CastSession>,
              CastSession,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
