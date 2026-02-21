// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(audioHandler)
final audioHandlerProvider = AudioHandlerProvider._();

final class AudioHandlerProvider
    extends $FunctionalProvider<MyAudioHandler, MyAudioHandler, MyAudioHandler>
    with $Provider<MyAudioHandler> {
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
  $ProviderElement<MyAudioHandler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MyAudioHandler create(Ref ref) {
    return audioHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MyAudioHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MyAudioHandler>(value),
    );
  }
}

String _$audioHandlerHash() => r'4b59391bc2a59582e06b45e2e2fbfb7b63109c62';

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

String _$audioPlayerHash() => r'f021107d72edcf45e5b97f50927ece5ad9a6024b';

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

String _$saveProgressHash() => r'69c1c6da072e984326d60e0c86142b89a893e750';

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

@ProviderFor(totalBookDuration)
final totalBookDurationProvider = TotalBookDurationProvider._();

final class TotalBookDurationProvider
    extends $FunctionalProvider<Duration, Duration, Duration>
    with $Provider<Duration> {
  TotalBookDurationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalBookDurationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalBookDurationHash();

  @$internal
  @override
  $ProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Duration create(Ref ref) {
    return totalBookDuration(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration>(value),
    );
  }
}

String _$totalBookDurationHash() => r'c0a7ebd0245132c513f6ce8b91844f5e5e86d2c0';

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

String _$globalPositionHash() => r'0b622b3971937c07833dab66c7fe312e5bcfc148';
