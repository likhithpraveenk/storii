// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_episodes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recentEpisodes)
final recentEpisodesProvider = RecentEpisodesProvider._();

final class RecentEpisodesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PodcastEpisode>>,
          List<PodcastEpisode>,
          FutureOr<List<PodcastEpisode>>
        >
    with
        $FutureModifier<List<PodcastEpisode>>,
        $FutureProvider<List<PodcastEpisode>> {
  RecentEpisodesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentEpisodesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentEpisodesHash();

  @$internal
  @override
  $FutureProviderElement<List<PodcastEpisode>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PodcastEpisode>> create(Ref ref) {
    return recentEpisodes(ref);
  }
}

String _$recentEpisodesHash() => r'6e031483b312aa632b87abb6d3d73729ef2cd555';
