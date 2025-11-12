import '../../node/node.dart';

/// パスIDを持つノードクラス
///
/// ツリー構造内でのノードの位置を一意に識別するパスIDを持つ
class NodeWithPath extends Node {
  /// 階層（ルート:0, 1階層:1, ...）
  int get depth {
    int d = 0;
    NodeWithPath? p = parent as NodeWithPath?;
    while (p != null) {
      d++;
      p = p.parent as NodeWithPath?;
    }
    return d;
  }
  final String url;
  final String path;

  /// コンストラクタ
  ///
  /// [name] ノードの名前
  ///
  /// [url] ノードに紐づくURL
  ///
  /// [parent] 親ノード
  NodeWithPath({
    required String name,
    required this.url,
    required NodeWithPath parent,
  }) : path = _calculatePath(parent),
       super(name, parent);

  NodeWithPath.root({
    required String name,
    required this.url,
  }) : path = "0",
       super(name);

  /// 親ノードからパスを計算
  static String _calculatePath(NodeWithPath? parent) {
    if (parent == null) return "";

    // 親の子ノードの数に基づいてパスを計算
    final childIndex = parent.children.length + 1;
    if (parent.path == "0") {
      return "1-$childIndex";
    } else {
      return "${parent.path}-$childIndex";
    }
  }

  /// 子ノードのパスIDを生成
  ///
  /// [childIndex] 子ノードのインデックス（1から始まる）
  /// 例: "1-1" の子は "1-1-1", "1-1-2"...
  String generateChildPath(int childIndex) {
    if (path == "0") {
      // ルートノードの子の場合
      return "1-$childIndex";
    } else {
      // それ以外の場合
      return "$path-$childIndex";
    }
  }

  /// NodeWithPathの子ノードリストを取得
  @override
  List<NodeWithPath> get children =>
      super.children.whereType<NodeWithPath>().toList();

  @override
  String toString() => '$name (path: $path)';
}
