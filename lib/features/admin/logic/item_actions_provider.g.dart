// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_actions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScanItem)
final scanItemProvider = ScanItemProvider._();

final class ScanItemProvider
    extends $AsyncNotifierProvider<ScanItem, Set<String>> {
  ScanItemProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanItemProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanItemHash();

  @$internal
  @override
  ScanItem create() => ScanItem();
}

String _$scanItemHash() => r'8941b758db372930f07c85102412431cadbd8b80';

abstract class _$ScanItem extends $AsyncNotifier<Set<String>> {
  FutureOr<Set<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Set<String>>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Set<String>>, Set<String>>,
              AsyncValue<Set<String>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
