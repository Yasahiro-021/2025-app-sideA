// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomePageState implements DiagnosticableTreeMixin {

/// 検索履歴のリスト
 Future<List<History>> get historyList;/// 直近の履歴のリスト
 Future<List<History>> get recentHistoryList; Future<TreeId> Function(TreeName) get prepBrowse;
/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomePageStateCopyWith<HomePageState> get copyWith => _$HomePageStateCopyWithImpl<HomePageState>(this as HomePageState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomePageState'))
    ..add(DiagnosticsProperty('historyList', historyList))..add(DiagnosticsProperty('recentHistoryList', recentHistoryList))..add(DiagnosticsProperty('prepBrowse', prepBrowse));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePageState&&(identical(other.historyList, historyList) || other.historyList == historyList)&&(identical(other.recentHistoryList, recentHistoryList) || other.recentHistoryList == recentHistoryList)&&(identical(other.prepBrowse, prepBrowse) || other.prepBrowse == prepBrowse));
}


@override
int get hashCode => Object.hash(runtimeType,historyList,recentHistoryList,prepBrowse);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomePageState(historyList: $historyList, recentHistoryList: $recentHistoryList, prepBrowse: $prepBrowse)';
}


}

/// @nodoc
abstract mixin class $HomePageStateCopyWith<$Res>  {
  factory $HomePageStateCopyWith(HomePageState value, $Res Function(HomePageState) _then) = _$HomePageStateCopyWithImpl;
@useResult
$Res call({
 Future<List<History>> historyList, Future<List<History>> recentHistoryList, Future<TreeId> Function(TreeName) prepBrowse
});




}
/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._self, this._then);

  final HomePageState _self;
  final $Res Function(HomePageState) _then;

/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? historyList = null,Object? recentHistoryList = null,Object? prepBrowse = null,}) {
  return _then(_self.copyWith(
historyList: null == historyList ? _self.historyList : historyList // ignore: cast_nullable_to_non_nullable
as Future<List<History>>,recentHistoryList: null == recentHistoryList ? _self.recentHistoryList : recentHistoryList // ignore: cast_nullable_to_non_nullable
as Future<List<History>>,prepBrowse: null == prepBrowse ? _self.prepBrowse : prepBrowse // ignore: cast_nullable_to_non_nullable
as Future<TreeId> Function(TreeName),
  ));
}

}


/// Adds pattern-matching-related methods to [HomePageState].
extension HomePageStatePatterns on HomePageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomePageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomePageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomePageState value)  $default,){
final _that = this;
switch (_that) {
case _HomePageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomePageState value)?  $default,){
final _that = this;
switch (_that) {
case _HomePageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Future<List<History>> historyList,  Future<List<History>> recentHistoryList,  Future<TreeId> Function(TreeName) prepBrowse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomePageState() when $default != null:
return $default(_that.historyList,_that.recentHistoryList,_that.prepBrowse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Future<List<History>> historyList,  Future<List<History>> recentHistoryList,  Future<TreeId> Function(TreeName) prepBrowse)  $default,) {final _that = this;
switch (_that) {
case _HomePageState():
return $default(_that.historyList,_that.recentHistoryList,_that.prepBrowse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Future<List<History>> historyList,  Future<List<History>> recentHistoryList,  Future<TreeId> Function(TreeName) prepBrowse)?  $default,) {final _that = this;
switch (_that) {
case _HomePageState() when $default != null:
return $default(_that.historyList,_that.recentHistoryList,_that.prepBrowse);case _:
  return null;

}
}

}

/// @nodoc


class _HomePageState with DiagnosticableTreeMixin implements HomePageState {
  const _HomePageState({required this.historyList, required this.recentHistoryList, required this.prepBrowse});
  

/// 検索履歴のリスト
@override final  Future<List<History>> historyList;
/// 直近の履歴のリスト
@override final  Future<List<History>> recentHistoryList;
@override final  Future<TreeId> Function(TreeName) prepBrowse;

/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomePageStateCopyWith<_HomePageState> get copyWith => __$HomePageStateCopyWithImpl<_HomePageState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomePageState'))
    ..add(DiagnosticsProperty('historyList', historyList))..add(DiagnosticsProperty('recentHistoryList', recentHistoryList))..add(DiagnosticsProperty('prepBrowse', prepBrowse));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomePageState&&(identical(other.historyList, historyList) || other.historyList == historyList)&&(identical(other.recentHistoryList, recentHistoryList) || other.recentHistoryList == recentHistoryList)&&(identical(other.prepBrowse, prepBrowse) || other.prepBrowse == prepBrowse));
}


@override
int get hashCode => Object.hash(runtimeType,historyList,recentHistoryList,prepBrowse);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomePageState(historyList: $historyList, recentHistoryList: $recentHistoryList, prepBrowse: $prepBrowse)';
}


}

/// @nodoc
abstract mixin class _$HomePageStateCopyWith<$Res> implements $HomePageStateCopyWith<$Res> {
  factory _$HomePageStateCopyWith(_HomePageState value, $Res Function(_HomePageState) _then) = __$HomePageStateCopyWithImpl;
@override @useResult
$Res call({
 Future<List<History>> historyList, Future<List<History>> recentHistoryList, Future<TreeId> Function(TreeName) prepBrowse
});




}
/// @nodoc
class __$HomePageStateCopyWithImpl<$Res>
    implements _$HomePageStateCopyWith<$Res> {
  __$HomePageStateCopyWithImpl(this._self, this._then);

  final _HomePageState _self;
  final $Res Function(_HomePageState) _then;

/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? historyList = null,Object? recentHistoryList = null,Object? prepBrowse = null,}) {
  return _then(_HomePageState(
historyList: null == historyList ? _self.historyList : historyList // ignore: cast_nullable_to_non_nullable
as Future<List<History>>,recentHistoryList: null == recentHistoryList ? _self.recentHistoryList : recentHistoryList // ignore: cast_nullable_to_non_nullable
as Future<List<History>>,prepBrowse: null == prepBrowse ? _self.prepBrowse : prepBrowse // ignore: cast_nullable_to_non_nullable
as Future<TreeId> Function(TreeName),
  ));
}


}

// dart format on
