// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
        isAutoDispose: true,
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

String _$widgetControllerHash() => r'34228220977efeb5aa9a8a393b08a0bc6f2671a1';

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
