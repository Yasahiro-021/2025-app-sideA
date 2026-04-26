// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TreeId {

 int get id;
/// Create a copy of TreeId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreeIdCopyWith<TreeId> get copyWith => _$TreeIdCopyWithImpl<TreeId>(this as TreeId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreeId&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TreeId(id: $id)';
}


}

/// @nodoc
abstract mixin class $TreeIdCopyWith<$Res>  {
  factory $TreeIdCopyWith(TreeId value, $Res Function(TreeId) _then) = _$TreeIdCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$TreeIdCopyWithImpl<$Res>
    implements $TreeIdCopyWith<$Res> {
  _$TreeIdCopyWithImpl(this._self, this._then);

  final TreeId _self;
  final $Res Function(TreeId) _then;

/// Create a copy of TreeId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TreeId].
extension TreeIdPatterns on TreeId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TreeId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TreeId() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TreeId value)  $default,){
final _that = this;
switch (_that) {
case _TreeId():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TreeId value)?  $default,){
final _that = this;
switch (_that) {
case _TreeId() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TreeId() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id)  $default,) {final _that = this;
switch (_that) {
case _TreeId():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id)?  $default,) {final _that = this;
switch (_that) {
case _TreeId() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _TreeId implements TreeId {
  const _TreeId(this.id): assert(id >= 0, 'IDは0以上でなければなりません');
  

@override final  int id;

/// Create a copy of TreeId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TreeIdCopyWith<_TreeId> get copyWith => __$TreeIdCopyWithImpl<_TreeId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TreeId&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TreeId(id: $id)';
}


}

/// @nodoc
abstract mixin class _$TreeIdCopyWith<$Res> implements $TreeIdCopyWith<$Res> {
  factory _$TreeIdCopyWith(_TreeId value, $Res Function(_TreeId) _then) = __$TreeIdCopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class __$TreeIdCopyWithImpl<$Res>
    implements _$TreeIdCopyWith<$Res> {
  __$TreeIdCopyWithImpl(this._self, this._then);

  final _TreeId _self;
  final $Res Function(_TreeId) _then;

/// Create a copy of TreeId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_TreeId(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
