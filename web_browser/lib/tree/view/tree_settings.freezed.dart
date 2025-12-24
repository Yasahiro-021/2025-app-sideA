// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TreeSettings {

/// エレメントの幅
 double get elementWidth;/// エレメント間の水平間隔
 double get elementHorizontalSpacing;/// グループの両端のパディング（片側ずつ）
 double get groupPadding;/// 一層の高さ
 double get layerHeight;/// グループ間の垂直間隔（線が描画される場所）
 double get groupVerticalSpacing; double get minScale; double get maxScale;
/// Create a copy of TreeSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreeSettingsCopyWith<TreeSettings> get copyWith => _$TreeSettingsCopyWithImpl<TreeSettings>(this as TreeSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreeSettings&&(identical(other.elementWidth, elementWidth) || other.elementWidth == elementWidth)&&(identical(other.elementHorizontalSpacing, elementHorizontalSpacing) || other.elementHorizontalSpacing == elementHorizontalSpacing)&&(identical(other.groupPadding, groupPadding) || other.groupPadding == groupPadding)&&(identical(other.layerHeight, layerHeight) || other.layerHeight == layerHeight)&&(identical(other.groupVerticalSpacing, groupVerticalSpacing) || other.groupVerticalSpacing == groupVerticalSpacing)&&(identical(other.minScale, minScale) || other.minScale == minScale)&&(identical(other.maxScale, maxScale) || other.maxScale == maxScale));
}


@override
int get hashCode => Object.hash(runtimeType,elementWidth,elementHorizontalSpacing,groupPadding,layerHeight,groupVerticalSpacing,minScale,maxScale);

@override
String toString() {
  return 'TreeSettings(elementWidth: $elementWidth, elementHorizontalSpacing: $elementHorizontalSpacing, groupPadding: $groupPadding, layerHeight: $layerHeight, groupVerticalSpacing: $groupVerticalSpacing, minScale: $minScale, maxScale: $maxScale)';
}


}

/// @nodoc
abstract mixin class $TreeSettingsCopyWith<$Res>  {
  factory $TreeSettingsCopyWith(TreeSettings value, $Res Function(TreeSettings) _then) = _$TreeSettingsCopyWithImpl;
@useResult
$Res call({
 double elementWidth, double elementHorizontalSpacing, double groupPadding, double layerHeight, double groupVerticalSpacing, double minScale, double maxScale
});




}
/// @nodoc
class _$TreeSettingsCopyWithImpl<$Res>
    implements $TreeSettingsCopyWith<$Res> {
  _$TreeSettingsCopyWithImpl(this._self, this._then);

  final TreeSettings _self;
  final $Res Function(TreeSettings) _then;

/// Create a copy of TreeSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? elementWidth = null,Object? elementHorizontalSpacing = null,Object? groupPadding = null,Object? layerHeight = null,Object? groupVerticalSpacing = null,Object? minScale = null,Object? maxScale = null,}) {
  return _then(_self.copyWith(
elementWidth: null == elementWidth ? _self.elementWidth : elementWidth // ignore: cast_nullable_to_non_nullable
as double,elementHorizontalSpacing: null == elementHorizontalSpacing ? _self.elementHorizontalSpacing : elementHorizontalSpacing // ignore: cast_nullable_to_non_nullable
as double,groupPadding: null == groupPadding ? _self.groupPadding : groupPadding // ignore: cast_nullable_to_non_nullable
as double,layerHeight: null == layerHeight ? _self.layerHeight : layerHeight // ignore: cast_nullable_to_non_nullable
as double,groupVerticalSpacing: null == groupVerticalSpacing ? _self.groupVerticalSpacing : groupVerticalSpacing // ignore: cast_nullable_to_non_nullable
as double,minScale: null == minScale ? _self.minScale : minScale // ignore: cast_nullable_to_non_nullable
as double,maxScale: null == maxScale ? _self.maxScale : maxScale // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TreeSettings].
extension TreeSettingsPatterns on TreeSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TreeSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TreeSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TreeSettings value)  $default,){
final _that = this;
switch (_that) {
case _TreeSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TreeSettings value)?  $default,){
final _that = this;
switch (_that) {
case _TreeSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double elementWidth,  double elementHorizontalSpacing,  double groupPadding,  double layerHeight,  double groupVerticalSpacing,  double minScale,  double maxScale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TreeSettings() when $default != null:
return $default(_that.elementWidth,_that.elementHorizontalSpacing,_that.groupPadding,_that.layerHeight,_that.groupVerticalSpacing,_that.minScale,_that.maxScale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double elementWidth,  double elementHorizontalSpacing,  double groupPadding,  double layerHeight,  double groupVerticalSpacing,  double minScale,  double maxScale)  $default,) {final _that = this;
switch (_that) {
case _TreeSettings():
return $default(_that.elementWidth,_that.elementHorizontalSpacing,_that.groupPadding,_that.layerHeight,_that.groupVerticalSpacing,_that.minScale,_that.maxScale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double elementWidth,  double elementHorizontalSpacing,  double groupPadding,  double layerHeight,  double groupVerticalSpacing,  double minScale,  double maxScale)?  $default,) {final _that = this;
switch (_that) {
case _TreeSettings() when $default != null:
return $default(_that.elementWidth,_that.elementHorizontalSpacing,_that.groupPadding,_that.layerHeight,_that.groupVerticalSpacing,_that.minScale,_that.maxScale);case _:
  return null;

}
}

}

/// @nodoc


class _TreeSettings implements TreeSettings {
  const _TreeSettings({this.elementWidth = 10, this.elementHorizontalSpacing = 5, this.groupPadding = 20, this.layerHeight = 15, this.groupVerticalSpacing = 40, this.minScale = 0.1, this.maxScale = 5.0});
  

/// エレメントの幅
@override@JsonKey() final  double elementWidth;
/// エレメント間の水平間隔
@override@JsonKey() final  double elementHorizontalSpacing;
/// グループの両端のパディング（片側ずつ）
@override@JsonKey() final  double groupPadding;
/// 一層の高さ
@override@JsonKey() final  double layerHeight;
/// グループ間の垂直間隔（線が描画される場所）
@override@JsonKey() final  double groupVerticalSpacing;
@override@JsonKey() final  double minScale;
@override@JsonKey() final  double maxScale;

/// Create a copy of TreeSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TreeSettingsCopyWith<_TreeSettings> get copyWith => __$TreeSettingsCopyWithImpl<_TreeSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TreeSettings&&(identical(other.elementWidth, elementWidth) || other.elementWidth == elementWidth)&&(identical(other.elementHorizontalSpacing, elementHorizontalSpacing) || other.elementHorizontalSpacing == elementHorizontalSpacing)&&(identical(other.groupPadding, groupPadding) || other.groupPadding == groupPadding)&&(identical(other.layerHeight, layerHeight) || other.layerHeight == layerHeight)&&(identical(other.groupVerticalSpacing, groupVerticalSpacing) || other.groupVerticalSpacing == groupVerticalSpacing)&&(identical(other.minScale, minScale) || other.minScale == minScale)&&(identical(other.maxScale, maxScale) || other.maxScale == maxScale));
}


@override
int get hashCode => Object.hash(runtimeType,elementWidth,elementHorizontalSpacing,groupPadding,layerHeight,groupVerticalSpacing,minScale,maxScale);

@override
String toString() {
  return 'TreeSettings(elementWidth: $elementWidth, elementHorizontalSpacing: $elementHorizontalSpacing, groupPadding: $groupPadding, layerHeight: $layerHeight, groupVerticalSpacing: $groupVerticalSpacing, minScale: $minScale, maxScale: $maxScale)';
}


}

/// @nodoc
abstract mixin class _$TreeSettingsCopyWith<$Res> implements $TreeSettingsCopyWith<$Res> {
  factory _$TreeSettingsCopyWith(_TreeSettings value, $Res Function(_TreeSettings) _then) = __$TreeSettingsCopyWithImpl;
@override @useResult
$Res call({
 double elementWidth, double elementHorizontalSpacing, double groupPadding, double layerHeight, double groupVerticalSpacing, double minScale, double maxScale
});




}
/// @nodoc
class __$TreeSettingsCopyWithImpl<$Res>
    implements _$TreeSettingsCopyWith<$Res> {
  __$TreeSettingsCopyWithImpl(this._self, this._then);

  final _TreeSettings _self;
  final $Res Function(_TreeSettings) _then;

/// Create a copy of TreeSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? elementWidth = null,Object? elementHorizontalSpacing = null,Object? groupPadding = null,Object? layerHeight = null,Object? groupVerticalSpacing = null,Object? minScale = null,Object? maxScale = null,}) {
  return _then(_TreeSettings(
elementWidth: null == elementWidth ? _self.elementWidth : elementWidth // ignore: cast_nullable_to_non_nullable
as double,elementHorizontalSpacing: null == elementHorizontalSpacing ? _self.elementHorizontalSpacing : elementHorizontalSpacing // ignore: cast_nullable_to_non_nullable
as double,groupPadding: null == groupPadding ? _self.groupPadding : groupPadding // ignore: cast_nullable_to_non_nullable
as double,layerHeight: null == layerHeight ? _self.layerHeight : layerHeight // ignore: cast_nullable_to_non_nullable
as double,groupVerticalSpacing: null == groupVerticalSpacing ? _self.groupVerticalSpacing : groupVerticalSpacing // ignore: cast_nullable_to_non_nullable
as double,minScale: null == minScale ? _self.minScale : minScale // ignore: cast_nullable_to_non_nullable
as double,maxScale: null == maxScale ? _self.maxScale : maxScale // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
