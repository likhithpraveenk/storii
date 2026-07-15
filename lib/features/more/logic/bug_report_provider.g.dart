// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bug_report_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bugReportBody)
final bugReportBodyProvider = BugReportBodyProvider._();

final class BugReportBodyProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  BugReportBodyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bugReportBodyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bugReportBodyHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return bugReportBody(ref);
  }
}

String _$bugReportBodyHash() => r'4ecf3dbff5694f634f701484977b23c44519ef26';
