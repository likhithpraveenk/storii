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
    r'16514a2023c2fc08955950514e158157d50630ad';

@ProviderFor(playbackErrors)
final playbackErrorsProvider = PlaybackErrorsProvider._();

final class PlaybackErrorsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppPlaybackError>,
          AppPlaybackError,
          Stream<AppPlaybackError>
        >
    with $FutureModifier<AppPlaybackError>, $StreamProvider<AppPlaybackError> {
  PlaybackErrorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playbackErrorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playbackErrorsHash();

  @$internal
  @override
  $StreamProviderElement<AppPlaybackError> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<AppPlaybackError> create(Ref ref) {
    return playbackErrors(ref);
  }
}

String _$playbackErrorsHash() => r'082f267393dde8dd0a4b53b2bff98bf9e2e5c2cb';

@ProviderFor(playbackState)
final playbackStateProvider = PlaybackStateProvider._();

final class PlaybackStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppPlaybackState>,
          AppPlaybackState,
          Stream<AppPlaybackState>
        >
    with $FutureModifier<AppPlaybackState>, $StreamProvider<AppPlaybackState> {
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
  $StreamProviderElement<AppPlaybackState> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<AppPlaybackState> create(Ref ref) {
    return playbackState(ref);
  }
}

String _$playbackStateHash() => r'a4f4f988a1cb8b163803865993906a74f5249cba';

@ProviderFor(playbackStatus)
final playbackStatusProvider = PlaybackStatusProvider._();

final class PlaybackStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppPlaybackStatus>,
          AppPlaybackStatus,
          Stream<AppPlaybackStatus>
        >
    with
        $FutureModifier<AppPlaybackStatus>,
        $StreamProvider<AppPlaybackStatus> {
  PlaybackStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playbackStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playbackStatusHash();

  @$internal
  @override
  $StreamProviderElement<AppPlaybackStatus> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<AppPlaybackStatus> create(Ref ref) {
    return playbackStatus(ref);
  }
}

String _$playbackStatusHash() => r'dbf50514a7b2a192e3aa0e9c83a8d443aa6337e3';

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

String _$isPlayingHash() => r'221a4767ca36d19d18b2b51ce71a9cc216ae4d64';

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

String _$globalPositionHash() => r'7a9801f0e293984810c87787cb71f022ccd2fa48';

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

String _$chapterPositionHash() => r'6241bcd99fd67f6aeca75fdf9e3bab269e3c36b0';

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

String _$currentChapterHash() => r'd5d37a74c6e89753ee6d43f692d414f070887c04';

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
    r'a6e0a9157b25f20e36f707dc809fa00b55020035';

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
    r'beb8b19d5f5c3a1b23c7c5d2329897232b8dd537';

@ProviderFor(volume)
final volumeProvider = VolumeProvider._();

final class VolumeProvider
    extends $FunctionalProvider<AsyncValue<double>, double, Stream<double>>
    with $FutureModifier<double>, $StreamProvider<double> {
  VolumeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'volumeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$volumeHash();

  @$internal
  @override
  $StreamProviderElement<double> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<double> create(Ref ref) {
    return volume(ref);
  }
}

String _$volumeHash() => r'54055e2429339375a86ddb671ed28784322d870b';

@ProviderFor(VolumeControl)
final volumeControlProvider = VolumeControlProvider._();

final class VolumeControlProvider
    extends $NotifierProvider<VolumeControl, double> {
  VolumeControlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'volumeControlProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$volumeControlHash();

  @$internal
  @override
  VolumeControl create() => VolumeControl();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$volumeControlHash() => r'bcc679bf1703ec184631f7c99860d35e04f33b74';

abstract class _$VolumeControl extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(LocalSpeed)
final localSpeedProvider = LocalSpeedProvider._();

final class LocalSpeedProvider extends $NotifierProvider<LocalSpeed, double> {
  LocalSpeedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localSpeedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localSpeedHash();

  @$internal
  @override
  LocalSpeed create() => LocalSpeed();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$localSpeedHash() => r'3f495550a5baef26599d605dfecc0ab6b0f3ec69';

abstract class _$LocalSpeed extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

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
    r'49473a06d199a3ddcd990924cdcb9783520ac9b3';
