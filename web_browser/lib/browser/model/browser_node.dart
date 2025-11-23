import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'browser_node.freezed.dart';

/// パスIDを持つノードクラス
///
/// ツリー構造内でのノードの位置を一意に識別するパスIDを持つ
@freezed
abstract class BrowserNode with _$BrowserNode {

  const BrowserNode._();

  /// ## プロパティ
  ///
  /// `title` ノードの名前
  ///
  /// `url` ノードに紐づくURL
  ///
  /// `parentPath` 親ノードのパス。nullable
  ///
  /// `children` 子ノードのリスト
  ///
  const factory BrowserNode({
    required String title,
    required String url,
  }) = _BrowserNode;


/// ルートノードを作成するファクトリメソッド
  factory BrowserNode.root({
    required String title,
    required String url,
  }) {
    return BrowserNode(
      title: title,
      url: url,
    );
  }
}
