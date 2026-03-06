// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(audioHandlerEvents)
final audioHandlerEventsProvider = AudioHandlerEventsProvider._();

final class AudioHandlerEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AudioHandlerEvent>,
          AudioHandlerEvent,
          Stream<AudioHandlerEvent>
        >
    with
        $FutureModifier<AudioHandlerEvent>,
        $StreamProvider<AudioHandlerEvent> {
  AudioHandlerEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioHandlerEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioHandlerEventsHash();

  @$internal
  @override
  $StreamProviderElement<AudioHandlerEvent> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<AudioHandlerEvent> create(Ref ref) {
    return audioHandlerEvents(ref);
  }
}

String _$audioHandlerEventsHash() =>
    r'9f1d9d8a0e644a276b50c846466bc05b8c338429';

@ProviderFor(playbackState)
final playbackStateProvider = PlaybackStateProvider._();

final class PlaybackStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlaybackState>,
          PlaybackState,
          Stream<PlaybackState>
        >
    with $FutureModifier<PlaybackState>, $StreamProvider<PlaybackState> {
  PlaybackStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playbackStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playbackStateHash();

  @$internal
  @override
  $StreamProviderElement<PlaybackState> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PlaybackState> create(Ref ref) {
    return playbackState(ref);
  }
}

String _$playbackStateHash() => r'fb2b353a97b19a31b8060f60f312aab13ab0cbdd';

@ProviderFor(processingState)
final processingStateProvider = ProcessingStateProvider._();

final class ProcessingStateProvider
    extends
        $FunctionalProvider<
          AudioProcessingState,
          AudioProcessingState,
          AudioProcessingState
        >
    with $Provider<AudioProcessingState> {
  ProcessingStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'processingStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$processingStateHash();

  @$internal
  @override
  $ProviderElement<AudioProcessingState> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AudioProcessingState create(Ref ref) {
    return processingState(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudioProcessingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudioProcessingState>(value),
    );
  }
}

String _$processingStateHash() => r'0f04b82bad3d9956ff74fb511e221553c8a75b80';

@ProviderFor(isPlaying)
final isPlayingProvider = IsPlayingProvider._();

final class IsPlayingProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsPlayingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isPlayingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isPlayingHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isPlaying(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isPlayingHash() => r'27909a8b37b348f87c3b6eed7f9aa66454c6fb36';

@ProviderFor(currentMediaItem)
final currentMediaItemProvider = CurrentMediaItemProvider._();

final class CurrentMediaItemProvider
    extends
        $FunctionalProvider<
          AsyncValue<MediaItem?>,
          MediaItem?,
          Stream<MediaItem?>
        >
    with $FutureModifier<MediaItem?>, $StreamProvider<MediaItem?> {
  CurrentMediaItemProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentMediaItemProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentMediaItemHash();

  @$internal
  @override
  $StreamProviderElement<MediaItem?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<MediaItem?> create(Ref ref) {
    return currentMediaItem(ref);
  }
}

String _$currentMediaItemHash() => r'9724a20312faffba7e4c45611e8cd58eac9c3eac';

@ProviderFor(globalPosition)
final globalPositionProvider = GlobalPositionProvider._();

final class GlobalPositionProvider
    extends
        $FunctionalProvider<AsyncValue<Duration>, Duration, Stream<Duration>>
    with $FutureModifier<Duration>, $StreamProvider<Duration> {
  GlobalPositionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'globalPositionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$globalPositionHash();

  @$internal
  @override
  $StreamProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration> create(Ref ref) {
    return globalPosition(ref);
  }
}

String _$globalPositionHash() => r'd6f6086196f78b66be0d2c4dc0b105b7e2cb29f1';

@ProviderFor(totalDuration)
final totalDurationProvider = TotalDurationProvider._();

final class TotalDurationProvider
    extends $FunctionalProvider<Duration, Duration, Duration>
    with $Provider<Duration> {
  TotalDurationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalDurationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalDurationHash();

  @$internal
  @override
  $ProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Duration create(Ref ref) {
    return totalDuration(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration>(value),
    );
  }
}

String _$totalDurationHash() => r'5b8043ca284de5972183decfc40d0b6f06647bdd';

@ProviderFor(AudioPlayerNotifier)
final audioPlayerProvider = AudioPlayerNotifierProvider._();

final class AudioPlayerNotifierProvider
    extends $AsyncNotifierProvider<AudioPlayerNotifier, void> {
  AudioPlayerNotifierProvider._()
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
  String debugGetCreateSourceHash() => _$audioPlayerNotifierHash();

  @$internal
  @override
  AudioPlayerNotifier create() => AudioPlayerNotifier();
}

String _$audioPlayerNotifierHash() =>
    r'eb8f59b09ae9f063598d407081e353f2a597fa08';

abstract class _$AudioPlayerNotifier extends $AsyncNotifier<void> {
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

@ProviderFor(playerStateWatcher)
final playerStateWatcherProvider = PlayerStateWatcherProvider._();

final class PlayerStateWatcherProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  PlayerStateWatcherProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerStateWatcherProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerStateWatcherHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return playerStateWatcher(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$playerStateWatcherHash() =>
    r'2b502b1e29ef70583405270e2542c019f67f8acf';

@ProviderFor(audioSettingsWatcher)
final audioSettingsWatcherProvider = AudioSettingsWatcherProvider._();

final class AudioSettingsWatcherProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  AudioSettingsWatcherProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioSettingsWatcherProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioSettingsWatcherHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return audioSettingsWatcher(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$audioSettingsWatcherHash() =>
    r'c81d3d9bc2f48999677efda9e590480056ebc142';
