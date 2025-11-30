// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_node_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TreeNodeState {

 String get title; String get date; double get fromTopDistance; double get fromLeftDistance;
/// Create a copy of TreeNodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreeNodeStateCopyWith<TreeNodeState> get copyWith => _$TreeNodeStateCopyWithImpl<TreeNodeState>(this as TreeNodeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreeNodeState&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.fromTopDistance, fromTopDistance) || other.fromTopDistance == fromTopDistance)&&(identical(other.fromLeftDistance, fromLeftDistance) || other.fromLeftDistance == fromLeftDistance));
}


@override
int get hashCode => Object.hash(runtimeType,title,date,fromTopDistance,fromLeftDistance);

@override
String toString() {
  return 'TreeNodeState(title: $title, date: $date, fromTopDistance: $fromTopDistance, fromLeftDistance: $fromLeftDistance)';
}


}

/// @nodoc
abstract mixin class $TreeNodeStateCopyWith<$Res>  {
  factory $TreeNodeStateCopyWith(TreeNodeState value, $Res Function(TreeNodeState) _then) = _$TreeNodeStateCopyWithImpl;
@useResult
$Res call({
 String title, String date, double fromTopDistance, double fromLeftDistance
});




}
/// @nodoc
class _$TreeNodeStateCopyWithImpl<$Res>
    implements $TreeNodeStateCopyWith<$Res> {
  _$TreeNodeStateCopyWithImpl(this._self, this._then);

  final TreeNodeState _self;
  final $Res Function(TreeNodeState) _then;

/// Create a copy of TreeNodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? date = null,Object? fromTopDistance = null,Object? fromLeftDistance = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,fromTopDistance: null == fromTopDistance ? _self.fromTopDistance : fromTopDistance // ignore: cast_nullable_to_non_nullable
as double,fromLeftDistance: null == fromLeftDistance ? _self.fromLeftDistance : fromLeftDistance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TreeNodeState].
extension TreeNodeStatePatterns on TreeNodeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TreeNodeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TreeNodeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TreeNodeState value)  $default,){
final _that = this;
switch (_that) {
case _TreeNodeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TreeNodeState value)?  $default,){
final _that = this;
switch (_that) {
case _TreeNodeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String date,  double fromTopDistance,  double fromLeftDistance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TreeNodeState() when $default != null:
return $default(_that.title,_that.date,_that.fromTopDistance,_that.fromLeftDistance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String date,  double fromTopDistance,  double fromLeftDistance)  $default,) {final _that = this;
switch (_that) {
case _TreeNodeState():
return $default(_that.title,_that.date,_that.fromTopDistance,_that.fromLeftDistance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String date,  double fromTopDistance,  double fromLeftDistance)?  $default,) {final _that = this;
switch (_that) {
case _TreeNodeState() when $default != null:
return $default(_that.title,_that.date,_that.fromTopDistance,_that.fromLeftDistance);case _:
  return null;

}
}

}

/// @nodoc


class _TreeNodeState implements TreeNodeState {
  const _TreeNodeState({required this.title, required this.date, required this.fromTopDistance, required this.fromLeftDistance});
  

@override final  String title;
@override final  String date;
@override final  double fromTopDistance;
@override final  double fromLeftDistance;

/// Create a copy of TreeNodeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TreeNodeStateCopyWith<_TreeNodeState> get copyWith => __$TreeNodeStateCopyWithImpl<_TreeNodeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TreeNodeState&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.fromTopDistance, fromTopDistance) || other.fromTopDistance == fromTopDistance)&&(identical(other.fromLeftDistance, fromLeftDistance) || other.fromLeftDistance == fromLeftDistance));
}


@override
int get hashCode => Object.hash(runtimeType,title,date,fromTopDistance,fromLeftDistance);

@override
String toString() {
  return 'TreeNodeState(title: $title, date: $date, fromTopDistance: $fromTopDistance, fromLeftDistance: $fromLeftDistance)';
}


}

/// @nodoc
abstract mixin class _$TreeNodeStateCopyWith<$Res> implements $TreeNodeStateCopyWith<$Res> {
  factory _$TreeNodeStateCopyWith(_TreeNodeState value, $Res Function(_TreeNodeState) _then) = __$TreeNodeStateCopyWithImpl;
@override @useResult
$Res call({
 String title, String date, double fromTopDistance, double fromLeftDistance
});




}
/// @nodoc
class __$TreeNodeStateCopyWithImpl<$Res>
    implements _$TreeNodeStateCopyWith<$Res> {
  __$TreeNodeStateCopyWithImpl(this._self, this._then);

  final _TreeNodeState _self;
  final $Res Function(_TreeNodeState) _then;

/// Create a copy of TreeNodeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? date = null,Object? fromTopDistance = null,Object? fromLeftDistance = null,}) {
  return _then(_TreeNodeState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,fromTopDistance: null == fromTopDistance ? _self.fromTopDistance : fromTopDistance // ignore: cast_nullable_to_non_nullable
as double,fromLeftDistance: null == fromLeftDistance ? _self.fromLeftDistance : fromLeftDistance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
