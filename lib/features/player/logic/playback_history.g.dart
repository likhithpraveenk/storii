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
    extends $NotifierProvider<PlaybackHistoryNotifier, List<PlaybackEvent>> {
  PlaybackHistoryNotifierProvider._({
    required PlaybackHistoryNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'playbackHistoryProvider',
         isAutoDispose: true,
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PlaybackEvent> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PlaybackEvent>>(value),
    );
  }

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
    r'a935cbfc28d1753549733c624ebecb8ebc0da194';

final class PlaybackHistoryNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PlaybackHistoryNotifier,
          List<PlaybackEvent>,
          List<PlaybackEvent>,
          List<PlaybackEvent>,
          String
        > {
  PlaybackHistoryNotifierFamily._()
    : super(
        retry: null,
        name: r'playbackHistoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlaybackHistoryNotifierProvider call(String mediaItemId) =>
      PlaybackHistoryNotifierProvider._(argument: mediaItemId, from: this);

  @override
  String toString() => r'playbackHistoryProvider';
}

abstract class _$PlaybackHistoryNotifier
    extends $Notifier<List<PlaybackEvent>> {
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
