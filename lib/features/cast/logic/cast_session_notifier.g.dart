// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_session_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CastSessionNotifier)
final castSessionProvider = CastSessionNotifierFamily._();

final class CastSessionNotifierProvider
    extends $StreamNotifierProvider<CastSessionNotifier, CastSession?> {
  CastSessionNotifierProvider._({
    required CastSessionNotifierFamily super.from,
    required (String, String?) super.argument,
  }) : super(
         retry: null,
         name: r'castSessionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$castSessionNotifierHash();

  @override
  String toString() {
    return r'castSessionProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  CastSessionNotifier create() => CastSessionNotifier();

  @override
  bool operator ==(Object other) {
    return other is CastSessionNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$castSessionNotifierHash() =>
    r'8099144664c33112c6fb7572a62fc074544762d6';

final class CastSessionNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CastSessionNotifier,
          AsyncValue<CastSession?>,
          CastSession?,
          Stream<CastSession?>,
          (String, String?)
        > {
  CastSessionNotifierFamily._()
    : super(
        retry: null,
        name: r'castSessionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CastSessionNotifierProvider call(String itemId, [String? episodeId]) =>
      CastSessionNotifierProvider._(argument: (itemId, episodeId), from: this);

  @override
  String toString() => r'castSessionProvider';
}

abstract class _$CastSessionNotifier extends $StreamNotifier<CastSession?> {
  late final _$args = ref.$arg as (String, String?);
  String get itemId => _$args.$1;
  String? get episodeId => _$args.$2;

  Stream<CastSession?> build(String itemId, [String? episodeId]);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CastSession?>, CastSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CastSession?>, CastSession?>,
              AsyncValue<CastSession?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
