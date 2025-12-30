// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GroupLocation {

 double get x; double get y; double get centerX;
/// Create a copy of GroupLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupLocationCopyWith<GroupLocation> get copyWith => _$GroupLocationCopyWithImpl<GroupLocation>(this as GroupLocation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupLocation&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.centerX, centerX) || other.centerX == centerX));
}


@override
int get hashCode => Object.hash(runtimeType,x,y,centerX);

@override
String toString() {
  return 'GroupLocation(x: $x, y: $y, centerX: $centerX)';
}


}

/// @nodoc
abstract mixin class $GroupLocationCopyWith<$Res>  {
  factory $GroupLocationCopyWith(GroupLocation value, $Res Function(GroupLocation) _then) = _$GroupLocationCopyWithImpl;
@useResult
$Res call({
 double x, double y, double centerX
});




}
/// @nodoc
class _$GroupLocationCopyWithImpl<$Res>
    implements $GroupLocationCopyWith<$Res> {
  _$GroupLocationCopyWithImpl(this._self, this._then);

  final GroupLocation _self;
  final $Res Function(GroupLocation) _then;

/// Create a copy of GroupLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? centerX = null,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,centerX: null == centerX ? _self.centerX : centerX // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupLocation].
extension GroupLocationPatterns on GroupLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupLocation value)  $default,){
final _that = this;
switch (_that) {
case _GroupLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupLocation value)?  $default,){
final _that = this;
switch (_that) {
case _GroupLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double x,  double y,  double centerX)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupLocation() when $default != null:
return $default(_that.x,_that.y,_that.centerX);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double x,  double y,  double centerX)  $default,) {final _that = this;
switch (_that) {
case _GroupLocation():
return $default(_that.x,_that.y,_that.centerX);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double x,  double y,  double centerX)?  $default,) {final _that = this;
switch (_that) {
case _GroupLocation() when $default != null:
return $default(_that.x,_that.y,_that.centerX);case _:
  return null;

}
}

}

/// @nodoc


class _GroupLocation implements GroupLocation {
  const _GroupLocation({required this.x, required this.y, required this.centerX});
  

@override final  double x;
@override final  double y;
@override final  double centerX;

/// Create a copy of GroupLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupLocationCopyWith<_GroupLocation> get copyWith => __$GroupLocationCopyWithImpl<_GroupLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupLocation&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.centerX, centerX) || other.centerX == centerX));
}


@override
int get hashCode => Object.hash(runtimeType,x,y,centerX);

@override
String toString() {
  return 'GroupLocation(x: $x, y: $y, centerX: $centerX)';
}


}

/// @nodoc
abstract mixin class _$GroupLocationCopyWith<$Res> implements $GroupLocationCopyWith<$Res> {
  factory _$GroupLocationCopyWith(_GroupLocation value, $Res Function(_GroupLocation) _then) = __$GroupLocationCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double centerX
});




}
/// @nodoc
class __$GroupLocationCopyWithImpl<$Res>
    implements _$GroupLocationCopyWith<$Res> {
  __$GroupLocationCopyWithImpl(this._self, this._then);

  final _GroupLocation _self;
  final $Res Function(_GroupLocation) _then;

/// Create a copy of GroupLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? centerX = null,}) {
  return _then(_GroupLocation(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,centerX: null == centerX ? _self.centerX : centerX // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
