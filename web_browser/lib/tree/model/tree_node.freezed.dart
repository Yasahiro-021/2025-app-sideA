// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TreeNode {

 String get name; String get date;
/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreeNodeCopyWith<TreeNode> get copyWith => _$TreeNodeCopyWithImpl<TreeNode>(this as TreeNode, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreeNode&&(identical(other.name, name) || other.name == name)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,name,date);

@override
String toString() {
  return 'TreeNode(name: $name, date: $date)';
}


}

/// @nodoc
abstract mixin class $TreeNodeCopyWith<$Res>  {
  factory $TreeNodeCopyWith(TreeNode value, $Res Function(TreeNode) _then) = _$TreeNodeCopyWithImpl;
@useResult
$Res call({
 String name, String date
});




}
/// @nodoc
class _$TreeNodeCopyWithImpl<$Res>
    implements $TreeNodeCopyWith<$Res> {
  _$TreeNodeCopyWithImpl(this._self, this._then);

  final TreeNode _self;
  final $Res Function(TreeNode) _then;

/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? date = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TreeNode].
extension TreeNodePatterns on TreeNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TreeNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TreeNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TreeNode value)  $default,){
final _that = this;
switch (_that) {
case _TreeNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TreeNode value)?  $default,){
final _that = this;
switch (_that) {
case _TreeNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TreeNode() when $default != null:
return $default(_that.name,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String date)  $default,) {final _that = this;
switch (_that) {
case _TreeNode():
return $default(_that.name,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String date)?  $default,) {final _that = this;
switch (_that) {
case _TreeNode() when $default != null:
return $default(_that.name,_that.date);case _:
  return null;

}
}

}

/// @nodoc


class _TreeNode implements TreeNode {
  const _TreeNode({required this.name, required this.date});
  

@override final  String name;
@override final  String date;

/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TreeNodeCopyWith<_TreeNode> get copyWith => __$TreeNodeCopyWithImpl<_TreeNode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TreeNode&&(identical(other.name, name) || other.name == name)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,name,date);

@override
String toString() {
  return 'TreeNode(name: $name, date: $date)';
}


}

/// @nodoc
abstract mixin class _$TreeNodeCopyWith<$Res> implements $TreeNodeCopyWith<$Res> {
  factory _$TreeNodeCopyWith(_TreeNode value, $Res Function(_TreeNode) _then) = __$TreeNodeCopyWithImpl;
@override @useResult
$Res call({
 String name, String date
});




}
/// @nodoc
class __$TreeNodeCopyWithImpl<$Res>
    implements _$TreeNodeCopyWith<$Res> {
  __$TreeNodeCopyWithImpl(this._self, this._then);

  final _TreeNode _self;
  final $Res Function(_TreeNode) _then;

/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? date = null,}) {
  return _then(_TreeNode(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
