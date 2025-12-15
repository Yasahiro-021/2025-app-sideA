// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Group {

 NodePath get path; List<NodePath> get elements; List<Group> get childrenGroup; double get width; double get treeWidth;
/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupCopyWith<Group> get copyWith => _$GroupCopyWithImpl<Group>(this as Group, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Group&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other.elements, elements)&&const DeepCollectionEquality().equals(other.childrenGroup, childrenGroup)&&(identical(other.width, width) || other.width == width)&&(identical(other.treeWidth, treeWidth) || other.treeWidth == treeWidth));
}


@override
int get hashCode => Object.hash(runtimeType,path,const DeepCollectionEquality().hash(elements),const DeepCollectionEquality().hash(childrenGroup),width,treeWidth);

@override
String toString() {
  return 'Group(path: $path, elements: $elements, childrenGroup: $childrenGroup, width: $width, treeWidth: $treeWidth)';
}


}

/// @nodoc
abstract mixin class $GroupCopyWith<$Res>  {
  factory $GroupCopyWith(Group value, $Res Function(Group) _then) = _$GroupCopyWithImpl;
@useResult
$Res call({
 NodePath path, List<NodePath> elements, List<Group> childrenGroup, double width, double treeWidth
});


$NodePathCopyWith<$Res> get path;

}
/// @nodoc
class _$GroupCopyWithImpl<$Res>
    implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._self, this._then);

  final Group _self;
  final $Res Function(Group) _then;

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? elements = null,Object? childrenGroup = null,Object? width = null,Object? treeWidth = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as NodePath,elements: null == elements ? _self.elements : elements // ignore: cast_nullable_to_non_nullable
as List<NodePath>,childrenGroup: null == childrenGroup ? _self.childrenGroup : childrenGroup // ignore: cast_nullable_to_non_nullable
as List<Group>,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,treeWidth: null == treeWidth ? _self.treeWidth : treeWidth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodePathCopyWith<$Res> get path {
  
  return $NodePathCopyWith<$Res>(_self.path, (value) {
    return _then(_self.copyWith(path: value));
  });
}
}


/// Adds pattern-matching-related methods to [Group].
extension GroupPatterns on Group {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Group value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Group() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Group value)  $default,){
final _that = this;
switch (_that) {
case _Group():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Group value)?  $default,){
final _that = this;
switch (_that) {
case _Group() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NodePath path,  List<NodePath> elements,  List<Group> childrenGroup,  double width,  double treeWidth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Group() when $default != null:
return $default(_that.path,_that.elements,_that.childrenGroup,_that.width,_that.treeWidth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NodePath path,  List<NodePath> elements,  List<Group> childrenGroup,  double width,  double treeWidth)  $default,) {final _that = this;
switch (_that) {
case _Group():
return $default(_that.path,_that.elements,_that.childrenGroup,_that.width,_that.treeWidth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NodePath path,  List<NodePath> elements,  List<Group> childrenGroup,  double width,  double treeWidth)?  $default,) {final _that = this;
switch (_that) {
case _Group() when $default != null:
return $default(_that.path,_that.elements,_that.childrenGroup,_that.width,_that.treeWidth);case _:
  return null;

}
}

}

/// @nodoc


class _Group implements Group {
  const _Group({required this.path, required final  List<NodePath> elements, required final  List<Group> childrenGroup, required this.width, required this.treeWidth}): _elements = elements,_childrenGroup = childrenGroup;
  

@override final  NodePath path;
 final  List<NodePath> _elements;
@override List<NodePath> get elements {
  if (_elements is EqualUnmodifiableListView) return _elements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_elements);
}

 final  List<Group> _childrenGroup;
@override List<Group> get childrenGroup {
  if (_childrenGroup is EqualUnmodifiableListView) return _childrenGroup;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_childrenGroup);
}

@override final  double width;
@override final  double treeWidth;

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupCopyWith<_Group> get copyWith => __$GroupCopyWithImpl<_Group>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Group&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other._elements, _elements)&&const DeepCollectionEquality().equals(other._childrenGroup, _childrenGroup)&&(identical(other.width, width) || other.width == width)&&(identical(other.treeWidth, treeWidth) || other.treeWidth == treeWidth));
}


@override
int get hashCode => Object.hash(runtimeType,path,const DeepCollectionEquality().hash(_elements),const DeepCollectionEquality().hash(_childrenGroup),width,treeWidth);

@override
String toString() {
  return 'Group(path: $path, elements: $elements, childrenGroup: $childrenGroup, width: $width, treeWidth: $treeWidth)';
}


}

/// @nodoc
abstract mixin class _$GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$GroupCopyWith(_Group value, $Res Function(_Group) _then) = __$GroupCopyWithImpl;
@override @useResult
$Res call({
 NodePath path, List<NodePath> elements, List<Group> childrenGroup, double width, double treeWidth
});


@override $NodePathCopyWith<$Res> get path;

}
/// @nodoc
class __$GroupCopyWithImpl<$Res>
    implements _$GroupCopyWith<$Res> {
  __$GroupCopyWithImpl(this._self, this._then);

  final _Group _self;
  final $Res Function(_Group) _then;

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? elements = null,Object? childrenGroup = null,Object? width = null,Object? treeWidth = null,}) {
  return _then(_Group(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as NodePath,elements: null == elements ? _self._elements : elements // ignore: cast_nullable_to_non_nullable
as List<NodePath>,childrenGroup: null == childrenGroup ? _self._childrenGroup : childrenGroup // ignore: cast_nullable_to_non_nullable
as List<Group>,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,treeWidth: null == treeWidth ? _self.treeWidth : treeWidth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodePathCopyWith<$Res> get path {
  
  return $NodePathCopyWith<$Res>(_self.path, (value) {
    return _then(_self.copyWith(path: value));
  });
}
}

// dart format on
