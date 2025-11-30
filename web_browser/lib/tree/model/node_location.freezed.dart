// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NodeLocation {

 int get depth; int get index;
/// Create a copy of NodeLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NodeLocationCopyWith<NodeLocation> get copyWith => _$NodeLocationCopyWithImpl<NodeLocation>(this as NodeLocation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodeLocation&&(identical(other.depth, depth) || other.depth == depth)&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,depth,index);

@override
String toString() {
  return 'NodeLocation(depth: $depth, index: $index)';
}


}

/// @nodoc
abstract mixin class $NodeLocationCopyWith<$Res>  {
  factory $NodeLocationCopyWith(NodeLocation value, $Res Function(NodeLocation) _then) = _$NodeLocationCopyWithImpl;
@useResult
$Res call({
 int depth, int index
});




}
/// @nodoc
class _$NodeLocationCopyWithImpl<$Res>
    implements $NodeLocationCopyWith<$Res> {
  _$NodeLocationCopyWithImpl(this._self, this._then);

  final NodeLocation _self;
  final $Res Function(NodeLocation) _then;

/// Create a copy of NodeLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? depth = null,Object? index = null,}) {
  return _then(_self.copyWith(
depth: null == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as int,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NodeLocation].
extension NodeLocationPatterns on NodeLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NodeLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NodeLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NodeLocation value)  $default,){
final _that = this;
switch (_that) {
case _NodeLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NodeLocation value)?  $default,){
final _that = this;
switch (_that) {
case _NodeLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int depth,  int index)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NodeLocation() when $default != null:
return $default(_that.depth,_that.index);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int depth,  int index)  $default,) {final _that = this;
switch (_that) {
case _NodeLocation():
return $default(_that.depth,_that.index);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int depth,  int index)?  $default,) {final _that = this;
switch (_that) {
case _NodeLocation() when $default != null:
return $default(_that.depth,_that.index);case _:
  return null;

}
}

}

/// @nodoc


class _NodeLocation implements NodeLocation {
  const _NodeLocation({required this.depth, required this.index});
  

@override final  int depth;
@override final  int index;

/// Create a copy of NodeLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NodeLocationCopyWith<_NodeLocation> get copyWith => __$NodeLocationCopyWithImpl<_NodeLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NodeLocation&&(identical(other.depth, depth) || other.depth == depth)&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,depth,index);

@override
String toString() {
  return 'NodeLocation(depth: $depth, index: $index)';
}


}

/// @nodoc
abstract mixin class _$NodeLocationCopyWith<$Res> implements $NodeLocationCopyWith<$Res> {
  factory _$NodeLocationCopyWith(_NodeLocation value, $Res Function(_NodeLocation) _then) = __$NodeLocationCopyWithImpl;
@override @useResult
$Res call({
 int depth, int index
});




}
/// @nodoc
class __$NodeLocationCopyWithImpl<$Res>
    implements _$NodeLocationCopyWith<$Res> {
  __$NodeLocationCopyWithImpl(this._self, this._then);

  final _NodeLocation _self;
  final $Res Function(_NodeLocation) _then;

/// Create a copy of NodeLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? depth = null,Object? index = null,}) {
  return _then(_NodeLocation(
depth: null == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as int,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
