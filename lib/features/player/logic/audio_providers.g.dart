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
    r'89300f8f2050779248cfb6b4760491979895517a';

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

String _$playbackStateHash() => r'bd2f07e833076e09c869c569319f35513f62dadc';

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

@ProviderFor(chapterPosition)
final chapterPositionProvider = ChapterPositionProvider._();

final class ChapterPositionProvider
    extends
        $FunctionalProvider<AsyncValue<Duration>, Duration, Stream<Duration>>
    with $FutureModifier<Duration>, $StreamProvider<Duration> {
  ChapterPositionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chapterPositionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chapterPositionHash();

  @$internal
  @override
  $StreamProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration> create(Ref ref) {
    return chapterPosition(ref);
  }
}

String _$chapterPositionHash() => r'572c2bf41d91cc4a77c773755ffde9f1e2d4aded';

@ProviderFor(currentChapter)
final currentChapterProvider = CurrentChapterProvider._();

final class CurrentChapterProvider
    extends
        $FunctionalProvider<AsyncValue<Chapter?>, Chapter?, Stream<Chapter?>>
    with $FutureModifier<Chapter?>, $StreamProvider<Chapter?> {
  CurrentChapterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentChapterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentChapterHash();

  @$internal
  @override
  $StreamProviderElement<Chapter?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Chapter?> create(Ref ref) {
    return currentChapter(ref);
  }
}

String _$currentChapterHash() => r'5f29b93de6cf1b2cda03d22d79909fc58a910d43';

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
    extends $NotifierProvider<AudioPlayerNotifier, AudioPlayerState> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudioPlayerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudioPlayerState>(value),
    );
  }
}

String _$audioPlayerNotifierHash() =>
    r'ea3fc38481f9ea162168900f69df01dbd8efb2ee';

abstract class _$AudioPlayerNotifier extends $Notifier<AudioPlayerState> {
  AudioPlayerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AudioPlayerState, AudioPlayerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AudioPlayerState, AudioPlayerState>,
              AudioPlayerState,
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
        isAutoDispose: true,
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
    r'd5330119981f458050209e322dbde7566da17261';

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
        isAutoDispose: true,
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
    r'd87615e1af0ed39a75a2d9d5831d83889ebfe539';
