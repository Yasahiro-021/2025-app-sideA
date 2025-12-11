// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_coordinate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GroupCoordinate {

/// X座標（水平位置）
 double get x;/// Y座標（垂直位置、深さに基づく）
 double get y;
/// Create a copy of GroupCoordinate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupCoordinateCopyWith<GroupCoordinate> get copyWith => _$GroupCoordinateCopyWithImpl<GroupCoordinate>(this as GroupCoordinate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupCoordinate&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}


@override
int get hashCode => Object.hash(runtimeType,x,y);

@override
String toString() {
  return 'GroupCoordinate(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class $GroupCoordinateCopyWith<$Res>  {
  factory $GroupCoordinateCopyWith(GroupCoordinate value, $Res Function(GroupCoordinate) _then) = _$GroupCoordinateCopyWithImpl;
@useResult
$Res call({
 double x, double y
});




}
/// @nodoc
class _$GroupCoordinateCopyWithImpl<$Res>
    implements $GroupCoordinateCopyWith<$Res> {
  _$GroupCoordinateCopyWithImpl(this._self, this._then);

  final GroupCoordinate _self;
  final $Res Function(GroupCoordinate) _then;

/// Create a copy of GroupCoordinate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupCoordinate].
extension GroupCoordinatePatterns on GroupCoordinate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupCoordinate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupCoordinate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupCoordinate value)  $default,){
final _that = this;
switch (_that) {
case _GroupCoordinate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupCoordinate value)?  $default,){
final _that = this;
switch (_that) {
case _GroupCoordinate() when $default != null:
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
case _GroupCoordinate() when $default != null:
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
case _GroupCoordinate():
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
case _GroupCoordinate() when $default != null:
return $default(_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc


class _GroupCoordinate extends GroupCoordinate {
  const _GroupCoordinate({required this.x, required this.y}): super._();
  

/// X座標（水平位置）
@override final  double x;
/// Y座標（垂直位置、深さに基づく）
@override final  double y;

/// Create a copy of GroupCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupCoordinateCopyWith<_GroupCoordinate> get copyWith => __$GroupCoordinateCopyWithImpl<_GroupCoordinate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupCoordinate&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}


@override
int get hashCode => Object.hash(runtimeType,x,y);

@override
String toString() {
  return 'GroupCoordinate(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$GroupCoordinateCopyWith<$Res> implements $GroupCoordinateCopyWith<$Res> {
  factory _$GroupCoordinateCopyWith(_GroupCoordinate value, $Res Function(_GroupCoordinate) _then) = __$GroupCoordinateCopyWithImpl;
@override @useResult
$Res call({
 double x, double y
});




}
/// @nodoc
class __$GroupCoordinateCopyWithImpl<$Res>
    implements _$GroupCoordinateCopyWith<$Res> {
  __$GroupCoordinateCopyWithImpl(this._self, this._then);

  final _GroupCoordinate _self;
  final $Res Function(_GroupCoordinate) _then;

/// Create a copy of GroupCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,}) {
  return _then(_GroupCoordinate(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
