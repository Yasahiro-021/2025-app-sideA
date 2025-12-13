// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node_coordinate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NodeCoordinate {

/// X座標（水平位置、画面上のピクセル位置）
 double get x;/// Y座標（垂直位置、画面上のピクセル位置）
 double get y;
/// Create a copy of NodeCoordinate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NodeCoordinateCopyWith<NodeCoordinate> get copyWith => _$NodeCoordinateCopyWithImpl<NodeCoordinate>(this as NodeCoordinate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodeCoordinate&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}


@override
int get hashCode => Object.hash(runtimeType,x,y);

@override
String toString() {
  return 'NodeCoordinate(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class $NodeCoordinateCopyWith<$Res>  {
  factory $NodeCoordinateCopyWith(NodeCoordinate value, $Res Function(NodeCoordinate) _then) = _$NodeCoordinateCopyWithImpl;
@useResult
$Res call({
 double x, double y
});




}
/// @nodoc
class _$NodeCoordinateCopyWithImpl<$Res>
    implements $NodeCoordinateCopyWith<$Res> {
  _$NodeCoordinateCopyWithImpl(this._self, this._then);

  final NodeCoordinate _self;
  final $Res Function(NodeCoordinate) _then;

/// Create a copy of NodeCoordinate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NodeCoordinate].
extension NodeCoordinatePatterns on NodeCoordinate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NodeCoordinate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NodeCoordinate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NodeCoordinate value)  $default,){
final _that = this;
switch (_that) {
case _NodeCoordinate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NodeCoordinate value)?  $default,){
final _that = this;
switch (_that) {
case _NodeCoordinate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double x,  double y)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NodeCoordinate() when $default != null:
return $default(_that.x,_that.y);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double x,  double y)  $default,) {final _that = this;
switch (_that) {
case _NodeCoordinate():
return $default(_that.x,_that.y);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double x,  double y)?  $default,) {final _that = this;
switch (_that) {
case _NodeCoordinate() when $default != null:
return $default(_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc


class _NodeCoordinate extends NodeCoordinate {
  const _NodeCoordinate({required this.x, required this.y}): super._();
  

/// X座標（水平位置、画面上のピクセル位置）
@override final  double x;
/// Y座標（垂直位置、画面上のピクセル位置）
@override final  double y;

/// Create a copy of NodeCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NodeCoordinateCopyWith<_NodeCoordinate> get copyWith => __$NodeCoordinateCopyWithImpl<_NodeCoordinate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NodeCoordinate&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}


@override
int get hashCode => Object.hash(runtimeType,x,y);

@override
String toString() {
  return 'NodeCoordinate(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$NodeCoordinateCopyWith<$Res> implements $NodeCoordinateCopyWith<$Res> {
  factory _$NodeCoordinateCopyWith(_NodeCoordinate value, $Res Function(_NodeCoordinate) _then) = __$NodeCoordinateCopyWithImpl;
@override @useResult
$Res call({
 double x, double y
});




}
/// @nodoc
class __$NodeCoordinateCopyWithImpl<$Res>
    implements _$NodeCoordinateCopyWith<$Res> {
  __$NodeCoordinateCopyWithImpl(this._self, this._then);

  final _NodeCoordinate _self;
  final $Res Function(_NodeCoordinate) _then;

/// Create a copy of NodeCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,}) {
  return _then(_NodeCoordinate(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
