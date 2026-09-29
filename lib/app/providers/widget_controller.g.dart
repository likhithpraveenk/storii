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
    extends $NotifierProvider<WidgetController, int?> {
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
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$widgetControllerHash() => r'1f3137b25ca7b93456ef1ab3e9403536ccbfd3dc';

abstract class _$WidgetController extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
