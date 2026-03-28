// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_position_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocalPositionNotifier)
final localPositionProvider = LocalPositionNotifierFamily._();

final class LocalPositionNotifierProvider
    extends $NotifierProvider<LocalPositionNotifier, Duration?> {
  LocalPositionNotifierProvider._({
    required LocalPositionNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'localPositionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$localPositionNotifierHash();

  @override
  String toString() {
    return r'localPositionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LocalPositionNotifier create() => LocalPositionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LocalPositionNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$localPositionNotifierHash() =>
    r'30e60638c09fea7e234afa3b96ace55153e43e51';

final class LocalPositionNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          LocalPositionNotifier,
          Duration?,
          Duration?,
          Duration?,
          String
        > {
  LocalPositionNotifierFamily._()
    : super(
        retry: null,
        name: r'localPositionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LocalPositionNotifierProvider call(String sessionId) =>
      LocalPositionNotifierProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'localPositionProvider';
}

abstract class _$LocalPositionNotifier extends $Notifier<Duration?> {
  late final _$args = ref.$arg as String;
  String get sessionId => _$args;

  Duration? build(String sessionId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Duration?, Duration?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Duration?, Duration?>,
              Duration?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
