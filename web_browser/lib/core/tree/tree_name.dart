import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_name.freezed.dart';

/// Treeの名前を表すクラス
/// バリデーションや将来的な拡張のために定義
@freezed
abstract class TreeName with _$TreeName {
  const factory TreeName(String name) = _TreeName;
}
