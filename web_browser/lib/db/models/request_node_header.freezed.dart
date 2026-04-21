// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_node_header.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RequestNodeHeader {

 NodePath get path; TreeId get treeId;
/// Create a copy of RequestNodeHeader
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestNodeHeaderCopyWith<RequestNodeHeader> get copyWith => _$RequestNodeHeaderCopyWithImpl<RequestNodeHeader>(this as RequestNodeHeader, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestNodeHeader&&(identical(other.path, path) || other.path == path)&&(identical(other.treeId, treeId) || other.treeId == treeId));
}


@override
int get hashCode => Object.hash(runtimeType,path,treeId);

@override
String toString() {
  return 'RequestNodeHeader(path: $path, treeId: $treeId)';
}


}

/// @nodoc
abstract mixin class $RequestNodeHeaderCopyWith<$Res>  {
  factory $RequestNodeHeaderCopyWith(RequestNodeHeader value, $Res Function(RequestNodeHeader) _then) = _$RequestNodeHeaderCopyWithImpl;
@useResult
$Res call({
 NodePath path, TreeId treeId
});


$NodePathCopyWith<$Res> get path;$TreeIdCopyWith<$Res> get treeId;

}
/// @nodoc
class _$RequestNodeHeaderCopyWithImpl<$Res>
    implements $RequestNodeHeaderCopyWith<$Res> {
  _$RequestNodeHeaderCopyWithImpl(this._self, this._then);

  final RequestNodeHeader _self;
  final $Res Function(RequestNodeHeader) _then;

/// Create a copy of RequestNodeHeader
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? treeId = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as NodePath,treeId: null == treeId ? _self.treeId : treeId // ignore: cast_nullable_to_non_nullable
as TreeId,
  ));
}
/// Create a copy of RequestNodeHeader
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodePathCopyWith<$Res> get path {
  
  return $NodePathCopyWith<$Res>(_self.path, (value) {
    return _then(_self.copyWith(path: value));
  });
}/// Create a copy of RequestNodeHeader
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TreeIdCopyWith<$Res> get treeId {
  
  return $TreeIdCopyWith<$Res>(_self.treeId, (value) {
    return _then(_self.copyWith(treeId: value));
  });
}
}


/// Adds pattern-matching-related methods to [RequestNodeHeader].
extension RequestNodeHeaderPatterns on RequestNodeHeader {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestNodeHeader value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestNodeHeader() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestNodeHeader value)  $default,){
final _that = this;
switch (_that) {
case _RequestNodeHeader():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestNodeHeader value)?  $default,){
final _that = this;
switch (_that) {
case _RequestNodeHeader() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NodePath path,  TreeId treeId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestNodeHeader() when $default != null:
return $default(_that.path,_that.treeId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NodePath path,  TreeId treeId)  $default,) {final _that = this;
switch (_that) {
case _RequestNodeHeader():
return $default(_that.path,_that.treeId);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NodePath path,  TreeId treeId)?  $default,) {final _that = this;
switch (_that) {
case _RequestNodeHeader() when $default != null:
return $default(_that.path,_that.treeId);case _:
  return null;

}
}

}

/// @nodoc


class _RequestNodeHeader implements RequestNodeHeader {
  const _RequestNodeHeader({required this.path, required this.treeId});
  

@override final  NodePath path;
@override final  TreeId treeId;

/// Create a copy of RequestNodeHeader
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestNodeHeaderCopyWith<_RequestNodeHeader> get copyWith => __$RequestNodeHeaderCopyWithImpl<_RequestNodeHeader>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestNodeHeader&&(identical(other.path, path) || other.path == path)&&(identical(other.treeId, treeId) || other.treeId == treeId));
}


@override
int get hashCode => Object.hash(runtimeType,path,treeId);

@override
String toString() {
  return 'RequestNodeHeader(path: $path, treeId: $treeId)';
}


}

/// @nodoc
abstract mixin class _$RequestNodeHeaderCopyWith<$Res> implements $RequestNodeHeaderCopyWith<$Res> {
  factory _$RequestNodeHeaderCopyWith(_RequestNodeHeader value, $Res Function(_RequestNodeHeader) _then) = __$RequestNodeHeaderCopyWithImpl;
@override @useResult
$Res call({
 NodePath path, TreeId treeId
});


@override $NodePathCopyWith<$Res> get path;@override $TreeIdCopyWith<$Res> get treeId;

}
/// @nodoc
class __$RequestNodeHeaderCopyWithImpl<$Res>
    implements _$RequestNodeHeaderCopyWith<$Res> {
  __$RequestNodeHeaderCopyWithImpl(this._self, this._then);

  final _RequestNodeHeader _self;
  final $Res Function(_RequestNodeHeader) _then;

/// Create a copy of RequestNodeHeader
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? treeId = null,}) {
  return _then(_RequestNodeHeader(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as NodePath,treeId: null == treeId ? _self.treeId : treeId // ignore: cast_nullable_to_non_nullable
as TreeId,
  ));
}

/// Create a copy of RequestNodeHeader
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodePathCopyWith<$Res> get path {
  
  return $NodePathCopyWith<$Res>(_self.path, (value) {
    return _then(_self.copyWith(path: value));
  });
}/// Create a copy of RequestNodeHeader
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TreeIdCopyWith<$Res> get treeId {
  
  return $TreeIdCopyWith<$Res>(_self.treeId, (value) {
    return _then(_self.copyWith(treeId: value));
  });
}
}

// dart format on
