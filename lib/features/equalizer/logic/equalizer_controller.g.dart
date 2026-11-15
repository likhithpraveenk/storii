// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equalizer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EqualizerController)
final equalizerControllerProvider = EqualizerControllerProvider._();

final class EqualizerControllerProvider
    extends $NotifierProvider<EqualizerController, EqualizerDraft> {
  EqualizerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'equalizerControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$equalizerControllerHash();

  @$internal
  @override
  EqualizerController create() => EqualizerController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EqualizerDraft value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EqualizerDraft>(value),
    );
  }
}

String _$equalizerControllerHash() =>
    r'dda850b5687caf6cb5ca6ad29531a55158af1842';

abstract class _$EqualizerController extends $Notifier<EqualizerDraft> {
  EqualizerDraft build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<EqualizerDraft, EqualizerDraft>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EqualizerDraft, EqualizerDraft>,
              EqualizerDraft,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
