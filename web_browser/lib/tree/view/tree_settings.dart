import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_settings.freezed.dart';

@freezed
abstract class TreeSettings with _$TreeSettings {
  const factory TreeSettings({
    /// エレメントの幅
    @Default(10) double elementWidth,

    /// エレメント間の水平間隔
    @Default(5) double elementHorizontalSpacing,

    /// グループの両端のパディング（片側ずつ）
    @Default(20) double groupPadding,

    /// 一層の高さ
    @Default(15) double layerHeight,

    /// グループ間の垂直間隔（線が描画される場所）
    @Default(40) double groupVerticalSpacing,

    @Default(0.1) double minScale,

    @Default(5.0) double maxScale,
  }) = _TreeSettings;
}
