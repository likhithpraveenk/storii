// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AudioPlayer)
final audioPlayerProvider = AudioPlayerProvider._();

final class AudioPlayerProvider
    extends $StreamNotifierProvider<AudioPlayer, PlaybackState> {
  AudioPlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioPlayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioPlayerHash();

  @$internal
  @override
  AudioPlayer create() => AudioPlayer();
}

String _$audioPlayerHash() => r'11e0a0023532f3f33e4bce5bf53c4dcca3d69735';

abstract class _$AudioPlayer extends $StreamNotifier<PlaybackState> {
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
