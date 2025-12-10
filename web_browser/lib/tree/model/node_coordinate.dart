import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_coordinate.freezed.dart';

/// Group内の個別ノードの描画座標を表すモデル
@freezed
abstract class NodeCoordinate with _$NodeCoordinate {
  const NodeCoordinate._();

  const factory NodeCoordinate({
    /// X座標（水平位置、画面上のピクセル位置）
    required double x,
    
    /// Y座標（垂直位置、画面上のピクセル位置）
    required double y,
  }) = _NodeCoordinate;
}
