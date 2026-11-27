// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TipsNotifier)
final tipsProvider = TipsNotifierProvider._();

final class TipsNotifierProvider
    extends $NotifierProvider<TipsNotifier, AppTips> {
  TipsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tipsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tipsNotifierHash();

  @$internal
  @override
  TipsNotifier create() => TipsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppTips value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppTips>(value),
    );
  }
}

String _$tipsNotifierHash() => r'048e6f906b2ef17240e5eba8d748ac9c9a813d3a';

abstract class _$TipsNotifier extends $Notifier<AppTips> {
  AppTips build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AppTips, AppTips>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppTips, AppTips>,
              AppTips,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
