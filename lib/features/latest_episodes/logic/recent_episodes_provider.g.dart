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

String _$recentEpisodesHash() => r'7190fb3ab02358efdde7e6d9301503f7dc9c27eb';
