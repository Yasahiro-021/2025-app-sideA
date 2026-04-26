// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Tree implements DiagnosticableTreeMixin {

 TreeId get id; TreeName get name;
/// Create a copy of Tree
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreeCopyWith<Tree> get copyWith => _$TreeCopyWithImpl<Tree>(this as Tree, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Tree'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tree&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Tree(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $TreeCopyWith<$Res>  {
  factory $TreeCopyWith(Tree value, $Res Function(Tree) _then) = _$TreeCopyWithImpl;
@useResult
$Res call({
 TreeId id, TreeName name
});


$TreeIdCopyWith<$Res> get id;$TreeNameCopyWith<$Res> get name;

}
/// @nodoc
class _$TreeCopyWithImpl<$Res>
    implements $TreeCopyWith<$Res> {
  _$TreeCopyWithImpl(this._self, this._then);

  final Tree _self;
  final $Res Function(Tree) _then;

/// Create a copy of Tree
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TreeId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as TreeName,
  ));
}
/// Create a copy of Tree
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TreeIdCopyWith<$Res> get id {
  
  return $TreeIdCopyWith<$Res>(_self.id, (value) {
    return _then(_self.copyWith(id: value));
  });
}/// Create a copy of Tree
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TreeNameCopyWith<$Res> get name {
  
  return $TreeNameCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}


/// Adds pattern-matching-related methods to [Tree].
extension TreePatterns on Tree {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tree value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tree() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tree value)  $default,){
final _that = this;
switch (_that) {
case _Tree():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tree value)?  $default,){
final _that = this;
switch (_that) {
case _Tree() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TreeId id,  TreeName name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tree() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TreeId id,  TreeName name)  $default,) {final _that = this;
switch (_that) {
case _Tree():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TreeId id,  TreeName name)?  $default,) {final _that = this;
switch (_that) {
case _Tree() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _Tree with DiagnosticableTreeMixin implements Tree {
  const _Tree({required this.id, required this.name});
  

@override final  TreeId id;
@override final  TreeName name;

/// Create a copy of Tree
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TreeCopyWith<_Tree> get copyWith => __$TreeCopyWithImpl<_Tree>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Tree'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tree&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Tree(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TreeCopyWith<$Res> implements $TreeCopyWith<$Res> {
  factory _$TreeCopyWith(_Tree value, $Res Function(_Tree) _then) = __$TreeCopyWithImpl;
@override @useResult
$Res call({
 TreeId id, TreeName name
});


@override $TreeIdCopyWith<$Res> get id;@override $TreeNameCopyWith<$Res> get name;

}
/// @nodoc
class __$TreeCopyWithImpl<$Res>
    implements _$TreeCopyWith<$Res> {
  __$TreeCopyWithImpl(this._self, this._then);

  final _Tree _self;
  final $Res Function(_Tree) _then;

/// Create a copy of Tree
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_Tree(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as TreeId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as TreeName,
  ));
}

/// Create a copy of Tree
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TreeIdCopyWith<$Res> get id {
  
  return $TreeIdCopyWith<$Res>(_self.id, (value) {
    return _then(_self.copyWith(id: value));
  });
}/// Create a copy of Tree
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TreeNameCopyWith<$Res> get name {
  
  return $TreeNameCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}

// dart format on
