// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node_with_path.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NodeWithPath implements DiagnosticableTreeMixin {

 String get title; String get url; NodePath get path; NodePath? get parentPath;
/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NodeWithPathCopyWith<NodeWithPath> get copyWith => _$NodeWithPathCopyWithImpl<NodeWithPath>(this as NodeWithPath, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NodeWithPath'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('parentPath', parentPath));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodeWithPath&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.path, path) || other.path == path)&&(identical(other.parentPath, parentPath) || other.parentPath == parentPath));
}


@override
int get hashCode => Object.hash(runtimeType,title,url,path,parentPath);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NodeWithPath(title: $title, url: $url, path: $path, parentPath: $parentPath)';
}


}

/// @nodoc
abstract mixin class $NodeWithPathCopyWith<$Res>  {
  factory $NodeWithPathCopyWith(NodeWithPath value, $Res Function(NodeWithPath) _then) = _$NodeWithPathCopyWithImpl;
@useResult
$Res call({
 String title, String url, NodePath path, NodePath? parentPath
});


$NodePathCopyWith<$Res> get path;$NodePathCopyWith<$Res>? get parentPath;

}
/// @nodoc
class _$NodeWithPathCopyWithImpl<$Res>
    implements $NodeWithPathCopyWith<$Res> {
  _$NodeWithPathCopyWithImpl(this._self, this._then);

  final NodeWithPath _self;
  final $Res Function(NodeWithPath) _then;

/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? url = null,Object? path = null,Object? parentPath = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as NodePath,parentPath: freezed == parentPath ? _self.parentPath : parentPath // ignore: cast_nullable_to_non_nullable
as NodePath?,
  ));
}
/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodePathCopyWith<$Res> get path {
  
  return $NodePathCopyWith<$Res>(_self.path, (value) {
    return _then(_self.copyWith(path: value));
  });
}/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodePathCopyWith<$Res>? get parentPath {
    if (_self.parentPath == null) {
    return null;
  }

  return $NodePathCopyWith<$Res>(_self.parentPath!, (value) {
    return _then(_self.copyWith(parentPath: value));
  });
}
}


/// Adds pattern-matching-related methods to [NodeWithPath].
extension NodeWithPathPatterns on NodeWithPath {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NodeWithPath value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NodeWithPath() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NodeWithPath value)  $default,){
final _that = this;
switch (_that) {
case _NodeWithPath():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NodeWithPath value)?  $default,){
final _that = this;
switch (_that) {
case _NodeWithPath() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String url,  NodePath path,  NodePath? parentPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NodeWithPath() when $default != null:
return $default(_that.title,_that.url,_that.path,_that.parentPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String url,  NodePath path,  NodePath? parentPath)  $default,) {final _that = this;
switch (_that) {
case _NodeWithPath():
return $default(_that.title,_that.url,_that.path,_that.parentPath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String url,  NodePath path,  NodePath? parentPath)?  $default,) {final _that = this;
switch (_that) {
case _NodeWithPath() when $default != null:
return $default(_that.title,_that.url,_that.path,_that.parentPath);case _:
  return null;

}
}

}

/// @nodoc


class _NodeWithPath with DiagnosticableTreeMixin implements NodeWithPath {
  const _NodeWithPath({required this.title, required this.url, required this.path, required this.parentPath});
  

@override final  String title;
@override final  String url;
@override final  NodePath path;
@override final  NodePath? parentPath;

/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NodeWithPathCopyWith<_NodeWithPath> get copyWith => __$NodeWithPathCopyWithImpl<_NodeWithPath>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NodeWithPath'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('parentPath', parentPath));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NodeWithPath&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.path, path) || other.path == path)&&(identical(other.parentPath, parentPath) || other.parentPath == parentPath));
}


@override
int get hashCode => Object.hash(runtimeType,title,url,path,parentPath);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NodeWithPath(title: $title, url: $url, path: $path, parentPath: $parentPath)';
}


}

/// @nodoc
abstract mixin class _$NodeWithPathCopyWith<$Res> implements $NodeWithPathCopyWith<$Res> {
  factory _$NodeWithPathCopyWith(_NodeWithPath value, $Res Function(_NodeWithPath) _then) = __$NodeWithPathCopyWithImpl;
@override @useResult
$Res call({
 String title, String url, NodePath path, NodePath? parentPath
});


@override $NodePathCopyWith<$Res> get path;@override $NodePathCopyWith<$Res>? get parentPath;

}
/// @nodoc
class __$NodeWithPathCopyWithImpl<$Res>
    implements _$NodeWithPathCopyWith<$Res> {
  __$NodeWithPathCopyWithImpl(this._self, this._then);

  final _NodeWithPath _self;
  final $Res Function(_NodeWithPath) _then;

/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? url = null,Object? path = null,Object? parentPath = freezed,}) {
  return _then(_NodeWithPath(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as NodePath,parentPath: freezed == parentPath ? _self.parentPath : parentPath // ignore: cast_nullable_to_non_nullable
as NodePath?,
  ));
}

/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodePathCopyWith<$Res> get path {
  
  return $NodePathCopyWith<$Res>(_self.path, (value) {
    return _then(_self.copyWith(path: value));
  });
}/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodePathCopyWith<$Res>? get parentPath {
    if (_self.parentPath == null) {
    return null;
  }

  return $NodePathCopyWith<$Res>(_self.parentPath!, (value) {
    return _then(_self.copyWith(parentPath: value));
  });
}
}

// dart format on
