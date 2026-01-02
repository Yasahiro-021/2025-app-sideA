import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_settings.freezed.dart';

@freezed
abstract class TreeSettings with _$TreeSettings {
  const factory TreeSettings({
    /// エレメントの幅
    @Default(100) double elementWidth,

    //エレメントの余白
    @Default(8) double elementPadding,

    /// グループの余白
    @Default(10) double groupPadding,

    /// 一層の高さ
    @Default(100) double layerHeight,

    /// グループ間の垂直間隔（線が描画される場所）
    @Default(100) double groupVerticalSpacing,

    @Default(0.1) double minScale,

    @Default(5.0) double maxScale,
  }) = _TreeSettings;
}
