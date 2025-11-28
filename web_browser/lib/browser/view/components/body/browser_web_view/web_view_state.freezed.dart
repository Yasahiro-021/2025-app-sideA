// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WebViewState {

 String get url;
/// Create a copy of WebViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebViewStateCopyWith<WebViewState> get copyWith => _$WebViewStateCopyWithImpl<WebViewState>(this as WebViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebViewState&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'WebViewState(url: $url)';
}


}

/// @nodoc
abstract mixin class $WebViewStateCopyWith<$Res>  {
  factory $WebViewStateCopyWith(WebViewState value, $Res Function(WebViewState) _then) = _$WebViewStateCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$WebViewStateCopyWithImpl<$Res>
    implements $WebViewStateCopyWith<$Res> {
  _$WebViewStateCopyWithImpl(this._self, this._then);

  final WebViewState _self;
  final $Res Function(WebViewState) _then;

/// Create a copy of WebViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WebViewState].
extension WebViewStatePatterns on WebViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WebViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WebViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WebViewState value)  $default,){
final _that = this;
switch (_that) {
case _WebViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WebViewState value)?  $default,){
final _that = this;
switch (_that) {
case _WebViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WebViewState() when $default != null:
return $default(_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url)  $default,) {final _that = this;
switch (_that) {
case _WebViewState():
return $default(_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url)?  $default,) {final _that = this;
switch (_that) {
case _WebViewState() when $default != null:
return $default(_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _WebViewState implements WebViewState {
  const _WebViewState({required this.url});
  

@override final  String url;

/// Create a copy of WebViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebViewStateCopyWith<_WebViewState> get copyWith => __$WebViewStateCopyWithImpl<_WebViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebViewState&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'WebViewState(url: $url)';
}


}

/// @nodoc
abstract mixin class _$WebViewStateCopyWith<$Res> implements $WebViewStateCopyWith<$Res> {
  factory _$WebViewStateCopyWith(_WebViewState value, $Res Function(_WebViewState) _then) = __$WebViewStateCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$WebViewStateCopyWithImpl<$Res>
    implements _$WebViewStateCopyWith<$Res> {
  __$WebViewStateCopyWithImpl(this._self, this._then);

  final _WebViewState _self;
  final $Res Function(_WebViewState) _then;

/// Create a copy of WebViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_WebViewState(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
