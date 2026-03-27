// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_filters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LibraryFiltersNotifier)
final libraryFiltersProvider = LibraryFiltersNotifierFamily._();

final class LibraryFiltersNotifierProvider
    extends $NotifierProvider<LibraryFiltersNotifier, FilterState> {
  LibraryFiltersNotifierProvider._({
    required LibraryFiltersNotifierFamily super.from,
    required CurrentScreen super.argument,
  }) : super(
         retry: null,
         name: r'libraryFiltersProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$libraryFiltersNotifierHash();

  @override
  String toString() {
    return r'libraryFiltersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LibraryFiltersNotifier create() => LibraryFiltersNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FilterState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LibraryFiltersNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$libraryFiltersNotifierHash() =>
    r'6998936732a3d7a672991c057266696bd4bb264b';

final class LibraryFiltersNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          LibraryFiltersNotifier,
          FilterState,
          FilterState,
          FilterState,
          CurrentScreen
        > {
  LibraryFiltersNotifierFamily._()
    : super(
        retry: null,
        name: r'libraryFiltersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  LibraryFiltersNotifierProvider call(CurrentScreen screen) =>
      LibraryFiltersNotifierProvider._(argument: screen, from: this);

  @override
  String toString() => r'libraryFiltersProvider';
}

abstract class _$LibraryFiltersNotifier extends $Notifier<FilterState> {
  late final _$args = ref.$arg as CurrentScreen;
  CurrentScreen get screen => _$args;

  FilterState build(CurrentScreen screen);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FilterState, FilterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FilterState, FilterState>,
              FilterState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(screenDisplayMode)
final screenDisplayModeProvider = ScreenDisplayModeFamily._();

final class ScreenDisplayModeProvider
    extends $FunctionalProvider<DisplayMode, DisplayMode, DisplayMode>
    with $Provider<DisplayMode> {
  ScreenDisplayModeProvider._({
    required ScreenDisplayModeFamily super.from,
    required CurrentScreen super.argument,
  }) : super(
         retry: null,
         name: r'screenDisplayModeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$screenDisplayModeHash();

  @override
  String toString() {
    return r'screenDisplayModeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<DisplayMode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DisplayMode create(Ref ref) {
    final argument = this.argument as CurrentScreen;
    return screenDisplayMode(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DisplayMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DisplayMode>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ScreenDisplayModeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$screenDisplayModeHash() => r'2ee093ec79ec2446c9a8f6114c960f3f913f19d5';

final class ScreenDisplayModeFamily extends $Family
    with $FunctionalFamilyOverride<DisplayMode, CurrentScreen> {
  ScreenDisplayModeFamily._()
    : super(
        retry: null,
        name: r'screenDisplayModeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ScreenDisplayModeProvider call(CurrentScreen screen) =>
      ScreenDisplayModeProvider._(argument: screen, from: this);

  @override
  String toString() => r'screenDisplayModeProvider';
}
