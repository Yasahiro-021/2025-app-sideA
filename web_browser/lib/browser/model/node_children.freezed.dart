// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node_children.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NodeChildren {

 List<NodeWithPath> get children;
/// Create a copy of NodeChildren
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NodeChildrenCopyWith<NodeChildren> get copyWith => _$NodeChildrenCopyWithImpl<NodeChildren>(this as NodeChildren, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodeChildren&&const DeepCollectionEquality().equals(other.children, children));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'NodeChildren(children: $children)';
}


}

/// @nodoc
abstract mixin class $NodeChildrenCopyWith<$Res>  {
  factory $NodeChildrenCopyWith(NodeChildren value, $Res Function(NodeChildren) _then) = _$NodeChildrenCopyWithImpl;
@useResult
$Res call({
 List<NodeWithPath> children
});




}
/// @nodoc
class _$NodeChildrenCopyWithImpl<$Res>
    implements $NodeChildrenCopyWith<$Res> {
  _$NodeChildrenCopyWithImpl(this._self, this._then);

  final NodeChildren _self;
  final $Res Function(NodeChildren) _then;

/// Create a copy of NodeChildren
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? children = null,}) {
  return _then(_self.copyWith(
children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<NodeWithPath>,
  ));
}

}


/// Adds pattern-matching-related methods to [NodeChildren].
extension NodeChildrenPatterns on NodeChildren {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NodeChildren value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NodeChildren() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NodeChildren value)  $default,){
final _that = this;
switch (_that) {
case _NodeChildren():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NodeChildren value)?  $default,){
final _that = this;
switch (_that) {
case _NodeChildren() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NodeWithPath> children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NodeChildren() when $default != null:
return $default(_that.children);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NodeWithPath> children)  $default,) {final _that = this;
switch (_that) {
case _NodeChildren():
return $default(_that.children);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NodeWithPath> children)?  $default,) {final _that = this;
switch (_that) {
case _NodeChildren() when $default != null:
return $default(_that.children);case _:
  return null;

}
}

}

/// @nodoc


class _NodeChildren implements NodeChildren {
  const _NodeChildren({required final  List<NodeWithPath> children}): _children = children;
  

 final  List<NodeWithPath> _children;
@override List<NodeWithPath> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of NodeChildren
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NodeChildrenCopyWith<_NodeChildren> get copyWith => __$NodeChildrenCopyWithImpl<_NodeChildren>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NodeChildren&&const DeepCollectionEquality().equals(other._children, _children));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'NodeChildren(children: $children)';
}


}

/// @nodoc
abstract mixin class _$NodeChildrenCopyWith<$Res> implements $NodeChildrenCopyWith<$Res> {
  factory _$NodeChildrenCopyWith(_NodeChildren value, $Res Function(_NodeChildren) _then) = __$NodeChildrenCopyWithImpl;
@override @useResult
$Res call({
 List<NodeWithPath> children
});




}
/// @nodoc
class __$NodeChildrenCopyWithImpl<$Res>
    implements _$NodeChildrenCopyWith<$Res> {
  __$NodeChildrenCopyWithImpl(this._self, this._then);

  final _NodeChildren _self;
  final $Res Function(_NodeChildren) _then;

/// Create a copy of NodeChildren
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? children = null,}) {
  return _then(_NodeChildren(
children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<NodeWithPath>,
  ));
}


}

// dart format on
