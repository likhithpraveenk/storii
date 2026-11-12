// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_history.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlaybackHistoryNotifier)
final playbackHistoryProvider = PlaybackHistoryNotifierFamily._();

final class PlaybackHistoryNotifierProvider
    extends
        $AsyncNotifierProvider<PlaybackHistoryNotifier, List<PlaybackEvent>> {
  PlaybackHistoryNotifierProvider._({
    required PlaybackHistoryNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'playbackHistoryProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playbackHistoryNotifierHash();

  @override
  String toString() {
    return r'playbackHistoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PlaybackHistoryNotifier create() => PlaybackHistoryNotifier();

  @override
  bool operator ==(Object other) {
    return other is PlaybackHistoryNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playbackHistoryNotifierHash() =>
    r'9abe2d463f89c66f093dc3e2f158ade5c98e22f3';

final class PlaybackHistoryNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PlaybackHistoryNotifier,
          AsyncValue<List<PlaybackEvent>>,
          List<PlaybackEvent>,
          FutureOr<List<PlaybackEvent>>,
          String
        > {
  PlaybackHistoryNotifierFamily._()
    : super(
        retry: null,
        name: r'playbackHistoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  PlaybackHistoryNotifierProvider call(String mediaItemId) =>
      PlaybackHistoryNotifierProvider._(argument: mediaItemId, from: this);

  @override
  String toString() => r'playbackHistoryProvider';
}

abstract class _$PlaybackHistoryNotifier
    extends $AsyncNotifier<List<PlaybackEvent>> {
  late final _$args = ref.$arg as String;
  String get mediaItemId => _$args;

  FutureOr<List<PlaybackEvent>> build(String mediaItemId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<PlaybackEvent>>, List<PlaybackEvent>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PlaybackEvent>>, List<PlaybackEvent>>,
              AsyncValue<List<PlaybackEvent>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
