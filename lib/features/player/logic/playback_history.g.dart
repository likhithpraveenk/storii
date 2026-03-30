// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_history.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlaybackHistory)
final playbackHistoryProvider = PlaybackHistoryFamily._();

final class PlaybackHistoryProvider
    extends $NotifierProvider<PlaybackHistory, List<PlaybackEvent>> {
  PlaybackHistoryProvider._({
    required PlaybackHistoryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'playbackHistoryProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playbackHistoryHash();

  @override
  String toString() {
    return r'playbackHistoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PlaybackHistory create() => PlaybackHistory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PlaybackEvent> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PlaybackEvent>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PlaybackHistoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playbackHistoryHash() => r'aca153b4f78753abbbab0f064da95251d2dca6d7';

final class PlaybackHistoryFamily extends $Family
    with
        $ClassFamilyOverride<
          PlaybackHistory,
          List<PlaybackEvent>,
          List<PlaybackEvent>,
          List<PlaybackEvent>,
          String
        > {
  PlaybackHistoryFamily._()
    : super(
        retry: null,
        name: r'playbackHistoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  PlaybackHistoryProvider call(String mediaItemId) =>
      PlaybackHistoryProvider._(argument: mediaItemId, from: this);

  @override
  String toString() => r'playbackHistoryProvider';
}

abstract class _$PlaybackHistory extends $Notifier<List<PlaybackEvent>> {
  late final _$args = ref.$arg as String;
  String get mediaItemId => _$args;

  List<PlaybackEvent> build(String mediaItemId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<PlaybackEvent>, List<PlaybackEvent>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<PlaybackEvent>, List<PlaybackEvent>>,
              List<PlaybackEvent>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
