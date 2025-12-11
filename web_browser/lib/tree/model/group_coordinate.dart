import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_coordinate.freezed.dart';

/// ツリー上のグループ（特定のNodePathを親とする子ノード群）の描画座標を表すモデル
@freezed
abstract class GroupCoordinate with _$GroupCoordinate {
  const GroupCoordinate._();

  const factory GroupCoordinate({
    /// X座標（水平位置）
    required double x,
    
    /// Y座標（垂直位置、深さに基づく）
    required double y,
  }) = _GroupCoordinate;
}
