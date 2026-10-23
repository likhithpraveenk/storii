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
    extends $FunctionalProvider<ApiClient, ApiClient, ApiClient>
    with $Provider<ApiClient> {
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
  $ProviderElement<ApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiClient create(Ref ref) {
    final argument = this.argument as UserDomain;
    return apiClient(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiClient>(value),
    );
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

String _$apiClientHash() => r'47d6311a5c0c3dc27ae9207673d3129780753224';

final class ApiClientFamily extends $Family
    with $FunctionalFamilyOverride<ApiClient, UserDomain> {
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
    extends $FunctionalProvider<ServerApi, ServerApi, ServerApi>
    with $Provider<ServerApi> {
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
  $ProviderElement<ServerApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ServerApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return serverApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServerApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServerApi>(value),
    );
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

String _$serverApiHash() => r'094454d1b17a90b44d78af781d510facb6bd2a31';

final class ServerApiFamily extends $Family
    with $FunctionalFamilyOverride<ServerApi, UserDomain> {
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
    extends $FunctionalProvider<LibraryApi, LibraryApi, LibraryApi>
    with $Provider<LibraryApi> {
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
  $ProviderElement<LibraryApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LibraryApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return libraryApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LibraryApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LibraryApi>(value),
    );
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

String _$libraryApiHash() => r'cb299e07668261ca00185f9a207c6bccc1a039ac';

final class LibraryApiFamily extends $Family
    with $FunctionalFamilyOverride<LibraryApi, UserDomain> {
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
    extends $FunctionalProvider<ItemApi, ItemApi, ItemApi>
    with $Provider<ItemApi> {
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
  $ProviderElement<ItemApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ItemApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return itemApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemApi>(value),
    );
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

String _$itemApiHash() => r'd2beb8eeadc4987af6bd32c1e28a51290e048098';

final class ItemApiFamily extends $Family
    with $FunctionalFamilyOverride<ItemApi, UserDomain> {
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

@ProviderFor(meApi)
final meApiProvider = MeApiFamily._();

final class MeApiProvider extends $FunctionalProvider<MeApi, MeApi, MeApi>
    with $Provider<MeApi> {
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
  $ProviderElement<MeApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MeApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return meApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MeApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MeApi>(value),
    );
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

String _$meApiHash() => r'f5c843b039a2ad9df108b31914ef51d8bff2d247';

final class MeApiFamily extends $Family
    with $FunctionalFamilyOverride<MeApi, UserDomain> {
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
    extends $FunctionalProvider<SessionsApi, SessionsApi, SessionsApi>
    with $Provider<SessionsApi> {
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
  $ProviderElement<SessionsApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SessionsApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return sessionsApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionsApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionsApi>(value),
    );
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

String _$sessionsApiHash() => r'ed380995c6dbcaf77fb8693c0c26562645735338';

final class SessionsApiFamily extends $Family
    with $FunctionalFamilyOverride<SessionsApi, UserDomain> {
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

String _$socketApiHash() => r'2f5523417992ff42ee48acdf2f693dfb18ba6efe';

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
    extends $FunctionalProvider<CollectionsApi, CollectionsApi, CollectionsApi>
    with $Provider<CollectionsApi> {
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
  $ProviderElement<CollectionsApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CollectionsApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return collectionsApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CollectionsApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CollectionsApi>(value),
    );
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

String _$collectionsApiHash() => r'4f5c8925efa9ee5a217dca3b5c47ee2b1e950fdd';

final class CollectionsApiFamily extends $Family
    with $FunctionalFamilyOverride<CollectionsApi, UserDomain> {
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
    extends $FunctionalProvider<PlaylistsApi, PlaylistsApi, PlaylistsApi>
    with $Provider<PlaylistsApi> {
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
  $ProviderElement<PlaylistsApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlaylistsApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return playlistsApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaylistsApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaylistsApi>(value),
    );
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

String _$playlistsApiHash() => r'fd10a423954be9ac85ea229025fbe0039ba6c8a1';

final class PlaylistsApiFamily extends $Family
    with $FunctionalFamilyOverride<PlaylistsApi, UserDomain> {
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

@ProviderFor(searchApi)
final searchApiProvider = SearchApiFamily._();

final class SearchApiProvider
    extends $FunctionalProvider<SearchApi, SearchApi, SearchApi>
    with $Provider<SearchApi> {
  SearchApiProvider._({
    required SearchApiFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'searchApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchApiHash();

  @override
  String toString() {
    return r'searchApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SearchApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SearchApi create(Ref ref) {
    final argument = this.argument as UserDomain;
    return searchApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchApiHash() => r'24df1ac5e9f079b02fa9b89d41141886ff05cbbe';

final class SearchApiFamily extends $Family
    with $FunctionalFamilyOverride<SearchApi, UserDomain> {
  SearchApiFamily._()
    : super(
        retry: null,
        name: r'searchApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SearchApiProvider call(UserDomain user) =>
      SearchApiProvider._(argument: user, from: this);

  @override
  String toString() => r'searchApiProvider';
}
