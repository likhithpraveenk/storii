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
          List<PlaybackHistoryEntry>,
          List<PlaybackHistoryEntry>,
          List<PlaybackHistoryEntry>
        >
    with $Provider<List<PlaybackHistoryEntry>> {
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
  $ProviderElement<List<PlaybackHistoryEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<PlaybackHistoryEntry> create(Ref ref) {
    return playbackHistoryEntries(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PlaybackHistoryEntry> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PlaybackHistoryEntry>>(value),
    );
  }
}

String _$playbackHistoryEntriesHash() =>
    r'5c2319ac57f9bebd295e83e2e0a10f0867d4a4e3';
