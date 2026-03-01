// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_progress_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mediaProgress)
final mediaProgressProvider = MediaProgressProvider._();

final class MediaProgressProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, MediaProgress>>,
          Map<String, MediaProgress>,
          FutureOr<Map<String, MediaProgress>>
        >
    with
        $FutureModifier<Map<String, MediaProgress>>,
        $FutureProvider<Map<String, MediaProgress>> {
  MediaProgressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaProgressProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaProgressHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, MediaProgress>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, MediaProgress>> create(Ref ref) {
    return mediaProgress(ref);
  }
}

String _$mediaProgressHash() => r'00692d80395cfc8dedac96886ea813b7d7170e88';

@ProviderFor(mediaProgressById)
final mediaProgressByIdProvider = MediaProgressByIdFamily._();

final class MediaProgressByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<MediaProgress>,
          MediaProgress,
          FutureOr<MediaProgress>
        >
    with $FutureModifier<MediaProgress>, $FutureProvider<MediaProgress> {
  MediaProgressByIdProvider._({
    required MediaProgressByIdFamily super.from,
    required (String, String?) super.argument,
  }) : super(
         retry: null,
         name: r'mediaProgressByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mediaProgressByIdHash();

  @override
  String toString() {
    return r'mediaProgressByIdProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<MediaProgress> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MediaProgress> create(Ref ref) {
    final argument = this.argument as (String, String?);
    return mediaProgressById(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is MediaProgressByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mediaProgressByIdHash() => r'a76b7a6a40aeea20f2e236633741d10ae6f580a2';

final class MediaProgressByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MediaProgress>, (String, String?)> {
  MediaProgressByIdFamily._()
    : super(
        retry: null,
        name: r'mediaProgressByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MediaProgressByIdProvider call(String itemId, [String? episodeId]) =>
      MediaProgressByIdProvider._(argument: (itemId, episodeId), from: this);

  @override
  String toString() => r'mediaProgressByIdProvider';
}
