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

String _$saveProgressHash() => r'36c28f635d945043fd57ececea298ae9fdd9ecdf';

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

String _$currentMediaItemHash() => r'1df8b06622fdc696a1d56695ce68a66d2cf788a6';

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

String _$totalDurationHash() => r'b7de5fd89649943cd24ee9ff4ca8697103fd0597';
