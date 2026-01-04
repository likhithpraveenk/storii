// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_status.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userAuthStatus)
final userAuthStatusProvider = UserAuthStatusFamily._();

final class UserAuthStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserAuthStatus>,
          UserAuthStatus,
          FutureOr<UserAuthStatus>
        >
    with $FutureModifier<UserAuthStatus>, $FutureProvider<UserAuthStatus> {
  UserAuthStatusProvider._({
    required UserAuthStatusFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userAuthStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userAuthStatusHash();

  @override
  String toString() {
    return r'userAuthStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<UserAuthStatus> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserAuthStatus> create(Ref ref) {
    final argument = this.argument as String;
    return userAuthStatus(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserAuthStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userAuthStatusHash() => r'd1b09912d2825d0def1ba71fd72887362f97e806';

final class UserAuthStatusFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<UserAuthStatus>, String> {
  UserAuthStatusFamily._()
    : super(
        retry: null,
        name: r'userAuthStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserAuthStatusProvider call(String userId) =>
      UserAuthStatusProvider._(argument: userId, from: this);

  @override
  String toString() => r'userAuthStatusProvider';
}
