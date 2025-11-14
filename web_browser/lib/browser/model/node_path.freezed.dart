// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node_path.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NodePath {

 List<int> get path;
/// Create a copy of NodePath
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NodePathCopyWith<NodePath> get copyWith => _$NodePathCopyWithImpl<NodePath>(this as NodePath, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodePath&&const DeepCollectionEquality().equals(other.path, path));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(path));

@override
String toString() {
  return 'NodePath(path: $path)';
}


}

/// @nodoc
abstract mixin class $NodePathCopyWith<$Res>  {
  factory $NodePathCopyWith(NodePath value, $Res Function(NodePath) _then) = _$NodePathCopyWithImpl;
@useResult
$Res call({
 List<int> path
});




}
/// @nodoc
class _$NodePathCopyWithImpl<$Res>
    implements $NodePathCopyWith<$Res> {
  _$NodePathCopyWithImpl(this._self, this._then);

  final NodePath _self;
  final $Res Function(NodePath) _then;

/// Create a copy of NodePath
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [NodePath].
extension NodePathPatterns on NodePath {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NodePath value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NodePath() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NodePath value)  $default,){
final _that = this;
switch (_that) {
case _NodePath():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NodePath value)?  $default,){
final _that = this;
switch (_that) {
case _NodePath() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> path)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NodePath() when $default != null:
return $default(_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> path)  $default,) {final _that = this;
switch (_that) {
case _NodePath():
return $default(_that.path);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> path)?  $default,) {final _that = this;
switch (_that) {
case _NodePath() when $default != null:
return $default(_that.path);case _:
  return null;

}
}

}

/// @nodoc


class _NodePath implements NodePath {
  const _NodePath({required final  List<int> path}): _path = path;
  

 final  List<int> _path;
@override List<int> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}


/// Create a copy of NodePath
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NodePathCopyWith<_NodePath> get copyWith => __$NodePathCopyWithImpl<_NodePath>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NodePath&&const DeepCollectionEquality().equals(other._path, _path));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_path));

@override
String toString() {
  return 'NodePath(path: $path)';
}


}

/// @nodoc
abstract mixin class _$NodePathCopyWith<$Res> implements $NodePathCopyWith<$Res> {
  factory _$NodePathCopyWith(_NodePath value, $Res Function(_NodePath) _then) = __$NodePathCopyWithImpl;
@override @useResult
$Res call({
 List<int> path
});




}
/// @nodoc
class __$NodePathCopyWithImpl<$Res>
    implements _$NodePathCopyWith<$Res> {
  __$NodePathCopyWithImpl(this._self, this._then);

  final _NodePath _self;
  final $Res Function(_NodePath) _then;

/// Create a copy of NodePath
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(_NodePath(
path: null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
