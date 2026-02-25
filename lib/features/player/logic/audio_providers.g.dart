// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
        isAutoDispose: false,
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

String _$playbackStateHash() => r'1f044d8e7684db097cc1994538c3a464e556edc8';

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
        isAutoDispose: false,
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

String _$currentMediaItemHash() => r'a1fbb316887cf68d8f0bfb6aa8286e657de50023';

@ProviderFor(highResPosition)
final highResPositionProvider = HighResPositionProvider._();

final class HighResPositionProvider
    extends
        $FunctionalProvider<AsyncValue<Duration>, Duration, Stream<Duration>>
    with $FutureModifier<Duration>, $StreamProvider<Duration> {
  HighResPositionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'highResPositionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$highResPositionHash();

  @$internal
  @override
  $StreamProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration> create(Ref ref) {
    return highResPosition(ref);
  }
}

String _$highResPositionHash() => r'a19516894b148c90f4f878eefc3bfcc769bcd82c';

@ProviderFor(lowResPosition)
final lowResPositionProvider = LowResPositionProvider._();

final class LowResPositionProvider
    extends
        $FunctionalProvider<AsyncValue<Duration>, Duration, Stream<Duration>>
    with $FutureModifier<Duration>, $StreamProvider<Duration> {
  LowResPositionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lowResPositionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lowResPositionHash();

  @$internal
  @override
  $StreamProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Duration> create(Ref ref) {
    return lowResPosition(ref);
  }
}

String _$lowResPositionHash() => r'e0b1fce3f2966f010d8af34fc7025d4ed44bf1f5';

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
    r'dd79c26b74bb97b5c2cdbd3342958ea0e5a3b8fd';

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

@ProviderFor(AudioOrchestrator)
final audioOrchestratorProvider = AudioOrchestratorProvider._();

final class AudioOrchestratorProvider
    extends $NotifierProvider<AudioOrchestrator, void> {
  AudioOrchestratorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioOrchestratorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioOrchestratorHash();

  @$internal
  @override
  AudioOrchestrator create() => AudioOrchestrator();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$audioOrchestratorHash() => r'25bbc34c67ddf41baaf4c27a2152294e87eba677';

abstract class _$AudioOrchestrator extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
