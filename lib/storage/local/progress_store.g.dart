// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(progressStore)
final progressStoreProvider = ProgressStoreFamily._();

final class ProgressStoreProvider
    extends $FunctionalProvider<ProgressStore, ProgressStore, ProgressStore>
    with $Provider<ProgressStore> {
  ProgressStoreProvider._({
    required ProgressStoreFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'progressStoreProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$progressStoreHash();

  @override
  String toString() {
    return r'progressStoreProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ProgressStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProgressStore create(Ref ref) {
    final argument = this.argument as String;
    return progressStore(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProgressStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProgressStore>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProgressStoreProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$progressStoreHash() => r'3937380afdb074c86d3c59dcd6cb46ace3d4511d';

final class ProgressStoreFamily extends $Family
    with $FunctionalFamilyOverride<ProgressStore, String> {
  ProgressStoreFamily._()
    : super(
        retry: null,
        name: r'progressStoreProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProgressStoreProvider call(String userId) =>
      ProgressStoreProvider._(argument: userId, from: this);

  @override
  String toString() => r'progressStoreProvider';
}

@ProviderFor(ProgressMap)
final progressMapProvider = ProgressMapFamily._();

final class ProgressMapProvider
    extends $StreamNotifierProvider<ProgressMap, Map<String, MediaProgress>> {
  ProgressMapProvider._({
    required ProgressMapFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'progressMapProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$progressMapHash();

  @override
  String toString() {
    return r'progressMapProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProgressMap create() => ProgressMap();

  @override
  bool operator ==(Object other) {
    return other is ProgressMapProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$progressMapHash() => r'a98b3d52ca0b884236147bfed1c7c4ab67ea33e3';

final class ProgressMapFamily extends $Family
    with
        $ClassFamilyOverride<
          ProgressMap,
          AsyncValue<Map<String, MediaProgress>>,
          Map<String, MediaProgress>,
          Stream<Map<String, MediaProgress>>,
          String
        > {
  ProgressMapFamily._()
    : super(
        retry: null,
        name: r'progressMapProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProgressMapProvider call(String userId) =>
      ProgressMapProvider._(argument: userId, from: this);

  @override
  String toString() => r'progressMapProvider';
}

abstract class _$ProgressMap
    extends $StreamNotifier<Map<String, MediaProgress>> {
  late final _$args = ref.$arg as String;
  String get userId => _$args;

  Stream<Map<String, MediaProgress>> build(String userId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, MediaProgress>>,
              Map<String, MediaProgress>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, MediaProgress>>,
                Map<String, MediaProgress>
              >,
              AsyncValue<Map<String, MediaProgress>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
