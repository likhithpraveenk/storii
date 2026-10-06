// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiClient)
final apiClientProvider = ApiClientFamily._();

final class ApiClientProvider
    extends
        $FunctionalProvider<
          AsyncValue<ApiClient>,
          ApiClient,
          FutureOr<ApiClient>
        >
    with $FutureModifier<ApiClient>, $FutureProvider<ApiClient> {
  ApiClientProvider._({
    required ApiClientFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'apiClientProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @override
  String toString() {
    return r'apiClientProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ApiClient> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ApiClient> create(Ref ref) {
    final argument = this.argument as UserDomain;
    return apiClient(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiClientProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$apiClientHash() => r'cd8a83565d39ef86d09396b2e9651a486da8c6cf';

final class ApiClientFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ApiClient>, UserDomain> {
  ApiClientFamily._()
    : super(
        retry: null,
        name: r'apiClientProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ApiClientProvider call(UserDomain user) =>
      ApiClientProvider._(argument: user, from: this);

  @override
  String toString() => r'apiClientProvider';
}

@ProviderFor(authApi)
final authApiProvider = AuthApiFamily._();

final class AuthApiProvider
    extends $FunctionalProvider<AuthApi, AuthApi, AuthApi>
    with $Provider<AuthApi> {
  AuthApiProvider._({
    required AuthApiFamily super.from,
    required Uri super.argument,
  }) : super(
         retry: null,
         name: r'authApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authApiHash();

  @override
  String toString() {
    return r'authApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AuthApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthApi create(Ref ref) {
    final argument = this.argument as Uri;
    return authApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AuthApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authApiHash() => r'3c39aa76e0f3262e7722072c448787f1b8be7b1f';

final class AuthApiFamily extends $Family
    with $FunctionalFamilyOverride<AuthApi, Uri> {
  AuthApiFamily._()
    : super(
        retry: null,
        name: r'authApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthApiProvider call(Uri baseUrl) =>
      AuthApiProvider._(argument: baseUrl, from: this);

  @override
  String toString() => r'authApiProvider';
}

@ProviderFor(serverApi)
final serverApiProvider = ServerApiFamily._();

final class ServerApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<ServerApi>,
          ServerApi,
          FutureOr<ServerApi>
        >
    with $FutureModifier<ServerApi>, $FutureProvider<ServerApi> {
  ServerApiProvider._({
    required ServerApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'serverApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$serverApiHash();

  @override
  String toString() {
    return r'serverApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ServerApi> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ServerApi> create(Ref ref) {
    final argument = this.argument as UserDomain;
    return serverApi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ServerApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$serverApiHash() => r'b0476968779eba05485c998aaa5781294cb21d7a';

final class ServerApiFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ServerApi>, UserDomain> {
  ServerApiFamily._()
    : super(
        retry: null,
        name: r'serverApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ServerApiProvider call(UserDomain user) =>
      ServerApiProvider._(argument: user, from: this);

  @override
  String toString() => r'serverApiProvider';
}

@ProviderFor(libraryApi)
final libraryApiProvider = LibraryApiFamily._();

final class LibraryApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<LibraryApi>,
          LibraryApi,
          FutureOr<LibraryApi>
        >
    with $FutureModifier<LibraryApi>, $FutureProvider<LibraryApi> {
  LibraryApiProvider._({
    required LibraryApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'libraryApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$libraryApiHash();

  @override
  String toString() {
    return r'libraryApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LibraryApi> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<LibraryApi> create(Ref ref) {
    final argument = this.argument as UserDomain;
    return libraryApi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LibraryApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$libraryApiHash() => r'f7ba53b115889a7e14415907c44b62097ae5449f';

final class LibraryApiFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LibraryApi>, UserDomain> {
  LibraryApiFamily._()
    : super(
        retry: null,
        name: r'libraryApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LibraryApiProvider call(UserDomain user) =>
      LibraryApiProvider._(argument: user, from: this);

  @override
  String toString() => r'libraryApiProvider';
}

@ProviderFor(itemApi)
final itemApiProvider = ItemApiFamily._();

final class ItemApiProvider
    extends $FunctionalProvider<AsyncValue<ItemApi>, ItemApi, FutureOr<ItemApi>>
    with $FutureModifier<ItemApi>, $FutureProvider<ItemApi> {
  ItemApiProvider._({
    required ItemApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'itemApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemApiHash();

  @override
  String toString() {
    return r'itemApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ItemApi> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ItemApi> create(Ref ref) {
    final argument = this.argument as UserDomain;
    return itemApi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemApiHash() => r'30c04e51cf858cfbf34f177093bea1132573aec2';

final class ItemApiFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ItemApi>, UserDomain> {
  ItemApiFamily._()
    : super(
        retry: null,
        name: r'itemApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemApiProvider call(UserDomain user) =>
      ItemApiProvider._(argument: user, from: this);

  @override
  String toString() => r'itemApiProvider';
}

@ProviderFor(authorApi)
final authorApiProvider = AuthorApiFamily._();

final class AuthorApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthorApi>,
          AuthorApi,
          FutureOr<AuthorApi>
        >
    with $FutureModifier<AuthorApi>, $FutureProvider<AuthorApi> {
  AuthorApiProvider._({
    required AuthorApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'authorApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authorApiHash();

  @override
  String toString() {
    return r'authorApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AuthorApi> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AuthorApi> create(Ref ref) {
    final argument = this.argument as UserDomain;
    return authorApi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AuthorApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authorApiHash() => r'cda7b7d996a0dace467ec0d5d6660929073bcec5';

final class AuthorApiFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AuthorApi>, UserDomain> {
  AuthorApiFamily._()
    : super(
        retry: null,
        name: r'authorApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthorApiProvider call(UserDomain user) =>
      AuthorApiProvider._(argument: user, from: this);

  @override
  String toString() => r'authorApiProvider';
}

@ProviderFor(meApi)
final meApiProvider = MeApiFamily._();

final class MeApiProvider
    extends $FunctionalProvider<AsyncValue<MeApi>, MeApi, FutureOr<MeApi>>
    with $FutureModifier<MeApi>, $FutureProvider<MeApi> {
  MeApiProvider._({
    required MeApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'meApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$meApiHash();

  @override
  String toString() {
    return r'meApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<MeApi> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<MeApi> create(Ref ref) {
    final argument = this.argument as UserDomain;
    return meApi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MeApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$meApiHash() => r'e41ebf6cdd933b071988584901196f5e8a5e1e94';

final class MeApiFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MeApi>, UserDomain> {
  MeApiFamily._()
    : super(
        retry: null,
        name: r'meApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MeApiProvider call(UserDomain user) =>
      MeApiProvider._(argument: user, from: this);

  @override
  String toString() => r'meApiProvider';
}

@ProviderFor(sessionsApi)
final sessionsApiProvider = SessionsApiFamily._();

final class SessionsApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<SessionsApi>,
          SessionsApi,
          FutureOr<SessionsApi>
        >
    with $FutureModifier<SessionsApi>, $FutureProvider<SessionsApi> {
  SessionsApiProvider._({
    required SessionsApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'sessionsApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionsApiHash();

  @override
  String toString() {
    return r'sessionsApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SessionsApi> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SessionsApi> create(Ref ref) {
    final argument = this.argument as UserDomain;
    return sessionsApi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionsApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionsApiHash() => r'224acfce41426f5ee02e9842f1ecd64ff717d61a';

final class SessionsApiFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SessionsApi>, UserDomain> {
  SessionsApiFamily._()
    : super(
        retry: null,
        name: r'sessionsApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionsApiProvider call(UserDomain user) =>
      SessionsApiProvider._(argument: user, from: this);

  @override
  String toString() => r'sessionsApiProvider';
}

@ProviderFor(socketApi)
final socketApiProvider = SocketApiFamily._();

final class SocketApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<SocketApi>,
          SocketApi,
          FutureOr<SocketApi>
        >
    with $FutureModifier<SocketApi>, $FutureProvider<SocketApi> {
  SocketApiProvider._({
    required SocketApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'socketApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$socketApiHash();

  @override
  String toString() {
    return r'socketApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SocketApi> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SocketApi> create(Ref ref) {
    final argument = this.argument as UserDomain;
    return socketApi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SocketApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$socketApiHash() => r'95f1387d50571a3b3f86eeed2b6551b0da9503df';

final class SocketApiFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SocketApi>, UserDomain> {
  SocketApiFamily._()
    : super(
        retry: null,
        name: r'socketApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SocketApiProvider call(UserDomain user) =>
      SocketApiProvider._(argument: user, from: this);

  @override
  String toString() => r'socketApiProvider';
}

@ProviderFor(collectionsApi)
final collectionsApiProvider = CollectionsApiFamily._();

final class CollectionsApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<CollectionsApi>,
          CollectionsApi,
          FutureOr<CollectionsApi>
        >
    with $FutureModifier<CollectionsApi>, $FutureProvider<CollectionsApi> {
  CollectionsApiProvider._({
    required CollectionsApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'collectionsApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$collectionsApiHash();

  @override
  String toString() {
    return r'collectionsApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CollectionsApi> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CollectionsApi> create(Ref ref) {
    final argument = this.argument as UserDomain;
    return collectionsApi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionsApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$collectionsApiHash() => r'4525bd897cfc323e7f6d753416b4275f3725349b';

final class CollectionsApiFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CollectionsApi>, UserDomain> {
  CollectionsApiFamily._()
    : super(
        retry: null,
        name: r'collectionsApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CollectionsApiProvider call(UserDomain user) =>
      CollectionsApiProvider._(argument: user, from: this);

  @override
  String toString() => r'collectionsApiProvider';
}

@ProviderFor(playlistsApi)
final playlistsApiProvider = PlaylistsApiFamily._();

final class PlaylistsApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlaylistsApi>,
          PlaylistsApi,
          FutureOr<PlaylistsApi>
        >
    with $FutureModifier<PlaylistsApi>, $FutureProvider<PlaylistsApi> {
  PlaylistsApiProvider._({
    required PlaylistsApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'playlistsApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$playlistsApiHash();

  @override
  String toString() {
    return r'playlistsApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PlaylistsApi> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PlaylistsApi> create(Ref ref) {
    final argument = this.argument as UserDomain;
    return playlistsApi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaylistsApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$playlistsApiHash() => r'da2ad7b3d0e8b553d44a65bbf86250f83ed10231';

final class PlaylistsApiFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PlaylistsApi>, UserDomain> {
  PlaylistsApiFamily._()
    : super(
        retry: null,
        name: r'playlistsApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlaylistsApiProvider call(UserDomain user) =>
      PlaylistsApiProvider._(argument: user, from: this);

  @override
  String toString() => r'playlistsApiProvider';
}
