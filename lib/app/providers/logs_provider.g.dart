// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LogsNotifier)
final logsProvider = LogsNotifierProvider._();

final class LogsNotifierProvider
    extends $AsyncNotifierProvider<LogsNotifier, List<LogEntry>> {
  LogsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logsNotifierHash();

  @$internal
  @override
  LogsNotifier create() => LogsNotifier();
}

String _$logsNotifierHash() => r'1dbfb11c505008434a2777e2aa7e261dea58aa6f';

abstract class _$LogsNotifier extends $AsyncNotifier<List<LogEntry>> {
  FutureOr<List<LogEntry>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<LogEntry>>, List<LogEntry>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<LogEntry>>, List<LogEntry>>,
              AsyncValue<List<LogEntry>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredLogs)
final filteredLogsProvider = FilteredLogsProvider._();

final class FilteredLogsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LogEntry>>,
          List<LogEntry>,
          FutureOr<List<LogEntry>>
        >
    with $FutureModifier<List<LogEntry>>, $FutureProvider<List<LogEntry>> {
  FilteredLogsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredLogsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredLogsHash();

  @$internal
  @override
  $FutureProviderElement<List<LogEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LogEntry>> create(Ref ref) {
    return filteredLogs(ref);
  }
}

String _$filteredLogsHash() => r'd71ec27a8b0136cfa6c96262982f4f7abc621d91';
