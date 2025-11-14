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

 String get title; String get url; NodePath get path;
/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NodeWithPathCopyWith<NodeWithPath> get copyWith => _$NodeWithPathCopyWithImpl<NodeWithPath>(this as NodeWithPath, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NodeWithPath'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('path', path));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodeWithPath&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,title,url,path);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NodeWithPath(title: $title, url: $url, path: $path)';
}


}

/// @nodoc
abstract mixin class $NodeWithPathCopyWith<$Res>  {
  factory $NodeWithPathCopyWith(NodeWithPath value, $Res Function(NodeWithPath) _then) = _$NodeWithPathCopyWithImpl;
@useResult
$Res call({
 String title, String url, NodePath path
});


$NodePathCopyWith<$Res> get path;

}
/// @nodoc
class _$NodeWithPathCopyWithImpl<$Res>
    implements $NodeWithPathCopyWith<$Res> {
  _$NodeWithPathCopyWithImpl(this._self, this._then);

  final NodeWithPath _self;
  final $Res Function(NodeWithPath) _then;

/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? url = null,Object? path = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as NodePath,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( Normal value)?  $default,{TResult Function( Root value)?  root,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Normal() when $default != null:
return $default(_that);case Root() when root != null:
return root(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( Normal value)  $default,{required TResult Function( Root value)  root,}){
final _that = this;
switch (_that) {
case Normal():
return $default(_that);case Root():
return root(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( Normal value)?  $default,{TResult? Function( Root value)?  root,}){
final _that = this;
switch (_that) {
case Normal() when $default != null:
return $default(_that);case Root() when root != null:
return root(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String url,  NodePath path,  NodeWithPath parent)?  $default,{TResult Function( String title,  String url,  NodePath path)?  root,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Normal() when $default != null:
return $default(_that.title,_that.url,_that.path,_that.parent);case Root() when root != null:
return root(_that.title,_that.url,_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String url,  NodePath path,  NodeWithPath parent)  $default,{required TResult Function( String title,  String url,  NodePath path)  root,}) {final _that = this;
switch (_that) {
case Normal():
return $default(_that.title,_that.url,_that.path,_that.parent);case Root():
return root(_that.title,_that.url,_that.path);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String url,  NodePath path,  NodeWithPath parent)?  $default,{TResult? Function( String title,  String url,  NodePath path)?  root,}) {final _that = this;
switch (_that) {
case Normal() when $default != null:
return $default(_that.title,_that.url,_that.path,_that.parent);case Root() when root != null:
return root(_that.title,_that.url,_that.path);case _:
  return null;

}
}

}

/// @nodoc


class Normal with DiagnosticableTreeMixin implements NodeWithPath {
  const Normal({required this.title, required this.url, required this.path, required this.parent});
  

@override final  String title;
@override final  String url;
@override final  NodePath path;
 final  NodeWithPath parent;

/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NormalCopyWith<Normal> get copyWith => _$NormalCopyWithImpl<Normal>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NodeWithPath'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('parent', parent));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Normal&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.path, path) || other.path == path)&&(identical(other.parent, parent) || other.parent == parent));
}


@override
int get hashCode => Object.hash(runtimeType,title,url,path,parent);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NodeWithPath(title: $title, url: $url, path: $path, parent: $parent)';
}


}

/// @nodoc
abstract mixin class $NormalCopyWith<$Res> implements $NodeWithPathCopyWith<$Res> {
  factory $NormalCopyWith(Normal value, $Res Function(Normal) _then) = _$NormalCopyWithImpl;
@override @useResult
$Res call({
 String title, String url, NodePath path, NodeWithPath parent
});


@override $NodePathCopyWith<$Res> get path;$NodeWithPathCopyWith<$Res> get parent;

}
/// @nodoc
class _$NormalCopyWithImpl<$Res>
    implements $NormalCopyWith<$Res> {
  _$NormalCopyWithImpl(this._self, this._then);

  final Normal _self;
  final $Res Function(Normal) _then;

/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? url = null,Object? path = null,Object? parent = null,}) {
  return _then(Normal(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as NodePath,parent: null == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as NodeWithPath,
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
$NodeWithPathCopyWith<$Res> get parent {
  
  return $NodeWithPathCopyWith<$Res>(_self.parent, (value) {
    return _then(_self.copyWith(parent: value));
  });
}
}

/// @nodoc


class Root with DiagnosticableTreeMixin implements NodeWithPath {
  const Root({required this.title, required this.url, required this.path});
  

@override final  String title;
@override final  String url;
@override final  NodePath path;

/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RootCopyWith<Root> get copyWith => _$RootCopyWithImpl<Root>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'NodeWithPath.root'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('path', path));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Root&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,title,url,path);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'NodeWithPath.root(title: $title, url: $url, path: $path)';
}


}

/// @nodoc
abstract mixin class $RootCopyWith<$Res> implements $NodeWithPathCopyWith<$Res> {
  factory $RootCopyWith(Root value, $Res Function(Root) _then) = _$RootCopyWithImpl;
@override @useResult
$Res call({
 String title, String url, NodePath path
});


@override $NodePathCopyWith<$Res> get path;

}
/// @nodoc
class _$RootCopyWithImpl<$Res>
    implements $RootCopyWith<$Res> {
  _$RootCopyWithImpl(this._self, this._then);

  final Root _self;
  final $Res Function(Root) _then;

/// Create a copy of NodeWithPath
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? url = null,Object? path = null,}) {
  return _then(Root(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as NodePath,
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
}
}

// dart format on
