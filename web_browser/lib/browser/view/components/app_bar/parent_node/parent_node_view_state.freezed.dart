// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parent_node_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParentNodeState {

 String get parentTitle; NodePath get parentPath; Function get navigateToParent;
/// Create a copy of ParentNodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParentNodeStateCopyWith<ParentNodeState> get copyWith => _$ParentNodeStateCopyWithImpl<ParentNodeState>(this as ParentNodeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParentNodeState&&(identical(other.parentTitle, parentTitle) || other.parentTitle == parentTitle)&&const DeepCollectionEquality().equals(other.parentPath, parentPath)&&(identical(other.navigateToParent, navigateToParent) || other.navigateToParent == navigateToParent));
}


@override
int get hashCode => Object.hash(runtimeType,parentTitle,const DeepCollectionEquality().hash(parentPath),navigateToParent);

@override
String toString() {
  return 'ParentNodeState(parentTitle: $parentTitle, parentPath: $parentPath, navigateToParent: $navigateToParent)';
}


}

/// @nodoc
abstract mixin class $ParentNodeStateCopyWith<$Res>  {
  factory $ParentNodeStateCopyWith(ParentNodeState value, $Res Function(ParentNodeState) _then) = _$ParentNodeStateCopyWithImpl;
@useResult
$Res call({
 String parentTitle, NodePath parentPath, Function navigateToParent
});




}
/// @nodoc
class _$ParentNodeStateCopyWithImpl<$Res>
    implements $ParentNodeStateCopyWith<$Res> {
  _$ParentNodeStateCopyWithImpl(this._self, this._then);

  final ParentNodeState _self;
  final $Res Function(ParentNodeState) _then;

/// Create a copy of ParentNodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parentTitle = null,Object? parentPath = freezed,Object? navigateToParent = null,}) {
  return _then(_self.copyWith(
parentTitle: null == parentTitle ? _self.parentTitle : parentTitle // ignore: cast_nullable_to_non_nullable
as String,parentPath: freezed == parentPath ? _self.parentPath : parentPath // ignore: cast_nullable_to_non_nullable
as NodePath,navigateToParent: null == navigateToParent ? _self.navigateToParent : navigateToParent // ignore: cast_nullable_to_non_nullable
as Function,
  ));
}

}


/// Adds pattern-matching-related methods to [ParentNodeState].
extension ParentNodeStatePatterns on ParentNodeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParentNodeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParentNodeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParentNodeState value)  $default,){
final _that = this;
switch (_that) {
case _ParentNodeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParentNodeState value)?  $default,){
final _that = this;
switch (_that) {
case _ParentNodeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String parentTitle,  NodePath parentPath,  Function navigateToParent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParentNodeState() when $default != null:
return $default(_that.parentTitle,_that.parentPath,_that.navigateToParent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String parentTitle,  NodePath parentPath,  Function navigateToParent)  $default,) {final _that = this;
switch (_that) {
case _ParentNodeState():
return $default(_that.parentTitle,_that.parentPath,_that.navigateToParent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String parentTitle,  NodePath parentPath,  Function navigateToParent)?  $default,) {final _that = this;
switch (_that) {
case _ParentNodeState() when $default != null:
return $default(_that.parentTitle,_that.parentPath,_that.navigateToParent);case _:
  return null;

}
}

}

/// @nodoc


class _ParentNodeState implements ParentNodeState {
  const _ParentNodeState({required this.parentTitle, required this.parentPath, required this.navigateToParent});
  

@override final  String parentTitle;
@override final  NodePath parentPath;
@override final  Function navigateToParent;

/// Create a copy of ParentNodeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParentNodeStateCopyWith<_ParentNodeState> get copyWith => __$ParentNodeStateCopyWithImpl<_ParentNodeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParentNodeState&&(identical(other.parentTitle, parentTitle) || other.parentTitle == parentTitle)&&const DeepCollectionEquality().equals(other.parentPath, parentPath)&&(identical(other.navigateToParent, navigateToParent) || other.navigateToParent == navigateToParent));
}


@override
int get hashCode => Object.hash(runtimeType,parentTitle,const DeepCollectionEquality().hash(parentPath),navigateToParent);

@override
String toString() {
  return 'ParentNodeState(parentTitle: $parentTitle, parentPath: $parentPath, navigateToParent: $navigateToParent)';
}


}

/// @nodoc
abstract mixin class _$ParentNodeStateCopyWith<$Res> implements $ParentNodeStateCopyWith<$Res> {
  factory _$ParentNodeStateCopyWith(_ParentNodeState value, $Res Function(_ParentNodeState) _then) = __$ParentNodeStateCopyWithImpl;
@override @useResult
$Res call({
 String parentTitle, NodePath parentPath, Function navigateToParent
});




}
/// @nodoc
class __$ParentNodeStateCopyWithImpl<$Res>
    implements _$ParentNodeStateCopyWith<$Res> {
  __$ParentNodeStateCopyWithImpl(this._self, this._then);

  final _ParentNodeState _self;
  final $Res Function(_ParentNodeState) _then;

/// Create a copy of ParentNodeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parentTitle = null,Object? parentPath = freezed,Object? navigateToParent = null,}) {
  return _then(_ParentNodeState(
parentTitle: null == parentTitle ? _self.parentTitle : parentTitle // ignore: cast_nullable_to_non_nullable
as String,parentPath: freezed == parentPath ? _self.parentPath : parentPath // ignore: cast_nullable_to_non_nullable
as NodePath,navigateToParent: null == navigateToParent ? _self.navigateToParent : navigateToParent // ignore: cast_nullable_to_non_nullable
as Function,
  ));
}


}

// dart format on
