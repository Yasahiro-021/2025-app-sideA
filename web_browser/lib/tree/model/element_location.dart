import 'package:freezed_annotation/freezed_annotation.dart';
part 'element_location.freezed.dart';

@freezed
abstract class ElementLocation with _$ElementLocation {
  const factory ElementLocation({
    /// 要素の左上のX座標
    required double x,

    /// 要素の左上のY座標
    required double y,

    /// 要素の中心X座標
    required double centerX,

    /// 要素の下端Y座標
    required double bottomY,
  }) = _ElementLocation;
}