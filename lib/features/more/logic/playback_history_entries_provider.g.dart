// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_history_entries_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playbackHistoryEntries)
final playbackHistoryEntriesProvider = PlaybackHistoryEntriesProvider._();

final class PlaybackHistoryEntriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PlaybackHistoryEntry>>,
          List<PlaybackHistoryEntry>,
          FutureOr<List<PlaybackHistoryEntry>>
        >
    with
        $FutureModifier<List<PlaybackHistoryEntry>>,
        $FutureProvider<List<PlaybackHistoryEntry>> {
  PlaybackHistoryEntriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playbackHistoryEntriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playbackHistoryEntriesHash();

  @$internal
  @override
  $FutureProviderElement<List<PlaybackHistoryEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PlaybackHistoryEntry>> create(Ref ref) {
    return playbackHistoryEntries(ref);
  }
}

String _$playbackHistoryEntriesHash() =>
    r'0dbaccc998f14babb8fcf96bfdc34a51a25ee327';
