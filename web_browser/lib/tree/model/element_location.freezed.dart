// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'element_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ElementLocation {

/// 要素の左上のX座標
 double get x;/// 要素の左上のY座標
 double get y;/// 要素の中心X座標
 double get centerX;/// 要素の下端Y座標
 double get bottomY;
/// Create a copy of ElementLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElementLocationCopyWith<ElementLocation> get copyWith => _$ElementLocationCopyWithImpl<ElementLocation>(this as ElementLocation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElementLocation&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.centerX, centerX) || other.centerX == centerX)&&(identical(other.bottomY, bottomY) || other.bottomY == bottomY));
}


@override
int get hashCode => Object.hash(runtimeType,x,y,centerX,bottomY);

@override
String toString() {
  return 'ElementLocation(x: $x, y: $y, centerX: $centerX, bottomY: $bottomY)';
}


}

/// @nodoc
abstract mixin class $ElementLocationCopyWith<$Res>  {
  factory $ElementLocationCopyWith(ElementLocation value, $Res Function(ElementLocation) _then) = _$ElementLocationCopyWithImpl;
@useResult
$Res call({
 double x, double y, double centerX, double bottomY
});




}
/// @nodoc
class _$ElementLocationCopyWithImpl<$Res>
    implements $ElementLocationCopyWith<$Res> {
  _$ElementLocationCopyWithImpl(this._self, this._then);

  final ElementLocation _self;
  final $Res Function(ElementLocation) _then;

/// Create a copy of ElementLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? centerX = null,Object? bottomY = null,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,centerX: null == centerX ? _self.centerX : centerX // ignore: cast_nullable_to_non_nullable
as double,bottomY: null == bottomY ? _self.bottomY : bottomY // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ElementLocation].
extension ElementLocationPatterns on ElementLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElementLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElementLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElementLocation value)  $default,){
final _that = this;
switch (_that) {
case _ElementLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElementLocation value)?  $default,){
final _that = this;
switch (_that) {
case _ElementLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double x,  double y,  double centerX,  double bottomY)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElementLocation() when $default != null:
return $default(_that.x,_that.y,_that.centerX,_that.bottomY);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double x,  double y,  double centerX,  double bottomY)  $default,) {final _that = this;
switch (_that) {
case _ElementLocation():
return $default(_that.x,_that.y,_that.centerX,_that.bottomY);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double x,  double y,  double centerX,  double bottomY)?  $default,) {final _that = this;
switch (_that) {
case _ElementLocation() when $default != null:
return $default(_that.x,_that.y,_that.centerX,_that.bottomY);case _:
  return null;

}
}

}

/// @nodoc


class _ElementLocation implements ElementLocation {
  const _ElementLocation({required this.x, required this.y, required this.centerX, required this.bottomY});
  

/// 要素の左上のX座標
@override final  double x;
/// 要素の左上のY座標
@override final  double y;
/// 要素の中心X座標
@override final  double centerX;
/// 要素の下端Y座標
@override final  double bottomY;

/// Create a copy of ElementLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElementLocationCopyWith<_ElementLocation> get copyWith => __$ElementLocationCopyWithImpl<_ElementLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElementLocation&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.centerX, centerX) || other.centerX == centerX)&&(identical(other.bottomY, bottomY) || other.bottomY == bottomY));
}


@override
int get hashCode => Object.hash(runtimeType,x,y,centerX,bottomY);

@override
String toString() {
  return 'ElementLocation(x: $x, y: $y, centerX: $centerX, bottomY: $bottomY)';
}


}

/// @nodoc
abstract mixin class _$ElementLocationCopyWith<$Res> implements $ElementLocationCopyWith<$Res> {
  factory _$ElementLocationCopyWith(_ElementLocation value, $Res Function(_ElementLocation) _then) = __$ElementLocationCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double centerX, double bottomY
});




}
/// @nodoc
class __$ElementLocationCopyWithImpl<$Res>
    implements _$ElementLocationCopyWith<$Res> {
  __$ElementLocationCopyWithImpl(this._self, this._then);

  final _ElementLocation _self;
  final $Res Function(_ElementLocation) _then;

/// Create a copy of ElementLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? centerX = null,Object? bottomY = null,}) {
  return _then(_ElementLocation(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,centerX: null == centerX ? _self.centerX : centerX // ignore: cast_nullable_to_non_nullable
as double,bottomY: null == bottomY ? _self.bottomY : bottomY // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
