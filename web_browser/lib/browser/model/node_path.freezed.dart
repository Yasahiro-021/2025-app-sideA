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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodePath);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NodePath()';
}


}

/// @nodoc
class $NodePathCopyWith<$Res>  {
$NodePathCopyWith(NodePath _, $Res Function(NodePath) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( Normal value)?  $default,{TResult Function( Root value)?  root,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Normal() when $default != null:
return $default(_that);case Root() when root != null:
return root(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( Normal value)  $default,{required TResult Function( Root value)  root,}){
final _that = this;
switch (_that) {
case Normal():
return $default(_that);case Root():
return root(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( Normal value)?  $default,{TResult? Function( Root value)?  root,}){
final _that = this;
switch (_that) {
case Normal() when $default != null:
return $default(_that);case Root() when root != null:
return root(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> path)?  $default,{TResult Function()?  root,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Normal() when $default != null:
return $default(_that.path);case Root() when root != null:
return root();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> path)  $default,{required TResult Function()  root,}) {final _that = this;
switch (_that) {
case Normal():
return $default(_that.path);case Root():
return root();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> path)?  $default,{TResult? Function()?  root,}) {final _that = this;
switch (_that) {
case Normal() when $default != null:
return $default(_that.path);case Root() when root != null:
return root();case _:
  return null;

}
}

}

/// @nodoc


class Normal implements NodePath {
  const Normal({required final  List<int> path}): _path = path;
  

 final  List<int> _path;
 List<int> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}


/// Create a copy of NodePath
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NormalCopyWith<Normal> get copyWith => _$NormalCopyWithImpl<Normal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Normal&&const DeepCollectionEquality().equals(other._path, _path));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_path));

@override
String toString() {
  return 'NodePath(path: $path)';
}


}

/// @nodoc
abstract mixin class $NormalCopyWith<$Res> implements $NodePathCopyWith<$Res> {
  factory $NormalCopyWith(Normal value, $Res Function(Normal) _then) = _$NormalCopyWithImpl;
@useResult
$Res call({
 List<int> path
});




}
/// @nodoc
class _$NormalCopyWithImpl<$Res>
    implements $NormalCopyWith<$Res> {
  _$NormalCopyWithImpl(this._self, this._then);

  final Normal _self;
  final $Res Function(Normal) _then;

/// Create a copy of NodePath
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(Normal(
path: null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc


class Root implements NodePath {
  const Root();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Root);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NodePath.root()';
}


}




// dart format on
