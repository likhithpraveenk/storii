// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changelog_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(changelog)
final changelogProvider = ChangelogProvider._();

final class ChangelogProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ChangelogEntry>>,
          List<ChangelogEntry>,
          FutureOr<List<ChangelogEntry>>
        >
    with
        $FutureModifier<List<ChangelogEntry>>,
        $FutureProvider<List<ChangelogEntry>> {
  ChangelogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'changelogProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$changelogHash();

  @$internal
  @override
  $FutureProviderElement<List<ChangelogEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ChangelogEntry>> create(Ref ref) {
    return changelog(ref);
  }
}

String _$changelogHash() => r'3b4b2871308d2d7dc7f556985a994301139ac5ab';

@ProviderFor(whatsNew)
final whatsNewProvider = WhatsNewProvider._();

final class WhatsNewProvider
    extends
        $FunctionalProvider<
          AsyncValue<ChangelogEntry?>,
          ChangelogEntry?,
          FutureOr<ChangelogEntry?>
        >
    with $FutureModifier<ChangelogEntry?>, $FutureProvider<ChangelogEntry?> {
  WhatsNewProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'whatsNewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$whatsNewHash();

  @$internal
  @override
  $FutureProviderElement<ChangelogEntry?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ChangelogEntry?> create(Ref ref) {
    return whatsNew(ref);
  }
}

String _$whatsNewHash() => r'efed4cf222096e94226eb035e3f73af59ebcd607';

@ProviderFor(whatsNewController)
final whatsNewControllerProvider = WhatsNewControllerProvider._();

final class WhatsNewControllerProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  WhatsNewControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'whatsNewControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$whatsNewControllerHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return whatsNewController(ref);
  }
}

String _$whatsNewControllerHash() =>
    r'e7628748a149cf39b50904176ab304ea6c02a619';
