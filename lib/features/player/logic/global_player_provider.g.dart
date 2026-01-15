// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GlobalPlayer)
final globalPlayerProvider = GlobalPlayerProvider._();

final class GlobalPlayerProvider
    extends $StreamNotifierProvider<GlobalPlayer, PlaybackState> {
  GlobalPlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'globalPlayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$globalPlayerHash();

  @$internal
  @override
  GlobalPlayer create() => GlobalPlayer();
}

String _$globalPlayerHash() => r'f94fc826b123fcc83089b08382f05a18d36d9069';

abstract class _$GlobalPlayer extends $StreamNotifier<PlaybackState> {
  Stream<PlaybackState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PlaybackState>, PlaybackState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PlaybackState>, PlaybackState>,
              AsyncValue<PlaybackState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
