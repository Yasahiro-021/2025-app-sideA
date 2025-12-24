// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TreeMapState {

 Iterable<NodePath> get allPaths;
/// Create a copy of TreeMapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreeMapStateCopyWith<TreeMapState> get copyWith => _$TreeMapStateCopyWithImpl<TreeMapState>(this as TreeMapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreeMapState&&const DeepCollectionEquality().equals(other.allPaths, allPaths));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(allPaths));

@override
String toString() {
  return 'TreeMapState(allPaths: $allPaths)';
}


}

/// @nodoc
abstract mixin class $TreeMapStateCopyWith<$Res>  {
  factory $TreeMapStateCopyWith(TreeMapState value, $Res Function(TreeMapState) _then) = _$TreeMapStateCopyWithImpl;
@useResult
$Res call({
 Iterable<NodePath> allPaths
});




}
/// @nodoc
class _$TreeMapStateCopyWithImpl<$Res>
    implements $TreeMapStateCopyWith<$Res> {
  _$TreeMapStateCopyWithImpl(this._self, this._then);

  final TreeMapState _self;
  final $Res Function(TreeMapState) _then;

/// Create a copy of TreeMapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allPaths = null,}) {
  return _then(_self.copyWith(
allPaths: null == allPaths ? _self.allPaths : allPaths // ignore: cast_nullable_to_non_nullable
as Iterable<NodePath>,
  ));
}

}


/// Adds pattern-matching-related methods to [TreeMapState].
extension TreeMapStatePatterns on TreeMapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TreeMapState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TreeMapState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TreeMapState value)  $default,){
final _that = this;
switch (_that) {
case _TreeMapState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TreeMapState value)?  $default,){
final _that = this;
switch (_that) {
case _TreeMapState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Iterable<NodePath> allPaths)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TreeMapState() when $default != null:
return $default(_that.allPaths);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Iterable<NodePath> allPaths)  $default,) {final _that = this;
switch (_that) {
case _TreeMapState():
return $default(_that.allPaths);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Iterable<NodePath> allPaths)?  $default,) {final _that = this;
switch (_that) {
case _TreeMapState() when $default != null:
return $default(_that.allPaths);case _:
  return null;

}
}

}

/// @nodoc


class _TreeMapState implements TreeMapState {
  const _TreeMapState({required this.allPaths});
  

@override final  Iterable<NodePath> allPaths;

/// Create a copy of TreeMapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TreeMapStateCopyWith<_TreeMapState> get copyWith => __$TreeMapStateCopyWithImpl<_TreeMapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TreeMapState&&const DeepCollectionEquality().equals(other.allPaths, allPaths));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(allPaths));

@override
String toString() {
  return 'TreeMapState(allPaths: $allPaths)';
}


}

/// @nodoc
abstract mixin class _$TreeMapStateCopyWith<$Res> implements $TreeMapStateCopyWith<$Res> {
  factory _$TreeMapStateCopyWith(_TreeMapState value, $Res Function(_TreeMapState) _then) = __$TreeMapStateCopyWithImpl;
@override @useResult
$Res call({
 Iterable<NodePath> allPaths
});




}
/// @nodoc
class __$TreeMapStateCopyWithImpl<$Res>
    implements _$TreeMapStateCopyWith<$Res> {
  __$TreeMapStateCopyWithImpl(this._self, this._then);

  final _TreeMapState _self;
  final $Res Function(_TreeMapState) _then;

/// Create a copy of TreeMapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allPaths = null,}) {
  return _then(_TreeMapState(
allPaths: null == allPaths ? _self.allPaths : allPaths // ignore: cast_nullable_to_non_nullable
as Iterable<NodePath>,
  ));
}


}

// dart format on
