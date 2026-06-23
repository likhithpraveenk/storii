// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_request_params.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playRequestParams)
final playRequestParamsProvider = PlayRequestParamsProvider._();

final class PlayRequestParamsProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlayItemRequestParams>,
          PlayItemRequestParams,
          FutureOr<PlayItemRequestParams>
        >
    with
        $FutureModifier<PlayItemRequestParams>,
        $FutureProvider<PlayItemRequestParams> {
  PlayRequestParamsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playRequestParamsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playRequestParamsHash();

  @$internal
  @override
  $FutureProviderElement<PlayItemRequestParams> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PlayItemRequestParams> create(Ref ref) {
    return playRequestParams(ref);
  }
}

String _$playRequestParamsHash() => r'5c9e0fbcec7515d6376263836e41774f6c7a3665';
