// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress_actions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserProgressActionsNotifier)
final userProgressActionsProvider = UserProgressActionsNotifierFamily._();

final class UserProgressActionsNotifierProvider
    extends $NotifierProvider<UserProgressActionsNotifier, void> {
  UserProgressActionsNotifierProvider._({
    required UserProgressActionsNotifierFamily super.from,
    required (String, String?) super.argument,
  }) : super(
         retry: null,
         name: r'userProgressActionsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userProgressActionsNotifierHash();

  @override
  String toString() {
    return r'userProgressActionsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  UserProgressActionsNotifier create() => UserProgressActionsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UserProgressActionsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userProgressActionsNotifierHash() =>
    r'100a8851a05fef649b08115a826d71f9e0513ca8';

final class UserProgressActionsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          UserProgressActionsNotifier,
          void,
          void,
          void,
          (String, String?)
        > {
  UserProgressActionsNotifierFamily._()
    : super(
        retry: null,
        name: r'userProgressActionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  UserProgressActionsNotifierProvider call(
    String itemId, [
    String? episodeId,
  ]) => UserProgressActionsNotifierProvider._(
    argument: (itemId, episodeId),
    from: this,
  );

  @override
  String toString() => r'userProgressActionsProvider';
}

abstract class _$UserProgressActionsNotifier extends $Notifier<void> {
  late final _$args = ref.$arg as (String, String?);
  String get itemId => _$args.$1;
  String? get episodeId => _$args.$2;

  void build(String itemId, [String? episodeId]);
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
    return element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
