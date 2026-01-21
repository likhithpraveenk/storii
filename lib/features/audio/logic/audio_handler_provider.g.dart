// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_handler_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(audioHandler)
final audioHandlerProvider = AudioHandlerProvider._();

final class AudioHandlerProvider
    extends $FunctionalProvider<AudioHandler, AudioHandler, AudioHandler>
    with $Provider<AudioHandler> {
  AudioHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioHandlerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioHandlerHash();

  @$internal
  @override
  $ProviderElement<AudioHandler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AudioHandler create(Ref ref) {
    return audioHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudioHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudioHandler>(value),
    );
  }
}

String _$audioHandlerHash() => r'8991024c3353f7c16e1c0b0ca794cc0be27c1d38';

@ProviderFor(playbackStateStream)
final playbackStateStreamProvider = PlaybackStateStreamProvider._();

final class PlaybackStateStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlaybackState>,
          PlaybackState,
          Stream<PlaybackState>
        >
    with $FutureModifier<PlaybackState>, $StreamProvider<PlaybackState> {
  PlaybackStateStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playbackStateStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playbackStateStreamHash();

  @$internal
  @override
  $StreamProviderElement<PlaybackState> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PlaybackState> create(Ref ref) {
    return playbackStateStream(ref);
  }
}

String _$playbackStateStreamHash() =>
    r'90ccbf0a979cc52e9b6ff70393aaaddd0cfbf7f7';

@ProviderFor(SaveProgress)
final saveProgressProvider = SaveProgressProvider._();

final class SaveProgressProvider
    extends $AsyncNotifierProvider<SaveProgress, void> {
  SaveProgressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveProgressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveProgressHash();

  @$internal
  @override
  SaveProgress create() => SaveProgress();
}

String _$saveProgressHash() => r'84d2a498e2746f6c9c1dd0f32069f68be3893486';

abstract class _$SaveProgress extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
