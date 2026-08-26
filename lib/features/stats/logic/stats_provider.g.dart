// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stats)
final statsProvider = StatsProvider._();

final class StatsProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserStatsResponse>,
          UserStatsResponse,
          FutureOr<UserStatsResponse>
        >
    with
        $FutureModifier<UserStatsResponse>,
        $FutureProvider<UserStatsResponse> {
  StatsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'statsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$statsHash();

  @$internal
  @override
  $FutureProviderElement<UserStatsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserStatsResponse> create(Ref ref) {
    return stats(ref);
  }
}

String _$statsHash() => r'523d89f2ce91026774beb3d17f3ce63b32888041';
