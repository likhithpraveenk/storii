// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get id; String get username; String? get email; UserType get type; List<MediaProgress> get mediaProgress; List<String> get seriesHideFromContinueListening; List<Bookmark> get bookmarks; bool get isActive; bool get isLocked; DateTime? get lastSeen; DateTime get createdAt; UserPermissions get permissions; List<String> get librariesAccessible; List<String> get itemTagsSelected; bool get hasOpenIDLink; String? get accessToken; String? get refreshToken;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.mediaProgress, mediaProgress)&&const DeepCollectionEquality().equals(other.seriesHideFromContinueListening, seriesHideFromContinueListening)&&const DeepCollectionEquality().equals(other.bookmarks, bookmarks)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.permissions, permissions) || other.permissions == permissions)&&const DeepCollectionEquality().equals(other.librariesAccessible, librariesAccessible)&&const DeepCollectionEquality().equals(other.itemTagsSelected, itemTagsSelected)&&(identical(other.hasOpenIDLink, hasOpenIDLink) || other.hasOpenIDLink == hasOpenIDLink)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email,type,const DeepCollectionEquality().hash(mediaProgress),const DeepCollectionEquality().hash(seriesHideFromContinueListening),const DeepCollectionEquality().hash(bookmarks),isActive,isLocked,lastSeen,createdAt,permissions,const DeepCollectionEquality().hash(librariesAccessible),const DeepCollectionEquality().hash(itemTagsSelected),hasOpenIDLink,accessToken,refreshToken);

@override
String toString() {
  return 'User(id: $id, username: $username, email: $email, type: $type, mediaProgress: $mediaProgress, seriesHideFromContinueListening: $seriesHideFromContinueListening, bookmarks: $bookmarks, isActive: $isActive, isLocked: $isLocked, lastSeen: $lastSeen, createdAt: $createdAt, permissions: $permissions, librariesAccessible: $librariesAccessible, itemTagsSelected: $itemTagsSelected, hasOpenIDLink: $hasOpenIDLink, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String username, String? email, UserType type, List<MediaProgress> mediaProgress, List<String> seriesHideFromContinueListening, List<Bookmark> bookmarks, bool isActive, bool isLocked, DateTime? lastSeen, DateTime createdAt, UserPermissions permissions, List<String> librariesAccessible, List<String> itemTagsSelected, bool hasOpenIDLink, String? accessToken, String? refreshToken
});


$UserPermissionsCopyWith<$Res> get permissions;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? email = freezed,Object? type = null,Object? mediaProgress = null,Object? seriesHideFromContinueListening = null,Object? bookmarks = null,Object? isActive = null,Object? isLocked = null,Object? lastSeen = freezed,Object? createdAt = null,Object? permissions = null,Object? librariesAccessible = null,Object? itemTagsSelected = null,Object? hasOpenIDLink = null,Object? accessToken = freezed,Object? refreshToken = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as UserType,mediaProgress: null == mediaProgress ? _self.mediaProgress : mediaProgress // ignore: cast_nullable_to_non_nullable
as List<MediaProgress>,seriesHideFromContinueListening: null == seriesHideFromContinueListening ? _self.seriesHideFromContinueListening : seriesHideFromContinueListening // ignore: cast_nullable_to_non_nullable
as List<String>,bookmarks: null == bookmarks ? _self.bookmarks : bookmarks // ignore: cast_nullable_to_non_nullable
as List<Bookmark>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as UserPermissions,librariesAccessible: null == librariesAccessible ? _self.librariesAccessible : librariesAccessible // ignore: cast_nullable_to_non_nullable
as List<String>,itemTagsSelected: null == itemTagsSelected ? _self.itemTagsSelected : itemTagsSelected // ignore: cast_nullable_to_non_nullable
as List<String>,hasOpenIDLink: null == hasOpenIDLink ? _self.hasOpenIDLink : hasOpenIDLink // ignore: cast_nullable_to_non_nullable
as bool,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPermissionsCopyWith<$Res> get permissions {
  
  return $UserPermissionsCopyWith<$Res>(_self.permissions, (value) {
    return _then(_self.copyWith(permissions: value));
  });
}
}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String? email,  UserType type,  List<MediaProgress> mediaProgress,  List<String> seriesHideFromContinueListening,  List<Bookmark> bookmarks,  bool isActive,  bool isLocked,  DateTime? lastSeen,  DateTime createdAt,  UserPermissions permissions,  List<String> librariesAccessible,  List<String> itemTagsSelected,  bool hasOpenIDLink,  String? accessToken,  String? refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.email,_that.type,_that.mediaProgress,_that.seriesHideFromContinueListening,_that.bookmarks,_that.isActive,_that.isLocked,_that.lastSeen,_that.createdAt,_that.permissions,_that.librariesAccessible,_that.itemTagsSelected,_that.hasOpenIDLink,_that.accessToken,_that.refreshToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String? email,  UserType type,  List<MediaProgress> mediaProgress,  List<String> seriesHideFromContinueListening,  List<Bookmark> bookmarks,  bool isActive,  bool isLocked,  DateTime? lastSeen,  DateTime createdAt,  UserPermissions permissions,  List<String> librariesAccessible,  List<String> itemTagsSelected,  bool hasOpenIDLink,  String? accessToken,  String? refreshToken)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.username,_that.email,_that.type,_that.mediaProgress,_that.seriesHideFromContinueListening,_that.bookmarks,_that.isActive,_that.isLocked,_that.lastSeen,_that.createdAt,_that.permissions,_that.librariesAccessible,_that.itemTagsSelected,_that.hasOpenIDLink,_that.accessToken,_that.refreshToken);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String? email,  UserType type,  List<MediaProgress> mediaProgress,  List<String> seriesHideFromContinueListening,  List<Bookmark> bookmarks,  bool isActive,  bool isLocked,  DateTime? lastSeen,  DateTime createdAt,  UserPermissions permissions,  List<String> librariesAccessible,  List<String> itemTagsSelected,  bool hasOpenIDLink,  String? accessToken,  String? refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.email,_that.type,_that.mediaProgress,_that.seriesHideFromContinueListening,_that.bookmarks,_that.isActive,_that.isLocked,_that.lastSeen,_that.createdAt,_that.permissions,_that.librariesAccessible,_that.itemTagsSelected,_that.hasOpenIDLink,_that.accessToken,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@DateTimeEpochConverter()
class _User implements User {
  const _User({required this.id, required this.username, this.email, required this.type, required final  List<MediaProgress> mediaProgress, required final  List<String> seriesHideFromContinueListening, required final  List<Bookmark> bookmarks, required this.isActive, required this.isLocked, this.lastSeen, required this.createdAt, required this.permissions, required final  List<String> librariesAccessible, required final  List<String> itemTagsSelected, required this.hasOpenIDLink, this.accessToken, this.refreshToken}): _mediaProgress = mediaProgress,_seriesHideFromContinueListening = seriesHideFromContinueListening,_bookmarks = bookmarks,_librariesAccessible = librariesAccessible,_itemTagsSelected = itemTagsSelected;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String username;
@override final  String? email;
@override final  UserType type;
 final  List<MediaProgress> _mediaProgress;
@override List<MediaProgress> get mediaProgress {
  if (_mediaProgress is EqualUnmodifiableListView) return _mediaProgress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaProgress);
}

 final  List<String> _seriesHideFromContinueListening;
@override List<String> get seriesHideFromContinueListening {
  if (_seriesHideFromContinueListening is EqualUnmodifiableListView) return _seriesHideFromContinueListening;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seriesHideFromContinueListening);
}

 final  List<Bookmark> _bookmarks;
@override List<Bookmark> get bookmarks {
  if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookmarks);
}

@override final  bool isActive;
@override final  bool isLocked;
@override final  DateTime? lastSeen;
@override final  DateTime createdAt;
@override final  UserPermissions permissions;
 final  List<String> _librariesAccessible;
@override List<String> get librariesAccessible {
  if (_librariesAccessible is EqualUnmodifiableListView) return _librariesAccessible;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_librariesAccessible);
}

 final  List<String> _itemTagsSelected;
@override List<String> get itemTagsSelected {
  if (_itemTagsSelected is EqualUnmodifiableListView) return _itemTagsSelected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemTagsSelected);
}

@override final  bool hasOpenIDLink;
@override final  String? accessToken;
@override final  String? refreshToken;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._mediaProgress, _mediaProgress)&&const DeepCollectionEquality().equals(other._seriesHideFromContinueListening, _seriesHideFromContinueListening)&&const DeepCollectionEquality().equals(other._bookmarks, _bookmarks)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.permissions, permissions) || other.permissions == permissions)&&const DeepCollectionEquality().equals(other._librariesAccessible, _librariesAccessible)&&const DeepCollectionEquality().equals(other._itemTagsSelected, _itemTagsSelected)&&(identical(other.hasOpenIDLink, hasOpenIDLink) || other.hasOpenIDLink == hasOpenIDLink)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email,type,const DeepCollectionEquality().hash(_mediaProgress),const DeepCollectionEquality().hash(_seriesHideFromContinueListening),const DeepCollectionEquality().hash(_bookmarks),isActive,isLocked,lastSeen,createdAt,permissions,const DeepCollectionEquality().hash(_librariesAccessible),const DeepCollectionEquality().hash(_itemTagsSelected),hasOpenIDLink,accessToken,refreshToken);

@override
String toString() {
  return 'User(id: $id, username: $username, email: $email, type: $type, mediaProgress: $mediaProgress, seriesHideFromContinueListening: $seriesHideFromContinueListening, bookmarks: $bookmarks, isActive: $isActive, isLocked: $isLocked, lastSeen: $lastSeen, createdAt: $createdAt, permissions: $permissions, librariesAccessible: $librariesAccessible, itemTagsSelected: $itemTagsSelected, hasOpenIDLink: $hasOpenIDLink, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String? email, UserType type, List<MediaProgress> mediaProgress, List<String> seriesHideFromContinueListening, List<Bookmark> bookmarks, bool isActive, bool isLocked, DateTime? lastSeen, DateTime createdAt, UserPermissions permissions, List<String> librariesAccessible, List<String> itemTagsSelected, bool hasOpenIDLink, String? accessToken, String? refreshToken
});


@override $UserPermissionsCopyWith<$Res> get permissions;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? email = freezed,Object? type = null,Object? mediaProgress = null,Object? seriesHideFromContinueListening = null,Object? bookmarks = null,Object? isActive = null,Object? isLocked = null,Object? lastSeen = freezed,Object? createdAt = null,Object? permissions = null,Object? librariesAccessible = null,Object? itemTagsSelected = null,Object? hasOpenIDLink = null,Object? accessToken = freezed,Object? refreshToken = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as UserType,mediaProgress: null == mediaProgress ? _self._mediaProgress : mediaProgress // ignore: cast_nullable_to_non_nullable
as List<MediaProgress>,seriesHideFromContinueListening: null == seriesHideFromContinueListening ? _self._seriesHideFromContinueListening : seriesHideFromContinueListening // ignore: cast_nullable_to_non_nullable
as List<String>,bookmarks: null == bookmarks ? _self._bookmarks : bookmarks // ignore: cast_nullable_to_non_nullable
as List<Bookmark>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as UserPermissions,librariesAccessible: null == librariesAccessible ? _self._librariesAccessible : librariesAccessible // ignore: cast_nullable_to_non_nullable
as List<String>,itemTagsSelected: null == itemTagsSelected ? _self._itemTagsSelected : itemTagsSelected // ignore: cast_nullable_to_non_nullable
as List<String>,hasOpenIDLink: null == hasOpenIDLink ? _self.hasOpenIDLink : hasOpenIDLink // ignore: cast_nullable_to_non_nullable
as bool,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPermissionsCopyWith<$Res> get permissions {
  
  return $UserPermissionsCopyWith<$Res>(_self.permissions, (value) {
    return _then(_self.copyWith(permissions: value));
  });
}
}

// dart format on
