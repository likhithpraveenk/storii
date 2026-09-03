// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_auto_helper.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(androidAutoTopLevelNodes)
final androidAutoTopLevelNodesProvider = AndroidAutoTopLevelNodesProvider._();

final class AndroidAutoTopLevelNodesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AndroidAutoNode>>,
          List<AndroidAutoNode>,
          FutureOr<List<AndroidAutoNode>>
        >
    with
        $FutureModifier<List<AndroidAutoNode>>,
        $FutureProvider<List<AndroidAutoNode>> {
  AndroidAutoTopLevelNodesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'androidAutoTopLevelNodesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$androidAutoTopLevelNodesHash();

  @$internal
  @override
  $FutureProviderElement<List<AndroidAutoNode>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AndroidAutoNode>> create(Ref ref) {
    return androidAutoTopLevelNodes(ref);
  }
}

String _$androidAutoTopLevelNodesHash() =>
    r'c5fb6a5ceb48852b8b241d94c6c2e168033c446c';
