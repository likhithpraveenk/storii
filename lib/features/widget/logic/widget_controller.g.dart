// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(availableWidgetConfigs)
final availableWidgetConfigsProvider = AvailableWidgetConfigsProvider._();

final class AvailableWidgetConfigsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<int, WidgetConfig?>>,
          Map<int, WidgetConfig?>,
          FutureOr<Map<int, WidgetConfig?>>
        >
    with
        $FutureModifier<Map<int, WidgetConfig?>>,
        $FutureProvider<Map<int, WidgetConfig?>> {
  AvailableWidgetConfigsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'availableWidgetConfigsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$availableWidgetConfigsHash();

  @$internal
  @override
  $FutureProviderElement<Map<int, WidgetConfig?>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<int, WidgetConfig?>> create(Ref ref) {
    return availableWidgetConfigs(ref);
  }
}

String _$availableWidgetConfigsHash() =>
    r'd53fb8c7948be6aef72b304cd5e0b641e3e1e475';

@ProviderFor(WidgetController)
final widgetControllerProvider = WidgetControllerProvider._();

final class WidgetControllerProvider
    extends $NotifierProvider<WidgetController, void> {
  WidgetControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'widgetControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$widgetControllerHash();

  @$internal
  @override
  WidgetController create() => WidgetController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$widgetControllerHash() => r'32cc4f1d6156bbbc117d1d734e3fd35fd7995007';

abstract class _$WidgetController extends $Notifier<void> {
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
