// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'element_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ElementState {

 String get title; (double, double) get position;
/// Create a copy of ElementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElementStateCopyWith<ElementState> get copyWith => _$ElementStateCopyWithImpl<ElementState>(this as ElementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElementState&&(identical(other.title, title) || other.title == title)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,title,position);

@override
String toString() {
  return 'ElementState(title: $title, position: $position)';
}


}

/// @nodoc
abstract mixin class $ElementStateCopyWith<$Res>  {
  factory $ElementStateCopyWith(ElementState value, $Res Function(ElementState) _then) = _$ElementStateCopyWithImpl;
@useResult
$Res call({
 String title, (double, double) position
});




}
/// @nodoc
class _$ElementStateCopyWithImpl<$Res>
    implements $ElementStateCopyWith<$Res> {
  _$ElementStateCopyWithImpl(this._self, this._then);

  final ElementState _self;
  final $Res Function(ElementState) _then;

/// Create a copy of ElementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? position = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as (double, double),
  ));
}

}


/// Adds pattern-matching-related methods to [ElementState].
extension ElementStatePatterns on ElementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElementState value)  $default,){
final _that = this;
switch (_that) {
case _ElementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElementState value)?  $default,){
final _that = this;
switch (_that) {
case _ElementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  (double, double) position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElementState() when $default != null:
return $default(_that.title,_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  (double, double) position)  $default,) {final _that = this;
switch (_that) {
case _ElementState():
return $default(_that.title,_that.position);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  (double, double) position)?  $default,) {final _that = this;
switch (_that) {
case _ElementState() when $default != null:
return $default(_that.title,_that.position);case _:
  return null;

}
}

}

/// @nodoc


class _ElementState implements ElementState {
  const _ElementState({required this.title, required this.position});
  

@override final  String title;
@override final  (double, double) position;

/// Create a copy of ElementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElementStateCopyWith<_ElementState> get copyWith => __$ElementStateCopyWithImpl<_ElementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElementState&&(identical(other.title, title) || other.title == title)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,title,position);

@override
String toString() {
  return 'ElementState(title: $title, position: $position)';
}


}

/// @nodoc
abstract mixin class _$ElementStateCopyWith<$Res> implements $ElementStateCopyWith<$Res> {
  factory _$ElementStateCopyWith(_ElementState value, $Res Function(_ElementState) _then) = __$ElementStateCopyWithImpl;
@override @useResult
$Res call({
 String title, (double, double) position
});




}
/// @nodoc
class __$ElementStateCopyWithImpl<$Res>
    implements _$ElementStateCopyWith<$Res> {
  __$ElementStateCopyWithImpl(this._self, this._then);

  final _ElementState _self;
  final $Res Function(_ElementState) _then;

/// Create a copy of ElementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? position = null,}) {
  return _then(_ElementState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as (double, double),
  ));
}


}

// dart format on
