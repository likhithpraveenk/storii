// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EpisodeFilterNotifier)
final episodeFilterProvider = EpisodeFilterNotifierProvider._();

final class EpisodeFilterNotifierProvider
    extends $NotifierProvider<EpisodeFilterNotifier, EpisodeFilterState> {
  EpisodeFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'episodeFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$episodeFilterNotifierHash();

  @$internal
  @override
  EpisodeFilterNotifier create() => EpisodeFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EpisodeFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EpisodeFilterState>(value),
    );
  }
}

String _$episodeFilterNotifierHash() =>
    r'8c998c2c622b25e1a6ff8197769a76ec55840619';

abstract class _$EpisodeFilterNotifier extends $Notifier<EpisodeFilterState> {
  EpisodeFilterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<EpisodeFilterState, EpisodeFilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EpisodeFilterState, EpisodeFilterState>,
              EpisodeFilterState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredEpisodes)
final filteredEpisodesProvider = FilteredEpisodesFamily._();

final class FilteredEpisodesProvider
    extends
        $FunctionalProvider<
          List<PodcastEpisode>,
          List<PodcastEpisode>,
          List<PodcastEpisode>
        >
    with $Provider<List<PodcastEpisode>> {
  FilteredEpisodesProvider._({
    required FilteredEpisodesFamily super.from,
    required ({List<PodcastEpisode> episodes, String itemId}) super.argument,
  }) : super(
         retry: null,
         name: r'filteredEpisodesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredEpisodesHash();

  @override
  String toString() {
    return r'filteredEpisodesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<PodcastEpisode>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<PodcastEpisode> create(Ref ref) {
    final argument =
        this.argument as ({List<PodcastEpisode> episodes, String itemId});
    return filteredEpisodes(
      ref,
      episodes: argument.episodes,
      itemId: argument.itemId,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PodcastEpisode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PodcastEpisode>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredEpisodesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredEpisodesHash() => r'b7efcdf6e482f5aad37db28039026655a5faaa4f';

final class FilteredEpisodesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          List<PodcastEpisode>,
          ({List<PodcastEpisode> episodes, String itemId})
        > {
  FilteredEpisodesFamily._()
    : super(
        retry: null,
        name: r'filteredEpisodesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredEpisodesProvider call({
    required List<PodcastEpisode> episodes,
    required String itemId,
  }) => FilteredEpisodesProvider._(
    argument: (episodes: episodes, itemId: itemId),
    from: this,
  );

  @override
  String toString() => r'filteredEpisodesProvider';
}
