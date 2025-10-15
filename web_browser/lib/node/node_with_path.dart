import 'node.dart';

/// パスIDを持つノードクラス
///
/// ツリー構造内でのノードの位置を一意に識別するパスIDを持つ
class NodeWithPath extends Node {
  final String url;
  final String path;

  /// コンストラクタ
  ///
  /// [name] ノードの名前
  /// [url] ノードに紐づくURL
  /// [parent] 親ノード
  /// [isRoot] ルートノードかどうか（デフォルト: false）
  NodeWithPath({
    required String name,
    required this.url,
    NodeWithPath? parent,
    bool isRoot = false,
  })  : path = isRoot ? "0" : _calculatePath(parent),
        super(name, parent);

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

  /// ノードの深さを取得（ルートは0）
  int get depth {
    if (path == "0") return 0;
    return path.split('-').length - 1;
  }

  /// NodeWithPathの子ノードリストを取得
  @override
  List<NodeWithPath> get children => 
      super.children.whereType<NodeWithPath>().toList();

  @override
  String toString() => '$name (path: $path)';
}
