// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NodeGroup {

 NodePath get parentPath; double get leftPos; double get rightPos;
/// Create a copy of NodeGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NodeGroupCopyWith<NodeGroup> get copyWith => _$NodeGroupCopyWithImpl<NodeGroup>(this as NodeGroup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodeGroup&&(identical(other.parentPath, parentPath) || other.parentPath == parentPath)&&(identical(other.leftPos, leftPos) || other.leftPos == leftPos)&&(identical(other.rightPos, rightPos) || other.rightPos == rightPos));
}


@override
int get hashCode => Object.hash(runtimeType,parentPath,leftPos,rightPos);

@override
String toString() {
  return 'NodeGroup(parentPath: $parentPath, leftPos: $leftPos, rightPos: $rightPos)';
}


}

/// @nodoc
abstract mixin class $NodeGroupCopyWith<$Res>  {
  factory $NodeGroupCopyWith(NodeGroup value, $Res Function(NodeGroup) _then) = _$NodeGroupCopyWithImpl;
@useResult
$Res call({
 NodePath parentPath, double leftPos, double rightPos
});


$NodePathCopyWith<$Res> get parentPath;

}
/// @nodoc
class _$NodeGroupCopyWithImpl<$Res>
    implements $NodeGroupCopyWith<$Res> {
  _$NodeGroupCopyWithImpl(this._self, this._then);

  final NodeGroup _self;
  final $Res Function(NodeGroup) _then;

/// Create a copy of NodeGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parentPath = null,Object? leftPos = null,Object? rightPos = null,}) {
  return _then(_self.copyWith(
parentPath: null == parentPath ? _self.parentPath : parentPath // ignore: cast_nullable_to_non_nullable
as NodePath,leftPos: null == leftPos ? _self.leftPos : leftPos // ignore: cast_nullable_to_non_nullable
as double,rightPos: null == rightPos ? _self.rightPos : rightPos // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of NodeGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodePathCopyWith<$Res> get parentPath {
  
  return $NodePathCopyWith<$Res>(_self.parentPath, (value) {
    return _then(_self.copyWith(parentPath: value));
  });
}
}


/// Adds pattern-matching-related methods to [NodeGroup].
extension NodeGroupPatterns on NodeGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NodeGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NodeGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NodeGroup value)  $default,){
final _that = this;
switch (_that) {
case _NodeGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NodeGroup value)?  $default,){
final _that = this;
switch (_that) {
case _NodeGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NodePath parentPath,  double leftPos,  double rightPos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NodeGroup() when $default != null:
return $default(_that.parentPath,_that.leftPos,_that.rightPos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NodePath parentPath,  double leftPos,  double rightPos)  $default,) {final _that = this;
switch (_that) {
case _NodeGroup():
return $default(_that.parentPath,_that.leftPos,_that.rightPos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NodePath parentPath,  double leftPos,  double rightPos)?  $default,) {final _that = this;
switch (_that) {
case _NodeGroup() when $default != null:
return $default(_that.parentPath,_that.leftPos,_that.rightPos);case _:
  return null;

}
}

}

/// @nodoc


class _NodeGroup implements NodeGroup {
  const _NodeGroup({required this.parentPath, required this.leftPos, required this.rightPos});
  

@override final  NodePath parentPath;
@override final  double leftPos;
@override final  double rightPos;

/// Create a copy of NodeGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NodeGroupCopyWith<_NodeGroup> get copyWith => __$NodeGroupCopyWithImpl<_NodeGroup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NodeGroup&&(identical(other.parentPath, parentPath) || other.parentPath == parentPath)&&(identical(other.leftPos, leftPos) || other.leftPos == leftPos)&&(identical(other.rightPos, rightPos) || other.rightPos == rightPos));
}


@override
int get hashCode => Object.hash(runtimeType,parentPath,leftPos,rightPos);

@override
String toString() {
  return 'NodeGroup(parentPath: $parentPath, leftPos: $leftPos, rightPos: $rightPos)';
}


}

/// @nodoc
abstract mixin class _$NodeGroupCopyWith<$Res> implements $NodeGroupCopyWith<$Res> {
  factory _$NodeGroupCopyWith(_NodeGroup value, $Res Function(_NodeGroup) _then) = __$NodeGroupCopyWithImpl;
@override @useResult
$Res call({
 NodePath parentPath, double leftPos, double rightPos
});


@override $NodePathCopyWith<$Res> get parentPath;

}
/// @nodoc
class __$NodeGroupCopyWithImpl<$Res>
    implements _$NodeGroupCopyWith<$Res> {
  __$NodeGroupCopyWithImpl(this._self, this._then);

  final _NodeGroup _self;
  final $Res Function(_NodeGroup) _then;

/// Create a copy of NodeGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parentPath = null,Object? leftPos = null,Object? rightPos = null,}) {
  return _then(_NodeGroup(
parentPath: null == parentPath ? _self.parentPath : parentPath // ignore: cast_nullable_to_non_nullable
as NodePath,leftPos: null == leftPos ? _self.leftPos : leftPos // ignore: cast_nullable_to_non_nullable
as double,rightPos: null == rightPos ? _self.rightPos : rightPos // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of NodeGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodePathCopyWith<$Res> get parentPath {
  
  return $NodePathCopyWith<$Res>(_self.parentPath, (value) {
    return _then(_self.copyWith(parentPath: value));
  });
}
}

// dart format on
