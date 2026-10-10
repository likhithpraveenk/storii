// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WidgetStore)
final widgetStoreProvider = WidgetStoreProvider._();

final class WidgetStoreProvider extends $NotifierProvider<WidgetStore, void> {
  WidgetStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'widgetStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$widgetStoreHash();

  @$internal
  @override
  WidgetStore create() => WidgetStore();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$widgetStoreHash() => r'53a5e93575663fada15c641fec74d1960651ea70';

abstract class _$WidgetStore extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
