import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/browser/model/node_path.dart';

part 'node_with_path.freezed.dart';

/// パスIDを持つノードクラス
///
/// ツリー構造内でのノードの位置を一意に識別するパスIDを持つ
@freezed
sealed class NodeWithPath with _$NodeWithPath {
  /// ## プロパティ
  ///
  /// `name` ノードの名前
  ///
  /// `url` ノードに紐づくURL
  ///
  /// `parentPath` 親ノードのパス。nullable
  ///
  /// `children` 子ノードのリスト
  ///
  const factory NodeWithPath({
    required String title,
    required String url,
    required NodePath path,
    required NodePath? parentPath,
  }) = _NodeWithPath;

}
