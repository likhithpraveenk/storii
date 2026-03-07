// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_progress_map_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mediaProgressMap)
final mediaProgressMapProvider = MediaProgressMapProvider._();

final class MediaProgressMapProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, MediaProgress>>,
          Map<String, MediaProgress>,
          FutureOr<Map<String, MediaProgress>>
        >
    with
        $FutureModifier<Map<String, MediaProgress>>,
        $FutureProvider<Map<String, MediaProgress>> {
  MediaProgressMapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaProgressMapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaProgressMapHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, MediaProgress>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, MediaProgress>> create(Ref ref) {
    return mediaProgressMap(ref);
  }
}

String _$mediaProgressMapHash() => r'2d4858fcbdb3b1056b7e9217ec6927367e2d8fd6';
